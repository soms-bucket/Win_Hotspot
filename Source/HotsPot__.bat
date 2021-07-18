@echo off
::mode 45:60
title HOTSPOT
:main
echo ][*************************][*************************][
echo ][                         ][                         ][
cecho ][  {0B}S. START Hotspot{#}       ][  {0E}E. ENABLE Hotspot{#}      ][{\n}
echo ][                         ][                         ][
echo ][*************************][*************************][
echo ][                         ][                         ][
cecho ][  {0B}D. DISABLE Hotspot{#}     ][  {0E}C. CHECK Status{#}        ][{\n}
echo ][                         ][                         ][
echo ][*************************][*************************][
echo ][                         ][                         ][
cecho ][ {0D}     I. JUMP to CMD{#}     ][ {0D} W. Connect to WiFi {#}    ][      {\n}
echo ][                         ][                         ][
echo ][*************************][*************************][
echo ][                                                    ][
cecho ][            {0C}          Q. EXIT {#}                      ][    {\n}
echo ][                                                    ][
echo ][*************************][*************************][
echo.


set /p env=Type your option [S,D,C,I,E,Q] then press ENTER: || set env="0"
echo.
if /I %env%==S goto active
if /I %env%==E goto enable
if /I %env%==D goto disable
if /I %env%==C goto check
if /I %env%==I goto prompt
if /I %env%==W goto wifi
if /I %env%==Q goto exit

cecho {0C}%env% is not a valid option. Please try again! {#}{\n}
PING localhost -n 2 >nul
cls
goto main

:active
set id=my_wifi

set /p id=write your wifi name=
echo.
echo Your wifi name= %id%
echo.
set pwd=12345678

set /p pwd=write password=
echo.
echo Your Password= %pwd%
echo.
netsh wlan set hostednetwork mode=allow ssid= %id% key= %pwd%
echo.
netsh wlan start hostednetwork 
echo.
pause
ncpa.cpl
cls
goto main
:enable
netsh wlan start hostednetwork
echo.
pause
cls
goto main
:disable
netsh wlan stop hostednetwork
echo.
pause
cls
goto main
:check
netsh wlan show hostednetwork
echo.
pause
cls
goto main
:wifi
netsh wlan connect name="evil_com!"
echo.
pause
cls
goto main
:prompt
cmd
echo.
pause
cls
goto main
:exit
cecho {fc}Are you sure to EXIT! {#}{\n}
echo.
pause
exit

pause
cls
goto main






