@@echo off

FOR /F  %%a in (%PYWIN_HOME%\lib\currentVersion.txt) do (
	SET $CURRENT_PY=%%a
)

"%PYWIN_HOME%\versions\%$CURRENT_PY%\python.exe" %*