@@echo off

SHIFT
IF "%1"=="--help" (
	goto Help
)

FOR /F "tokens=1,2,3 delims=," %%a in (..\lib\pythonversions.txt) do (
	echo %%a	
)

:Help
echo --use ^<version^>
echo     Switches to the specificed Python version, if it is installed