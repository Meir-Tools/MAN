::-------------------------------------------------------------------------------------------
:: Modifies on : 05-01-2023
:: By Meir.e
:: Menu in batch.
:: REF|https://github.com/Meir-E/MAN/blob/main/Menu_MAN.bat
::
::-----------------Run once , can run inly in batch file , Global----------------------------
@ECHO OFF & @SET ME=IR & TITLE Mei-R:MAN
::-------------------------------Main--------------------------------------------------------
:Main <> 
	CLS & call :Print_Logo
	:: Show Menu
	CALL :ShowMenu %0
	
GOTO :Main
GOTO :EOF
PAUSE
::------------------------------------Functions-----------------------------------------
:ConsolePrint <>
	setlocal
	<nul set /p "=%~1"
	endlocal
EXIT /B 0
:GetChar <res>
	setlocal
	:: 0123456789abcdefghijklmnopqrstuvwxyz , can change here what char are available,Mei-R
	for /F "tokens=1 delims=," %%a in ('"choice /N /C 0123456789abcdefghijklmnopqrstuvwxyz"') do (set "result=%%a")
	endlocal & set result=%result% & set %~1=%result%
EXIT /B 0
:GetCharRefresh <res>
	setlocal
	:: 0123456789abcdefghijklmnopqrstuvwxyz , can change here what char are available,Mei-R
	for /F "tokens=1 delims=," %%a in ('"choice /D T /T 2 /N /C 0123456789abcdefghijklmnopqrstuvwxyz"') do (set "result=%%a")
	endlocal & set result=%result% & set %~1=%result%
EXIT /B 0
:ShowMenu <file_path>	
	:Menu &REM Menu here
	:: Print Menu here
	FOR /f "skip=2 tokens=1-2 delims=|" %%a IN ('"findstr /R /C:":OPT" %1"') do (echo ^> %%b)
	call :ConsolePrint "test for printing: " & echo.
	CALL :ConsolePrint "Type 1, 2, 3, or 4 then press ENTER: " & echo. & CALL :GetCharRefresh M &REM 
	CALL :OPT%M% &REM replace here the IF %M%==1 GOTO OPT1 ...statements....
EXIT /B 0
:ConsolePrintColor <hexColorCode> <str>
	setlocal
	::need run once | REF | https://stackoverflow.com/questions/30025027/code-for-changing-colors-in-batch-how-is-it-working
	for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%m in (1) do rem"') do (set "BS_Char=%%a" ) & echo off &REM Generate the BS Character Method.
	call :ConsolePrint %BS_Char% > "%~2" &REM moves BS character
	findstr /v /a:%1 /R "^$" "%~2" nul
	del "%~2" > nul 2>&1i
	endlocal
	EXIT /B 0
:Print_Logo
	echo -----------------------------------------------------------
	echo "       @@@@        @@@.      @@@       #@*     @*      "      
	echo "       @@*@(      @&#@.     @@@@@      #@@     @#      "      
	echo "       @@ (@.    @@ #@.    @@   @@     #@*@    @#      "      
	echo "       @@  @@   @@  #@.   @@=====@@    #@* @   @#      "      
	echo "       @@   @@ (@   #@.  @@       @@   #@*  @ @@#      "      
	echo "       @@    @@@,   #@. @@         @@  #@     @@#      "
	echo ------=Meir-Tools=-----------------------------------------
EXIT /B 0
::------------------------------------Options----------------------------------------
:OPTW | W - write here something
	echo test 123 123 123
	pause
EXIT /B 0
:OPTS | S - write here something
	echo test 123 123 123
	pause
EXIT /B 0
:OPTQ | Q - exit
	echo test 123 123 123
	exit
EXIT /B 0
::------------------------------------END-------------------------------------------
