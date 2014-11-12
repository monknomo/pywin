@@ECHO off

SHIFT

rem check for prereqs 

FOR /F  %%a in (%PYWIN_HOME%\lib\currentVersion.txt) do (
	SET $CURRENT_PY=%%a
)


	IF NOT EXIST "%PYWIN_HOME%\versions\%$CURRENT_PY%\Scripts\easy_install.exe" (
		rem change download location
		echo easy install not found, installing easy install
		%PYWIN_HOME%\lib\wget --no-check-certificate -N --output-document="%PYWIN_HOME%\lib\downloads\get_ez_setup.py" https://bootstrap.pypa.io/ez_setup.py
		"%PYWIN_HOME%\versions\%$CURRENT_PY%\python.exe" "%PYWIN_HOME%\lib\downloads\get_ez_setup.py"
		echo easy install installed
	)
	IF NOT EXIST "%PYWIN_HOME%\versions\%$CURRENT_PY%\Scripts\pip.exe" (
		echo pip not found, installing pip
		%PYWIN_HOME%\lib\wget --no-check-certificate -N --output-document="%PYWIN_HOME%\lib\downloads\get-pip.py" https://bootstrap.pypa.io/get-pip.py
		"%PYWIN_HOME%\versions\%$CURRENT_PY%\python.exe" "%PYWIN_HOME%\lib\downloads\get-pip.py"
		echo pip installed
	)
	IF NOT EXIST "%PYWIN_HOME%\versions\%$CURRENT_PY%\Scripts\virtualenv.exe" (
		echo virtualenv not installed, installing virtualenv
		pip install virtualenv
		echo virtualenv installed
	)


IF "%1"=="" (
	ECHO Please provide a Python version
	ECHO Use --versions to list available Python versions
	GOTO End
) ELSE (
	IF "%1"=="create" (
		GOTO createVenv
	) ELSE (
		IF "%1"=="activate" (
			GOTO activateVenv
		) ELSE (
			IF "%1"=="deactivate" (
				GOTO deactivateVenv
			) ELSE (
				IF "%1"=="list" (
					GOTO listVenv
				) ELSE (
					IF "%1"=="--help" (
						goto help
					)
				)
			)
		)
	)
)
GOTO end
rem pywin --venv create <name>
:createVenv
IF EXIST "%PYWIN_HOME%\virtualEnvironments\%2" (
	ECHO %2 already exists
)

virtualenv "%PYWIN_HOME%\virtualEnvironments\%2"


GOTO end

rem pywin --venv use <name>
:activateVenv
IF NOT EXIST "%PYWIN_HOME%\virtualEnvironments\%2\Scripts\activate" (
	ECHO activate script doesn't exist
	IF NOT EXIST "%PYWIN_HOME%\virtualEnvironments\%2" (
		ECHO %2 does not appear to be a virtual environment
	)
	ECHO use ^'pywin --venv create ^<name^>^' to make a virtual environment
) ELSE (
	 call "%PYWIN_HOME%\virtualEnvironments\%2\Scripts\activate.bat"
)
GOTO end

rem pywin --venv stop <name>
:deactivateVenv
IF NOT EXIST "%PYWIN_HOME%\virtualEnvironments\%2\Scripts\deactivate.bat" (
	IF NOT EXIST "%PYWIN_HOME%\virtualEnvironments\%2" (
		ECHO %2 does not appear to be a virtual environment
	)
	ECHO use ^'pywin --venv create ^<name^>^' to make a virtual environment
) else (
	call "%PYWIN_HOME%\virtualEnvironments\%2\Scripts\deactivate.bat"
)
GOTO end

:listVenv
dir %PYWIN_HOME%\virtualEnvironments\* /b /a:d
GOTO end

:help
echo --venv manages virtual environments
echo     --venv create ^<name^>
echo         Creates a virtual environment called ^<name^>
echo     --venv activate ^<name^>
echo         Activates the existing virtual environment ^<name^>
echo     --venv deactivate ^<name^>
echo         Deactivates the exisiting virtual environment ^<name^>
echo     --venv list
echo         Lists all exisiting virtual environments
echo     --venv --help
echo         Displays all venv commands

:end
