set -e -x

pacman -Syu --noconfirm mingw-w64-x86_64-python3-pip

which python
python --version
which pip
pip --version

pip -- install -r requirements.txt
pip -- install -e .
python -m pytest -- -k empty-rule .
