FOR /F "tokens=1,2,3 delims=," %%a in ('type "%PYWIN_HOME%\lib\pythonversions.txt"') do (
	echo attempting to install %%a
	call %PYWIN_HOME%\lib\commands\install --install %%a	
)
pause