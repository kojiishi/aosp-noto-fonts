#!/bin/bash
#
# Build Noto CJK for Android
#
MYDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
SRCDIR=$MYDIR/dist
OUTDIR=$MYDIR/dist/android
time (set -x;
  python3 "$MYDIR/aosp-noto-fonts/cjk/subset_noto_cjk.py" "$@" -v -o "$OUTDIR" "$SRCDIR"
)
#time (set -x; python3 "$MYDIR/nototools/nototools/android_patches.py" "$@")
