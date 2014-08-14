@@echo off

SHIFT

FOR /F "tokens=1,2,3 delims=," %%a in (..\lib\pythonversions.txt) do (
	echo %%a	
)