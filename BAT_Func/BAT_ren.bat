::-----------------------------------------------------------------------------
:: Creator Meir-Tools_2024 , Note by date 2024 , ref xxxx_xx_xx_notes
::-----------------------------------------------------------------------------
@ECHO OFF & TITLE Meir-Tools_2024 &set BATman=%USERPROFILE%\Documents\GitHub\Functions\BATman
::---------------------------------- Main--------------------------------------
	IF [%1] == [] GOTO MyLabel
	echo %0 &cd %0\..
	call %BATman% :Print_MAN_Logo
	ren %1 *.blk
EXIT /B 0 
:MyLabel 	:: TBD | need add alert notification for empty arguments
	call %BATman% :MAN_Print_Logo
	echo Drag and Drop on me
	CALL %BATman% :MAN_ShowMenu %0
	CALL :OPT%M% &REM replace here the IF %M%==1 GOTO OPT1 ...statements....

EXIT /B 0 
:OPTQ | Q - exit
	exit
EXIT /B 0