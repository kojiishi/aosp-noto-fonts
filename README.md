# Build environment for Android/ChromeOS Noto CJK

## Preparations

If you use `pipenv` (preferred):
```sh
pipenv shell
```
Otherwise, you can create a `virtualenv` environment manually:
```sh
python3 -m venv venv
source venv/bin/activate
```

Then update dependencies by running the following command:
```sh
./install.sh
```

## Build

Create Noto CJK with the `chws` feature in the `dist` directory:
```sh
east-asian-spacing -o dist "$SRCDIR"/Noto{Sans,Serif}CJK-{Regular,Bold,Light}.ttc
```

### Android

Run the following commands:
```sh
./build-android.sh
```

To check the diff for Android:
```sh
./check-diff.sh
git diff
```

### ChromeOS

To build a `.tar.bz2` file for ChromeOS:
```sh
./build-tar.sh
```
