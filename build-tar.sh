#!/bin/bash
#
# Build tar.bz2 for ChromeOS
#
MYDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
BUILDDIR=$MYDIR/dist

NAME=$1
if [ -z "$NAME" ]; then
  NAME=noto-cjk-$(date +%Y%m%d)
fi

rm -rf "$BUILDDIR/$NAME" "$BUILDDIR/$NAME.tar" "$BUILDDIR/$NAME.tar.bz2"
mkdir -p "$BUILDDIR/$NAME"
(set -x;
  cd "$BUILDDIR"
  cp LICENSE Noto{Sans,Serif}CJK-{Bold,Light,Regular}.ttc "$NAME"
  ls -l "$NAME"
  tar cf "$NAME.tar" "$NAME"
  bzip2 -9 -k -f "$NAME.tar"
)

rm -rf "$BUILDDIR/$NAME" "$BUILDDIR/$NAME.tar"
