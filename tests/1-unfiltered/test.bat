@echo off

call "%~dp0..\env.bat"

set apk_path="%~dp0..\file.apk"

call print-apk-signature %apk_path%

if defined CMD_INITIATED_FROM_EXPLORER (
  echo.
  pause
)
