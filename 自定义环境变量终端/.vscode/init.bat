@echo off

if "%CMAKE_PATH%" == "" (
    set CMAKE_PATH=%~dp0
    echo CMAKE_PATH not set. Setting to %~dp0
)

if "%MINGW_PATH%" == "" (
    set MINGW_PATH=%~dp0
    echo MINGW_PATH not set. Setting to %~dp0
)

set PATH=%CMAKE_PATH%;%MINGW_PATH%;%PATH%
