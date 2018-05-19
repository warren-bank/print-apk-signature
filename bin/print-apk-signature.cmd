@echo off
setlocal enabledelayedexpansion

if [%1]==[] (
  echo Error: Filepath to APK is undefined.
  exit /B 1
)

set apk_path="%~1"
set crt_path="META-INF/CERT.RSA"

if not [%2]==[] (
  set fingerprint=%~2
)

set tmp_dir="%~dp0.\.tmp"
if exist %tmp_dir% rmdir /Q /S %tmp_dir%
mkdir %tmp_dir%

7z x -o%tmp_dir% %apk_path% %crt_path% >NUL 2>&1

set crt_path=%tmp_dir%\%crt_path%
set crt_path=%crt_path:"\"=\%
set crt_path=%crt_path:\.\=\%
set crt_path=%crt_path:/=\%

if not defined fingerprint (
  keytool -printcert -file %crt_path%
) else (
  for /F "tokens=* delims=" %%L in ('keytool -printcert -file %crt_path%') do call :filter_line %%L
  if defined filtered_fingerprint echo !filtered_fingerprint!
)
goto done

:filter_line
  set line=%*
  set filtered_line=!line:%fingerprint%:=!
  if not "!line!"=="!filtered_line!" (
    set filtered_fingerprint=!filtered_line!
    set filtered_fingerprint=!filtered_fingerprint::=!
    set filtered_fingerprint=!filtered_fingerprint: =!
  )
  goto :eof

:done
rmdir /Q /S %tmp_dir%
endlocal
