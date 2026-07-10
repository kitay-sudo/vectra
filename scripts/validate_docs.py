#!/usr/bin/env python3
"""Validate VECTRA repository structure, local links, versions, and spec sections."""

from __future__ import annotations

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
REQUIRED_SECTIONS = (
    "Purpose",
    "Definitions",
    "Rules",
    "Responsibilities",
    "Workflow",
    "Example",
    "Anti-patterns",
    "Best practices",
    "Related specifications",
)
LINK_RE = re.compile(r"(?<!!)\[[^]]+\]\(([^)]+)\)")


def main() -> int:
    errors: list[str] = []
    version = (ROOT / "VERSION").read_text(encoding="utf-8").strip()
    specs = sorted((ROOT / "docs/specs").glob("VECTRA-*.md"))

    expected = {f"VECTRA-{number:03d}" for number in range(15)}
    found = {path.stem.split("-", 2)[0] + "-" + path.stem.split("-", 2)[1] for path in specs}
    if found != expected:
        errors.append(f"spec IDs differ: missing={sorted(expected-found)}, extra={sorted(found-expected)}")

    for path in specs:
        text = path.read_text(encoding="utf-8")
        if f"**Version:** {version}" not in text:
            errors.append(f"{path.relative_to(ROOT)}: version does not match {version}")
        headings = {match.group(1).strip().lower() for match in re.finditer(r"^## (.+)$", text, re.M)}
        for required in REQUIRED_SECTIONS:
            if not any(heading.startswith(required.lower()) for heading in headings):
                errors.append(f"{path.relative_to(ROOT)}: missing section {required}")

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
                errors.append(f"{path.relative_to(ROOT)}: link escapes repository: {target}")
                continue
            if not resolved.exists():
                errors.append(f"{path.relative_to(ROOT)}: broken link: {target}")

    tracked_text = "\n".join(path.read_text(encoding="utf-8") for path in ROOT.rglob("*.md"))
    for marker in ("TODO", "lorem ipsum"):
        if re.search(rf"\b{re.escape(marker)}\b", tracked_text, re.I):
            errors.append(f"unfinished marker found: {marker}")

    if errors:
        print("VECTRA validation failed:")
        for error in errors:
            print(f"- {error}")
        return 1
    print(f"VECTRA {version}: {len(specs)} specifications and all Markdown links are valid.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
