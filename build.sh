#!/usr/bin/env bash
# Builds the ISO from ./profile into ./out. Usage: ./build.sh [--clean]
set -euo pipefail
cd "$(dirname "$(readlink -f "$0")")"

# mkarchiso skips steps already done in work/, so build with --clean after
# changing packages or airootfs.
if [[ "${1:-}" == "--clean" ]]; then
    sudo rm -rf work
fi

sudo mkarchiso -v -w work -o out profile
sudo chown -R "$(id -u):$(id -g)" out
ls -lh out/*.iso
