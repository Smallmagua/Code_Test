@echo off
setlocal enabledelayedexpansion

REM Set the path to GitVersion.exe (Modify the path accordingly)
set gitVersionPath=%~dp0gitversion-win-x64-5.6.4\GitVersion.exe

REM Run GitVersion and capture its output
for /f "delims=" %%i in ('"%gitVersionPath%" /showvariable FullSemVer') do set versionInfo=%%i

REM Extract version number from GitVersion output
for /f "tokens=*" %%v in ("!versionInfo!") do set version=%%v

REM Update the custom version file with the extracted version
echo { "version": "!version!" } > CustomVersionInfo.json

endlocal
