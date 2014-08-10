@@echo on

cd "%PYWIN_HOME%\lib"
FOR /F  %%a in (currentVersion.txt) do (
	SET $CURRENT_PY=%%a
)

cd "%PYWIN_HOME%\versions\%$CURRENT_PY%"
py.exe %*