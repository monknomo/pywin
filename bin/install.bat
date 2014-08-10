rem make the directory structure
mkdir %ALLUSERSPROFILE%\pywin
mkdir %ALLUSERSPROFILE%\pywin\bin > %ALLUSERSPROFILE%\pywin\install_log.txt
mkdir %ALLUSERSPROFILE%\pywin\lib >> %ALLUSERSPROFILE%\pywin\install_log.txt
mkdir %ALLUSERSPROFILE%\pywin\lib\downloads >> %ALLUSERSPROFILE%\pywin\install_log.txt
mkdir %ALLUSERSPROFILE%\pywin\shims >> %ALLUSERSPROFILE%\pywin\install_log.txt
mkdir %ALLUSERSPROFILE%\pywin\versions >> %ALLUSERSPROFILE%\pywin\install_log.txt
rem copy files to new directory structure
move /Y LICENSE.txt %ALLUSERSPROFILE%\pywin >> %ALLUSERSPROFILE%\pywin\install_log.txt
move /Y README.txt %ALLUSERSPROFILE%\pywin >> %ALLUSERSPROFILE%\pywin\install_log.txt
move /Y pywin.bat %ALLUSERSPROFILE%\pywin\bin >> %ALLUSERSPROFILE%\pywin\install_log.txt
move /Y pywinversions.txt %ALLUSERSPROFILE%\pywin\lib >> %ALLUSERSPROFILE%\pywin\install_log.txt
move /Y wget.exe %ALLUSERSPROFILE%\pywin\lib >> %ALLUSERSPROFILE%\pywin\install_log.txt
move /Y wget_LICENSE.txt %ALLUSERSPROFILE%\pywin\lib >> %ALLUSERSPROFILE%\pywin\install_log.txt
move /Y easy_install.bat %ALLUSERSPROFILE%\pywin\shims >> %ALLUSERSPROFILE%\pywin\install_log.txt
move /Y pip.bat %ALLUSERSPROFILE%\pywin\shims >> %ALLUSERSPROFILE%\pywin\install_log.txt
move /Y py.bat %ALLUSERSPROFILE%\pywin\shims >> %ALLUSERSPROFILE%\pywin\install_log.txt
move /Y python.bat %ALLUSERSPROFILE%\pywin\shims >> %ALLUSERSPROFILE%\pywin\install_log.txt
move /Y pythonw.bat %ALLUSERSPROFILE%\pywin\shims >> %ALLUSERSPROFILE%\pywin\install_log.txt
rem set envir
setx PYWIN_HOME %ALLUSERSPROFILE%\pywin
SET PYWIN_HOME="%ALLUSERSPROFILE%\pywin"
setx PATH "%PATH%";"%PYWIN_HOME%\bin"
