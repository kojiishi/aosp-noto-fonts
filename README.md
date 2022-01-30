# Build environment for ChromeOS/Android Noto CJK

## Preparations

Create a `virtualenv` environment:
```sh
python3 -m venv venv
source venv/bin/activate
```
or if you use `pipenv`:
```sh
pipenv shell
```

## Build

Create Noto CJK with the `chws` feature in the `dist` directory:
```sh
east-asian-spacing -o dist "$SRCDIR"/Noto{Sans,Serif}CJK-{Regular,Bold,Light}.ttc
```

Then run the following commands:
```sh
./install.sh
./build-tar.sh
./build-android.sh
```

To check the diff for Android:
```sh
./check-diff.sh
git diff
```
