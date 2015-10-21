rem @@echo off
SETLOCAL EnableDelayedExpansion
SHIFT
IF "%1"=="" (
	echo A python version to uninstall must be supplied
	echo use 'pywin --installed' to list installed versions
	goto End
) ELSE (
	IF "%1"=="--help" (
		goto Help
	) ELSE (
        IF "%1"=="--no-check-certificate" (
            SET $UNSAFE=1
            SHIFT
        )
    )
)

rem figure out what kind of uninstaller to expect and where it might be
FOR /F "tokens=1,2,3,4 delims=," %%a in ('type "%PYWIN_HOME%\lib\pythonversions.txt"') do (
	IF "%%a"=="%1" (
		SET PYTHONDLVERSION=%%c
		SET PYTHONDLURL=%%b
        SET PYINSTSTYLE=%%d
		rem this is in lieu of a good way to break loops in batch files
		goto CheckForUninstaller
	)	
)

:CheckForUninstaller
IF "%PYINSTSTYLE%"=="msi1" (
    IF NOT EXIST "%PYWIN_HOME%\lib\downloads\python-%1.msi" (
        echo Uninstaller not found, retrieving from the internet
        IF "%$UNSAFE%"=="1" (
            "%PYWIN_HOME%\lib\wget.exe" --no-check-certificate --continue --tries=5 --output-document="%PYWIN_HOME%\lib\downloads\python-%PYTHONDLVERSION%.msi" "%PYTHONDLURL%"  
        ) ELSE (
            "%PYWIN_HOME%\lib\wget.exe" --continue --tries=5 --output-document="%PYWIN_HOME%\lib\downloads\python-%PYTHONDLVERSION%.msi" "%PYTHONDLURL%"  
        )
    ) ELSE (
        rem do nothing
    )
    msiexec /x "%PYWIN_HOME%\lib\downloads\python-%1.msi" TARGETDIR="%PYWIN_HOME%\versions\%1" /qn
    del /Q /F /S "%PYWIN_HOME%\versions\%1"
    rd /S /Q "%PYWIN_HOME%\versions\%1"
    del /Q /F "%PYWIN_HOME%\lib\downloads\python-%1.msi"
) ELSE (
    IF "%PYINSTSTYLE%"=="exe1" (
        IF NOT EXIST "%PYWIN_HOME%\lib\downloads\python-%1.exe" (
            echo Uninstaller not found, retrieving from the internet
            IF "%$UNSAFE%"=="1" (
                "%PYWIN_HOME%\lib\wget.exe" --no-check-certificate --continue --tries=5 --output-document="%PYWIN_HOME%\lib\downloads\python-%PYTHONDLVERSION%.exe" "%PYTHONDLURL%" 
            ) ELSE (
                "%PYWIN_HOME%\lib\wget.exe" --continue --tries=5 --output-document="%PYWIN_HOME%\lib\downloads\python-%PYTHONDLVERSION%.exe" "%PYTHONDLURL%" 
            )
        ) else (
            rem do nothing
        )
        echo uninstalling
        "%PYWIN_HOME%\lib\downloads\python-%1.exe" /uninstall /passive TargetDir="%PYWIN_HOME%\versions\%PYTHONDLVERSION%"
        rem del /Q /F "%PYWIN_HOME%\lib\downloads\python-%1.exe"

    ) ELSE (
        echo The Python installer style is not recognized
        echo There is a problem with your %PYWIN_HOME%\lib\pythonversions.txt
    )
)
FOR /F  %%a in (currentVersion.txt) do (
	SET $CURRENT_PY=%%a
)
IF "%$CURRENT_PY%"=="%PYTHONDLVERSION%" (
    echo > "%PYWIN_HOME%\lib\currentVersion.txt"
)
GOTO End

:Help
echo --uninstall ^<version^>
echo     Uninstall the specified ^<version^>, if it exists
echo --uninstall --no-check-certificate ^<version^>
echo     Uninstall the specified ^<version^>, if it exists, does not check
echo     SSL certs
:End
ENDLOCAL