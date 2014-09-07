rem @@echo off

SHIFT
IF "%1"=="" (
	echo A python version to uninstall must be supplied
	echo use 'pywin --installed' to list installed versions
	goto End
) ELSE (
	IF "%1"=="--help" (
		goto Help
	)
)

IF NOT EXIST "%PYWIN_HOME%\lib\downloads\python-%1.msi" (
	echo Required msi for uninstallation not found
	echo try 'pywin --install %1' to download required msi
	goto End
)

msiexec /x "%PYWIN_HOME%\lib\downloads\python-%1.msi" TARGETDIR="%PYWIN_HOME%\versions\%1" /qn
del "%PYWIN_HOME%\lib\downloads\python-%1.msi"
goto End



:Help
echo --uninstall ^<version^>
echo     Uninstall the specified ^<version^>, if it exists
:End