@echo off
setlocal enabledelayedexpansion

REM Set the path to GitVersion.exe
set gitVersionPath=%~dp0gitversion-win-x64-5.6.4\GitVersion.exe

REM Run GitVersion and capture its output to get the project's version
for /f "delims=" %%i in ('"%gitVersionPath%" /showvariable FullSemVer') do set versionInfo=%%i

REM Extract project's version information from GitVersion output
for /f "tokens=*" %%v in ("!versionInfo!") do set version=%%v

REM Get the Git commit hash as the code version
for /f "delims=" %%c in ('git rev-parse --short HEAD') do set codeVersion=%%c

REM Get the current date and time
for /f "tokens=*" %%d in ('powershell -command "Get-Date -format yyyy-MM-ddTHH:mm:ss"') do set compileTime=%%d

REM Split the project's version to extract the version information
for /f "tokens=1-4 delims=+." %%a in ("!version!") do (
    set major=%%a
    set minor=%%b
    set commitDate=%%c
    set shortSha=%%d
)

REM Update the custom version file with the extracted version information, code version, and compile time
(
    echo {
    echo "Major": "!major!",
    echo "Minor": "!minor!",
    echo "CommitDate": "!commitDate!",
    echo "ShortSha": "!shortSha!",
    echo "codeVersion": "!codeVersion!",
    echo "compileTime": "!compileTime!"
    echo }
) > CustomVersionInfo.json

endlocal
