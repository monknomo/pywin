@@echo off

IF "%1"=="" goto EmptyCommand

IF "%1"=="install" (
	goto Install
) ELSE (
	IF "%1"=="use" (
		goto Use
	) ELSE (
		IF "%1"=="--versions" (
			goto Versions
		) ELSE (
			IF "%1"=="--help" (
				goto Help
			) ELSE (
				IF "%1"=="--installed" (
					goto Installed
				) ELSE (
					IF "%1"=="--current" (
						goto Current
					) ELSE (
						IF "%1"=="uninstall" (
							goto Uninstall
						) ELSE (
							goto BadCommand
						)
					)
				)
			)			
		)
	)
)

:Install
SHIFT
IF "%1"=="" (
	echo Please provide a Python version
	echo Use --versions to list available Python versions
	goto End
)

FOR /F "tokens=1,2,3 delims=," %%a in ('type "%PYWINENV_HOME%\lib\pythonversions.txt"') do (
	IF "%%a"=="%1" (
		SET $PYTHONDLVERSION=%%c
		SET $PYTHONDLURL=%%b
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
"%PYWINENV_HOME%\lib\wget.exe" --no-check-certificate --continue --tries=5 --output-document="%PYWINENV_HOME%\lib\downloads\python-%$PYTHONDLVERSION%.msi" "%$PYTHONDLURL%" 
rem the /a flag on msiexec is supposed to unzip the python installer as though it were an administrative network install.  It doesn't modify the system in any way
rem this might be troublesome, in that python requires some dlls...
msiexec /a "%PYWINENV_HOME%\lib\downloads\python-%$PYTHONDLVERSION%.msi" TARGETDIR="%PYWINENV_HOME%\versions\%$PYTHONDLVERSION%" /qb!
IF NOT EXISTS "%PYWINENV_HOME%\lib\currentVersion.txt" (
	echo %1 > "%PYWINENV_HOME%\lib\currentVersion.txt"
)

goto End

:Uninstall
echo Not implemented yet...
goto End

:Use
SHIFT
IF "%1"=="" (
	echo Please provide a Python version
	echo Use --versions to list available Python versions
	goto End
)
cd "%PYWINENV_HOME%\lib"
FOR /F %%G in ('dir /A:D /B %PYWINENV_HOME%\versions\*') do (
	IF "%1"=="%%G" (
		echo %1 > "%PYWINENV_HOME%\lib\currentVersion.txt"
		goto End
	)
)
echo %1 is not an installed version
echo Consider using the install command
echo Try --help for a list of commands
goto End

:Versions
FOR /F "tokens=1,2,3 delims=," %%a in (..\lib\pythonversions.txt) do (
	echo %%a	
)
goto End

:Current

goto End

:Installed
FOR /F %%G in ('dir /A:D /B %PYWINENV_HOME%\versions\*') do (
	echo %%G
)
goto End

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

:EmptyCommand
echo You must supply a command or argument
echo Try --help for a list of commands
goto End

:BadCommand
echo %1 is not a recognized command
echo Try --help for a list of commands
goto End

:End