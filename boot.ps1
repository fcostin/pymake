$ErrorActionPreference = "Stop"

$env:MSYS64_USR_BIN_DIR = "C:\tools\msys64\usr\bin\bash"
$env:PATH = "$env:MSYS64_USR_BIN_DIR" + ";" + "$env:PATH"
$env:MSYS64_BASH = "$env:MSYS64_USR_BIN_DIR" + "\bash.exe"

(get-command 'bash.exe').Path

"$env:MSYS64_BASH" -l -c 'logout'
if ($LASTEXITCODE -ne 0) { throw "nonzero exit code: $LASTEXITCODE" }
"$env:MSYS64_BASH" -l -c 'pacman -Syu --noconfirm mingw-w64-x86_64-python3-pip && logout'
if ($LASTEXITCODE -ne 0) { throw "nonzero exit code: $LASTEXITCODE" }

"$env:MSYS64_BASH" -c 'which python || true'
"$env:MSYS64_BASH" -c 'python --version || true'

"$env:MSYS64_BASH" -c 'python -m pip -- install -r requirements.txt'
if ($LASTEXITCODE -ne 0) { throw "nonzero exit code: $LASTEXITCODE" }
"$env:MSYS64_BASH" -c 'python -m pip -- install -e .'
if ($LASTEXITCODE -ne 0) { throw "nonzero exit code: $LASTEXITCODE" }
"$env:MSYS64_BASH" -c 'python -m pytest -- -k empty-rule .'
if ($LASTEXITCODE -ne 0) { throw "nonzero exit code: $LASTEXITCODE" }
