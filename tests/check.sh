#!/bin/sh
# Checks the copies embedded in SETUP.md match the standalone files.
set -e
cd "$(dirname "$0")/.."
fail=0
skill=$(awk '/<!-- skill:build-website:start -->/{f=1;next}/<!-- skill:build-website:end -->/{f=0}f' SETUP.md | sed '1d;$d')
[ "$skill" = "$(cat skills/build-website/SKILL.md)" ] || { echo "SETUP.md skill differs from skills/build-website/SKILL.md"; fail=1; }
tmpl=$(awk '/^```markdown$/{n++} n==1&&/^```markdown$/{f=1;next} f&&/^```$/{exit} f' SETUP.md)
[ "$tmpl" = "$(cat template/CLAUDE.md)" ] || { echo "SETUP.md CLAUDE.md template differs from template/CLAUDE.md"; fail=1; }
[ $fail = 0 ] && echo "ok: embedded copies match"
exit $fail
