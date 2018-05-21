@echo off

call "C:\PortableApps\Java\env.bat"

set PATH=%~dp0..\bin;%PATH%

set __cmdcmdline=%cmdcmdline%
set __cmdcmdline=%__cmdcmdline:"=%
set __cmdcmdline=%__cmdcmdline: =%
set __cmdcmdline=%__cmdcmdline:~0,5%
if "%__cmdcmdline%"=="cmd/c" set CMD_INITIATED_FROM_EXPLORER=1
set __cmdcmdline=
