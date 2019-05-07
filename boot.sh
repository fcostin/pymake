set -e -x

cd "$TRAVIS_BUILD_DIR"

pacman -Syu --noconfirm mingw-w64-x86_64-python3-pip

pacman -Ql mingw-w64-x86_64-python3-pip
pacman -Ql mingw-w64-x86_64-python3

which python3
python3 --version

pwd
ls -l

python3 -m pip -- install -r requirements.txt
python3 -m pip -- install -e .
python3 -m pytest -- -k empty-rule .
