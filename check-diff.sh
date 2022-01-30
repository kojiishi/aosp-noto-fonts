#!/bin/bash
#
# Build diff for Noto CJK for Android
#
MYDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
SRCDIR=$MYDIR/dist
OUTDIR=$MYDIR/dist/android
DIFFDIR=$MYDIR/diff
east-asian-spacing dump "$@" -o "$DIFFDIR" --diff "$SRCDIR" "$OUTDIR"/*
