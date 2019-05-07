# set -e -x

cd "$TRAVIS_BUILD_DIR"

pacman -Syu --noconfirm mingw-w64-x86_64-python3-pip

pacman -Ql mingw-w64-x86_64-python3-pip
pacman -Ql mingw-w64-x86_64-python3

export PATH=/mingw64/bin/:$PATH

echo $PATH

which pacman
which python3.exe
which pip3.exe


python3.exe -m pip -- install -r requirements.txt
python3.exe -m pip -- install -e .
python3.exe -m pytest -- -k empty-rule .
