@@echo off

SHIFT
IF "%1"=="" (
	echo Please provide a Python version
	echo Use --versions to list available Python versions
	goto End
)

FOR /F "tokens=1,2,3 delims=," %%a in ('type "%PYWIN_HOME%\lib\pythonversions.txt"') do (
	IF "%%a"=="%1" (
		SETLOCAL $PYTHONDLVERSION=%%c
		SETLOCAL $PYTHONDLURL=%%b
		rem this is in lieu of a good way to break loops in batch files
		goto InstallPython
	)	
)
rem if the python version isn't in pythonversions.txt, we can't install it
echo Python version not found
echo Use --versions to list available Python versions
goto End

:InstallPython
echo Downloading Python version %1 from %$PYTHONDLURL%
"%PYWIN_HOME%\lib\wget.exe" --no-check-certificate --continue --tries=5 --output-document="%PYWIN_HOME%\lib\downloads\python-%$PYTHONDLVERSION%.msi" "%$PYTHONDLURL%" 
rem the /a flag on msiexec is supposed to unzip the python installer as though it were an administrative network install.  It doesn't modify the system in any way
rem this might be troublesome, in that python requires some dlls...S
msiexec  "%PYWIN_HOME%\lib\downloads\python-%$PYTHONDLVERSION%.msi" TARGETDIR="%PYWIN_HOME%\versions\%$PYTHONDLVERSION%" /qb!
IF NOT EXISTS "%PYWIN_HOME%\lib\currentVersion.txt" (
	echo %1 > "%PYWIN_HOME%\lib\currentVersion.txt"
)

goto End
:End