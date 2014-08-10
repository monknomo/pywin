@@echo off

cd "%PYWINENV_HOME%\lib"
FOR /F  %%a in (currentVersion.txt) do (
	SET $CURRENT_PY=%%a
)

"%PYWINENV_HOME%\versions\%$CURRENT_PY%\python.exe" %*