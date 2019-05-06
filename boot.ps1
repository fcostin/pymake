$ErrorActionPreference = "Stop"

$env:MSYS64_USR_BIN_DIR = "C:\tools\msys64\usr\bin"
$env:PATH = "$env:MSYS64_USR_BIN_DIR" + ";" + "$env:PATH"
$env:MSYS64_BASH = "$env:MSYS64_USR_BIN_DIR" + "\bash.exe"
$env:MSYS64_BOOT_SCRIPT = "$env:TRAVIS_BUILD_DIR" + "\boot.sh"

(get-command 'bash.exe').Path

& "$env:MSYS64_BASH" -l -c 'logout'
if ($LASTEXITCODE -ne 0) { throw "nonzero exit code: $LASTEXITCODE" }
& "$env:MSYS64_BASH" -c "$env:MSYS64_BOOT_SCRIPT"
if ($LASTEXITCODE -ne 0) { throw "nonzero exit code: $LASTEXITCODE" }
