@echo off
setlocal

set "REPO_URL=https://github.com/aimythri1/Mythrigizmo.git"
set "NUKE_DIR=%USERPROFILE%\.nuke"
set "TOOLS_DIR=%NUKE_DIR%\Mythrigizmo"
set "USER_MENU=%NUKE_DIR%\menu.py"

echo Installing Mythrigizmo for Nuke...
echo.

if not exist "%NUKE_DIR%" mkdir "%NUKE_DIR%"

where git >nul 2>nul
if errorlevel 1 goto NO_GIT

if exist "%TOOLS_DIR%\.git" goto UPDATE_REPO
if exist "%TOOLS_DIR%" goto INSTALL_LOADER

echo Cloning Mythrigizmo into user .nuke folder...
git clone "%REPO_URL%" "%TOOLS_DIR%"
if errorlevel 1 goto FAIL
goto INSTALL_LOADER

:UPDATE_REPO
echo Mythrigizmo already exists. Updating from GitHub...
cd /d "%TOOLS_DIR%"
git pull
if errorlevel 1 goto FAIL
goto INSTALL_LOADER

:INSTALL_LOADER
echo Installing loader into user's .nuke/menu.py...

set "LOADER_B64=CiMgQkVHSU4gTXl0aHJpZ2l6bW8gTG9hZGVyCmltcG9ydCBvcwppbXBvcnQgbnVrZQoKX215dGhyaV9wYXRoID0gb3MucGF0aC5qb2luKG9zLnBhdGguZGlybmFtZShfX2ZpbGVfXyksICJNeXRocmlnaXptbyIpCl9teXRocmlfbWVudSA9IG9zLnBhdGguam9pbihfbXl0aHJpX3BhdGgsICJtZW51LnB5IikKCmlmIG9zLnBhdGguZXhpc3RzKF9teXRocmlfcGF0aCk6CiAgICBudWtlLnBsdWdpbkFkZFBhdGgoX215dGhyaV9wYXRoKQoKaWYgb3MucGF0aC5leGlzdHMoX215dGhyaV9tZW51KToKICAgIF9nbG9iYWxzID0geyJfX2ZpbGVfXyI6IF9teXRocmlfbWVudSwgIl9fbmFtZV9fIjogIl9fbXl0aHJpZ2l6bW9fbWVudV9fIn0KICAgIGV4ZWMoY29tcGlsZShvcGVuKF9teXRocmlfbWVudSwgInJiIikucmVhZCgpLCBfbXl0aHJpX21lbnUsICJleGVjIiksIF9nbG9iYWxzKQojIEVORCBNeXRocmlnaXptbyBMb2FkZXIK"

powershell -NoProfile -ExecutionPolicy Bypass -Command "$menu=$env:USERPROFILE + '\.nuke\menu.py'; $marker='# BEGIN Mythrigizmo Loader'; $b64=$env:LOADER_B64; $block=[Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($b64)); if (-not (Test-Path $menu)) { New-Item -ItemType File -Path $menu -Force | Out-Null }; $content=Get-Content -Path $menu -Raw -ErrorAction SilentlyContinue; if ($content -notlike ('*' + $marker + '*')) { Add-Content -Path $menu -Value $block; Write-Host 'Loader added to menu.py' } else { Write-Host 'Loader already exists in menu.py' }"

echo.
echo Done.
echo Restart Nuke and check: Nodes ^> Mythri Gizmos
pause
exit /b 0

:NO_GIT
echo ERROR: Git is not installed or not added to PATH.
echo Install Git first, then run this installer again.
pause
exit /b 1

:FAIL
echo ERROR: Install failed.
pause
exit /b 1
