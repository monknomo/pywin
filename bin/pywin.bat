@@echo off
SETLOCAL 
IF "%1"=="" (
	goto EmptyCommand
) ELSE (
	IF "%1"=="--commands" (
		goto Commands
	) ELSE (
		IF "%1"=="--help" (
			goto Help
		)
	)
)

FOR %%f IN (%PYWIN_HOME%\lib\commands\*.bat) DO (
	IF "%1"=="--%%~nf" (
		call %PYWIN_HOME%\lib\commands\%%~nf %*		
		goto end
	)
)
goto BadCommand

:Help
echo --commands
echo     Displays a list of commands
FOR %%f IN (%PYWIN_HOME%\lib\commands\*.bat) DO (
		call %PYWIN_HOME%\lib\commands\%%~nxf null --help
)
echo --help
echo     Displays this help dialog
goto End

:Commands
for %%f in (%PYWIN_HOME%\lib\commands\*.bat) do (
	echo --%%~nf
)
goto End

:EmptyCommand
echo You must supply a command or argument
echo Try --help for a list of commands
goto End

:BadCommand
echo %1 is not a recognized command
echo Try --help for a list of commands
goto End

:End
ENDLOCAL