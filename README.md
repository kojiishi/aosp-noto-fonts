# Build environment for ChromeOS/Android Noto CJK

Create a `virtualenv` environment:
```sh
python3 -m venv venv
source venv/bin/activate
```
or if you use `pipenv`:
```sh
pipenv shell
```

Then run the following commands:
```sh
./install.sh
./build-tar.sh
./build-android.sh
```
