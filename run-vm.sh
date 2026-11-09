#!/usr/bin/env bash
# Boots the newest ISO from ./out in QEMU. Usage: ./run-vm.sh [--bios]
set -euo pipefail
cd "$(dirname "$(readlink -f "$0")")"

iso="$(ls -t out/*.iso 2>/dev/null | head -n1 || true)"
[[ -n "$iso" ]] || { echo "No ISO in out/ — run ./build.sh first" >&2; exit 1; }

if [[ "${1:-}" == "--bios" ]]; then
    run_archiso -i "$iso"
else
    run_archiso -u -i "$iso"
fi
