@echo off
setlocal enabledelayedexpansion

if [%1]==[] (
  echo Error: Filepath to APK is undefined.
  exit /B 1
)

set apk_path="%~1"

if not [%2]==[] (
  set fingerprint=%~2

  if not "%fingerprint%"=="MD5" if not "%fingerprint%"=="SHA-1" if not "%fingerprint%"=="SHA-256" (
    echo Error: fingerprint_hash_algorithm is invalid.
    exit /B 1
  )
)

set apksigner_jar="%~dp0..\libs\apksigner\apksigner.jar"

if not defined fingerprint (
  java -jar %apksigner_jar% verify --print-certs %apk_path%
) else (
  for /F "tokens=* delims=" %%L in ('java -jar %apksigner_jar% verify --print-certs %apk_path%') do call :filter_line %%L
  if defined filtered_fingerprint echo !filtered_fingerprint!
)
goto done

:filter_line
  set line=%*
  set filtered_line=!line:Signer #1 certificate %fingerprint% digest:=!
  if not "!line!"=="!filtered_line!" (
    set filtered_fingerprint=!filtered_line!
    set filtered_fingerprint=!filtered_fingerprint: =!
  )
  goto :eof

:done
endlocal
