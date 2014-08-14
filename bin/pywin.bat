@@echo off

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
		SETLOCAL 
		set COMMAND=%1
		SHIFT
		call %PYWIN_HOME%\lib\commands\%COMMAND:~2% %*
		ENDLOCAL
		goto end
	)
)
goto BadCommand

:Help
echo --versions 
echo     Displays a list of Python versions available for install
echo --installed 
echo     Displays a list of installed Pythons
echo --current 
echo     Displays the current Python in use
echo install <version> 
echo     Installs that version of Python
echo use <version>
echo     Switches to the specificed Python version, if it is installed

:Commands
for %%f in (%PYWIN_HOME%\lib\commands\*.bat) do (
	echo %%~nf
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