#!/usr/bin/env python3
"""Проверка структуры репозитория VECTRA, ссылок, версий, секций спецификаций и манифеста установки."""

from __future__ import annotations

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
REQUIRED_SECTIONS = (
    "Назначение",
    "Определения",
    "Правила",
    "Ответственность",
    "Процесс",
    "Пример",
    "Антипаттерны",
    "Лучшие практики",
    "Связанные спецификации",
)
VALID_PROFILES = frozenset({"core", "full"})
LINK_RE = re.compile(r"(?<!!)\[[^]]+\]\(([^)]+)\)")


def check_specs(version: str, errors: list[str]) -> int:
    specs = sorted((ROOT / "docs/specs").glob("VECTRA-*.md"))

    expected = {f"VECTRA-{number:03d}" for number in range(15)}
    found = {path.stem.split("-", 2)[0] + "-" + path.stem.split("-", 2)[1] for path in specs}
    if found != expected:
        errors.append(f"spec IDs differ: missing={sorted(expected-found)}, extra={sorted(found-expected)}")

    for path in specs:
        text = path.read_text(encoding="utf-8")
        if f"**Версия:** {version}" not in text:
            errors.append(f"{path.relative_to(ROOT)}: версия не совпадает с {version}")
        headings = {match.group(1).strip().lower() for match in re.finditer(r"^## (.+)$", text, re.M)}
        for required in REQUIRED_SECTIONS:
            if not any(heading.startswith(required.lower()) for heading in headings):
                errors.append(f"{path.relative_to(ROOT)}: отсутствует секция {required}")

    return len(specs)


def check_links(errors: list[str]) -> None:
    for path in ROOT.rglob("*.md"):
        text = path.read_text(encoding="utf-8")
        for raw_target in LINK_RE.findall(text):
            target = raw_target.split("#", 1)[0].strip()
            if not target or "://" in target or target.startswith("mailto:"):
                continue
            resolved = (path.parent / target).resolve()
            try:
                resolved.relative_to(ROOT)
            except ValueError:
                errors.append(f"{path.relative_to(ROOT)}: ссылка выходит за пределы репозитория: {target}")
                continue
            if not resolved.exists():
                errors.append(f"{path.relative_to(ROOT)}: битая ссылка: {target}")


def check_markers(errors: list[str]) -> None:
    tracked_text = "\n".join(path.read_text(encoding="utf-8") for path in ROOT.rglob("*.md"))
    for marker in ("TODO", "lorem ipsum"):
        if re.search(rf"\b{re.escape(marker)}\b", tracked_text, re.I):
            errors.append(f"найден незавершённый маркер: {marker}")


def check_manifest(errors: list[str]) -> int:
    """Манифест — единственный источник правды для install.sh и install.ps1.

    Расхождение манифеста с репозиторием ломает установку молча: скрипт
    запрашивает несуществующий файл и падает уже на машине пользователя.
    """
    manifest = ROOT / "install/manifest.txt"
    if not manifest.exists():
        errors.append("install/manifest.txt отсутствует")
        return 0

    destinations: set[str] = set()
    entries = 0

    for number, raw_line in enumerate(manifest.read_text(encoding="utf-8").splitlines(), start=1):
        line = raw_line.rstrip()
        if not line or line.lstrip().startswith("#"):
            continue

        fields = line.split("\t")
        if len(fields) != 3:
            errors.append(
                f"install/manifest.txt:{number}: ожидалось 3 поля через табуляцию, получено {len(fields)}"
            )
            continue

        profile, source, destination = fields
        entries += 1

        if profile not in VALID_PROFILES:
            errors.append(f"install/manifest.txt:{number}: неизвестный профиль {profile!r}")
        if not (ROOT / source).is_file():
            errors.append(f"install/manifest.txt:{number}: источник не найден: {source}")
        if destination in destinations:
            errors.append(f"install/manifest.txt:{number}: назначение повторяется: {destination}")
        destinations.add(destination)

    bootstrap = ROOT / "install/bootstrap.md"
    if not bootstrap.exists():
        errors.append("install/bootstrap.md отсутствует")
    else:
        text = bootstrap.read_text(encoding="utf-8")
        for marker in ("vectra:start", "vectra:end"):
            if marker not in text:
                errors.append(f"install/bootstrap.md: нет маркера {marker}")

    for script in ("install.sh", "install.ps1"):
        path = ROOT / script
        if not path.exists():
            errors.append(f"{script} отсутствует")
            continue
        script_text = path.read_text(encoding="utf-8")
        for needed in ("install/manifest.txt", "install/bootstrap.md"):
            if needed not in script_text:
                errors.append(f"{script}: не читает {needed}")

    return entries


def main() -> int:
    errors: list[str] = []
    version = (ROOT / "VERSION").read_text(encoding="utf-8").strip()

    spec_count = check_specs(version, errors)
    check_links(errors)
    check_markers(errors)
    entry_count = check_manifest(errors)

    if errors:
        print("Проверка VECTRA не пройдена:")
        for error in errors:
            print(f"- {error}")
        return 1

    print(
        f"VECTRA {version}: {spec_count} спецификаций, {entry_count} записей манифеста, "
        "все ссылки в Markdown корректны."
    )
    return 0


if __name__ == "__main__":
    sys.exit(main())
