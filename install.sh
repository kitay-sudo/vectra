#!/bin/sh
# Vectra — установка рабочих документов в проект.
#
#   curl -fsSL https://raw.githubusercontent.com/kitay-sudo/vectra/main/install.sh | sh
#
# Скрипт скачивает только файлы, перечисленные в install/manifest.txt.
# Диаграммы, лендинг, примеры и спецификации остаются в репозитории стандарта.

set -eu

REPO="${VECTRA_REPO:-kitay-sudo/vectra}"
REF="${VECTRA_REF:-main}"
PROFILE="core"
TARGET="."
FORCE=0

usage() {
	cat <<'EOF'
Vectra — установка рабочих документов.

Использование:
  curl -fsSL .../install.sh | sh
  curl -fsSL .../install.sh | sh -s -- [опции]

Опции:
  --profile core|full   Набор шаблонов. core — рабочий минимум (по умолчанию),
                        full — плюс условные шаблоны.
  --dir <путь>          Каталог проекта. По умолчанию текущий.
  --ref <ref>           Тег, ветка или коммит стандарта. По умолчанию main.
  --force               Перезаписывать существующие файлы.
  --help                Показать эту справку.

После установки правила Vectra попадают в AGENTS.md (и CLAUDE.md для
Claude Code) в корне проекта, поэтому в новой сессии агент следует им
автоматически, без вставки команд. Существующий агентский файл не
перезаписывается — блок дописывается между маркерами vectra.

Переменные окружения: VECTRA_REPO, VECTRA_REF, VECTRA_BASE.
EOF
}

die() {
	printf '  ошибка: %s\n' "$1" >&2
	exit 1
}

while [ $# -gt 0 ]; do
	case "$1" in
	--profile)
		[ $# -ge 2 ] || die "--profile требует значение"
		PROFILE="$2"
		shift 2
		;;
	--dir)
		[ $# -ge 2 ] || die "--dir требует значение"
		TARGET="$2"
		shift 2
		;;
	--ref)
		[ $# -ge 2 ] || die "--ref требует значение"
		REF="$2"
		shift 2
		;;
	--force)
		FORCE=1
		shift
		;;
	--help | -h)
		usage
		exit 0
		;;
	*) die "неизвестная опция: $1 (--help для справки)" ;;
	esac
done

case "$PROFILE" in
core | full) ;;
*) die "профиль должен быть core или full, получено: $PROFILE" ;;
esac

if command -v curl >/dev/null 2>&1; then
	fetch() { curl -fsSL "$1"; }
elif command -v wget >/dev/null 2>&1; then
	fetch() { wget -qO- "$1"; }
else
	die "нужен curl или wget"
fi

BASE="${VECTRA_BASE:-https://raw.githubusercontent.com/${REPO}/${REF}}"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT INT TERM

[ -d "$TARGET" ] || die "каталог не найден: $TARGET"

printf '\n  Vectra · %s@%s → %s\n' "$REPO" "$REF" "$TARGET"
printf '  профиль: %s\n\n' "$PROFILE"

fetch "${BASE}/install/manifest.txt" >"$TMP/manifest" ||
	die "не удалось получить манифест (проверьте --ref ${REF})"

installed=0
skipped=0
TAB="$(printf '\t')"

while IFS="$TAB" read -r line_profile source destination; do
	case "$line_profile" in
	'' | \#*) continue ;;
	esac
	[ -n "${destination:-}" ] || continue
	[ "$line_profile" = "core" ] || [ "$PROFILE" = "full" ] || continue

	full_path="${TARGET%/}/${destination}"

	if [ -e "$full_path" ] && [ "$FORCE" -eq 0 ]; then
		printf '  ~ %-28s уже существует, пропущен\n' "$destination"
		skipped=$((skipped + 1))
		continue
	fi

	fetch "${BASE}/${source}" >"$TMP/payload" || die "не удалось скачать ${source}"
	[ -s "$TMP/payload" ] || die "пустой файл: ${source}"

	mkdir -p "$(dirname "$full_path")"
	cp "$TMP/payload" "$full_path"
	printf '  + %s\n' "$destination"
	installed=$((installed + 1))
done <"$TMP/manifest"

for dir in tasks decisions; do
	if [ ! -d "${TARGET%/}/${dir}" ]; then
		mkdir -p "${TARGET%/}/${dir}"
		: >"${TARGET%/}/${dir}/.gitkeep"
		printf '  + %s/\n' "$dir"
	fi
done

# Точка входа. Агенты сами читают AGENTS.md (Cursor, Codex, Claude Code) или
# CLAUDE.md (Claude Code) при старте сессии. Дописываем блок Vectra между
# маркерами, не перетирая существующий файл; повторный запуск ничего не дублирует.
inject_block() { # $1=файл  $2=payload  $3=подпись
	if [ -f "$1" ]; then
		if grep -q 'vectra:start' "$1" 2>/dev/null; then
			printf '  ~ %-28s блок Vectra уже есть\n' "$3"
			return
		fi
		printf '\n' >>"$1"
		cat "$2" >>"$1"
		printf '  ± %-28s дополнен блоком Vectra\n' "$3"
	else
		cat "$2" >"$1"
		printf '  + %s\n' "$3"
	fi
}

fetch "${BASE}/install/bootstrap.md" >"$TMP/bootstrap" || die "не удалось скачать install/bootstrap.md"
[ -s "$TMP/bootstrap" ] || die "пустой файл: install/bootstrap.md"
printf '%s\n' \
	'<!-- vectra:start · блок добавлен установщиком Vectra -->' \
	'@AGENTS.md' \
	'<!-- vectra:end -->' >"$TMP/claude"

inject_block "${TARGET%/}/AGENTS.md" "$TMP/bootstrap" "AGENTS.md"
inject_block "${TARGET%/}/CLAUDE.md" "$TMP/claude" "CLAUDE.md"

version="$(cat "${TARGET%/}/vectra/VERSION" 2>/dev/null || echo "?")"

printf '\n  Установлено файлов: %s, пропущено: %s. Vectra %s.\n' "$installed" "$skipped" "$version"
cat <<'EOF'

  Не скачивается: diagrams/, site/, examples/, docs/, .github/, scripts/,
  CHANGELOG.md, ROADMAP.md, CONTRIBUTING.md — это описание стандарта,
  а не рабочие документы проекта.

  Правила Vectra теперь в AGENTS.md и CLAUDE.md — агент подхватывает их
  сам в начале новой сессии. Отдельную команду вставлять не нужно.

  Дальше:
    1. Заполните PROJECT.md вместе с агентом.
    2. В новой сессии просто опишите задачу — агент уже работает по Vectra.
    3. Первую задачу заведите как tasks/TASK-001.md
       из шаблона vectra/templates/TASK.md.

EOF
