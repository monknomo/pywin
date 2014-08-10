@@echo off

cd "%PYWIN_HOME%\lib"
FOR /F  %%a in (currentVersion.txt) do (
	SET $CURRENT_PY=%%a
)

"%PYWIN_HOME%\versions\%$CURRENT_PY%\python.exe" %*