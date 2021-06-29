#!/bin/bash
#
# Prerequisites:
# ```sh
# % sudo apt install python3-dev
# ```
if [[ -z "$VIRTUAL_ENV" ]]; then
  if type pipenv >/dev/null 2>&1; then
    echo pipenv run "$0" "$@"
    pipenv run "$0" "$@"
    exit $?
  fi
  echo "Please activate a virtualenv." >&2
  exit 1
fi

get-repo() {
  URL="$1"
  DIR="$2"
  if [[ -d "$DIR" ]]; then
    echo "Updating $DIR"
    (cd "$DIR"; git pull --rebase)
  else
    git clone "$URL" "$DIR"
  fi
}

get-repo https://android.googlesource.com/platform/external/noto-fonts aosp-noto-fonts
get-repo https://github.com/googlefonts/nototools.git nototools
# get-repo https://github.com/googlefonts/noto-cjk.git fonts/noto-cjk

(cd ./nototools
  pip3 install -r requirements.txt
  pip3 install -e .
)
