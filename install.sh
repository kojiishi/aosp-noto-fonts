#!/bin/bash
#
# Prerequisites:
# ```sh
# % sudo apt install python3-dev
# ```
if [[ -z "$VIRTUAL_ENV" ]]; then
  echo "Please activate a virtualenv." >&2
  exit 1
fi

if [[ ! -d ./aosp-noto-fonts ]]; then
  git clone https://android.googlesource.com/platform/external/noto-fonts aosp-noto-fonts
fi

if [[ ! -d ./nototools ]]; then
  git clone https://github.com/googlefonts/nototools.git
fi
(cd ./nototools
  pip3 install -r requirements.txt
  pip3 install -e .)
