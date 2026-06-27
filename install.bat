@echo off
setlocal

set "REPO_URL=https://github.com/aimythri1/Mythrigizmo.git"
set "NUKE_DIR=%USERPROFILE%\.nuke"
set "TOOLS_DIR=%NUKE_DIR%\Mythrigizmo"
set "USER_MENU=%NUKE_DIR%\menu.py"

echo Installing Mythrigizmo for Nuke...

if not exist "%NUKE_DIR%" (
    mkdir "%NUKE_DIR%"
)

where git >nul 2>nul
if errorlevel 1 (
    echo ERROR: Git is not installed or not added to PATH.
    echo Install Git first.
    pause
    exit /b 1
)

if exist "%TOOLS_DIR%\.git" (
    echo Mythrigizmo already exists. Updating...
    cd /d "%TOOLS_DIR%"
    git pull
) else (
    echo Cloning Mythrigizmo into .nuke folder...
    git clone "%REPO_URL%" "%TOOLS_DIR%"
)

if not exist "%USER_MENU%" (
    type nul > "%USER_MENU%"
)

findstr /C:"# BEGIN Mythrigizmo Loader" "%USER_MENU%" >nul
if errorlevel 1 (
    echo Adding Mythrigizmo loader to .nuke/menu.py...

    >> "%USER_MENU%" echo.
    >> "%USER_MENU%" echo # BEGIN Mythrigizmo Loader
    >> "%USER_MENU%" echo import os
    >> "%USER_MENU%" echo import nuke
    >> "%USER_MENU%" echo _mythri_path = os.path.join(os.path.dirname(__file__), "Mythrigizmo")
    >> "%USER_MENU%" echo _mythri_menu = os.path.join(_mythri_path, "menu.py")
    >> "%USER_MENU%" echo if os.path.exists(_mythri_path):
    >> "%USER_MENU%" echo     nuke.pluginAddPath(_mythri_path)
    >> "%USER_MENU%" echo if os.path.exists(_mythri_menu):
    >> "%USER_MENU%" echo     _globals = {"__file__": _mythri_menu, "__name__": "__mythrigizmo_menu__"}
    >> "%USER_MENU%" echo     exec(compile(open(_mythri_menu, "rb").read(), _mythri_menu, "exec"), _globals)
    >> "%USER_MENU%" echo # END Mythrigizmo Loader
) else (
    echo Mythrigizmo loader already exists in .nuke/menu.py
)

echo.
echo Done. Restart Nuke.
echo Menu will appear under Nodes ^> Mythri Gizmos
pause
