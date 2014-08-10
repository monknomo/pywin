@@echo on

cd "%PYWINENV_HOME%\lib"
FOR /F  %%a in (currentVersion.txt) do (
	SET $CURRENT_PY=%%a
)

cd "%PYWINENV_HOME%\versions\%$CURRENT_PY%"
py.exe %*