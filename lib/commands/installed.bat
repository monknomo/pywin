@@echo off

SHIFT

IF NOT "%1"=="" (
	echo unrecogized argument^(s^), try using the "--help" switch
	goto End
) ELSE (
	IF "%1"=="--help" (
		goto Help
	) ELSE (
		goto listInstalled
	)
)

:Help
echo --installed
echo     Lists the installed versions of Python
goto End

:listInstalled
for /d %%X in (%PYWIN_HOME%\versions\*) do echo %%~nxX
goto End

:End
rem ends this script