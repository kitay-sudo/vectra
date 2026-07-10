<#
.SYNOPSIS
  Vectra — установка рабочих документов в проект.

.DESCRIPTION
  Скачивает только файлы, перечисленные в install/manifest.txt.
  Диаграммы, лендинг, примеры и спецификации остаются в репозитории стандарта.

.EXAMPLE
  irm https://raw.githubusercontent.com/kitay-sudo/vectra/main/install.ps1 | iex

.EXAMPLE
  & ([scriptblock]::Create((irm https://raw.githubusercontent.com/kitay-sudo/vectra/main/install.ps1))) -Profile full
#>

[CmdletBinding()]
param(
    # Не называется $Profile: это автоматическая переменная PowerShell.
    [Alias('Profile')]
    [ValidateSet('core', 'full')]
    [string]$VectraProfile = 'core',

    [string]$Dir = '.',

    [string]$Ref = $(if ($env:VECTRA_REF) { $env:VECTRA_REF } else { 'main' }),

    [switch]$Force
)

$ErrorActionPreference = 'Stop'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$repo = if ($env:VECTRA_REPO) { $env:VECTRA_REPO } else { 'kitay-sudo/vectra' }
$base = "https://raw.githubusercontent.com/$repo/$Ref"

if (-not (Test-Path -LiteralPath $Dir -PathType Container)) {
    throw "каталог не найден: $Dir"
}
$target = (Resolve-Path -LiteralPath $Dir).Path

function Get-VectraFile([string]$Path) {
    try {
        Invoke-WebRequest -Uri "$base/$Path" -UseBasicParsing
    }
    catch {
        throw "не удалось скачать $Path (проверьте -Ref $Ref)"
    }
}

Write-Host ""
Write-Host "  Vectra · $repo@$Ref -> $target"
Write-Host "  профиль: $VectraProfile"
Write-Host ""

$manifest = (Get-VectraFile 'install/manifest.txt').Content -split "`r?`n"
$installed = 0
$skipped = 0

foreach ($line in $manifest) {
    if ($line -match '^\s*(#|$)') { continue }

    $fields = $line -split "`t"
    if ($fields.Count -lt 3) { continue }

    $lineProfile = $fields[0].Trim()
    $source = $fields[1].Trim()
    $destination = $fields[2].Trim()

    if ($lineProfile -ne 'core' -and $VectraProfile -ne 'full') { continue }

    $fullPath = Join-Path $target $destination

    if ((Test-Path -LiteralPath $fullPath) -and -not $Force) {
        Write-Host ("  ~ {0,-28} уже существует, пропущен" -f $destination)
        $skipped++
        continue
    }

    # RawContentStream, а не .Content: в PowerShell 5.1 .Content — строка,
    # и запись байтов сломала бы UTF-8.
    $bytes = (Get-VectraFile $source).RawContentStream.ToArray()
    if ($bytes.Length -eq 0) { throw "пустой файл: $source" }

    $parent = Split-Path -Parent $fullPath
    if ($parent -and -not (Test-Path -LiteralPath $parent)) {
        New-Item -ItemType Directory -Path $parent -Force | Out-Null
    }

    [IO.File]::WriteAllBytes($fullPath, $bytes)
    Write-Host "  + $destination"
    $installed++
}

foreach ($dir in @('tasks', 'decisions')) {
    $path = Join-Path $target $dir
    if (-not (Test-Path -LiteralPath $path)) {
        New-Item -ItemType Directory -Path $path -Force | Out-Null
        New-Item -ItemType File -Path (Join-Path $path '.gitkeep') | Out-Null
        Write-Host "  + $dir/"
    }
}

$versionFile = Join-Path $target 'vectra/VERSION'
$version = if (Test-Path -LiteralPath $versionFile) { (Get-Content -LiteralPath $versionFile -Raw).Trim() } else { '?' }

Write-Host ""
Write-Host "  Установлено файлов: $installed, пропущено: $skipped. Vectra $version."
Write-Host @"

  Не скачивается: diagrams/, site/, examples/, docs/, .github/, scripts/,
  CHANGELOG.md, ROADMAP.md, CONTRIBUTING.md — это описание стандарта,
  а не рабочие документы проекта.

  Дальше:
    1. Заполните PROJECT.md вместе с агентом.
    2. Дайте агенту прочитать vectra/AGENTS.md.
    3. Первую задачу заведите как tasks/TASK-001.md
       из шаблона vectra/templates/TASK.md.

"@
