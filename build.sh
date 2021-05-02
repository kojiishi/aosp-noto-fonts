#!/bin/bash
MYDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
time (set -x; python3 "$MYDIR/aosp-noto-fonts/cjk/subset_noto_cjk.py" "$@")
#time (set -x; python3 "$MYDIR/nototools/nototools/android_patches.py" "$@")
