@@echo off

SETLOCAL 
SHIFT
IF "%1"=="" (
	FOR /F %%G in ('dir /A:D /B %PYWIN_HOME%\versions\*') do (
		echo %%G
	)
	goto End
) ELSE ( 
	IF "%1"=="--help" (
		goto Help
	)
)

:Help
echo --installed
echo     Returns a list of installed Python versions
goto End


:End
ENDLOCAL