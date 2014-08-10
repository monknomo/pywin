rem make the directory structure
mkdir %ALLUSERSPROFILE%\pywin
mkdir %ALLUSERSPROFILE%\pywin\bin > %ALLUSERSPROFILE%\pywin\install_log.txt  2>&1
mkdir %ALLUSERSPROFILE%\pywin\lib >> %ALLUSERSPROFILE%\pywin\install_log.txt  2>&1
mkdir %ALLUSERSPROFILE%\pywin\lib\downloads >> %ALLUSERSPROFILE%\pywin\install_log.txt  2>&1
mkdir %ALLUSERSPROFILE%\pywin\shims >> %ALLUSERSPROFILE%\pywin\install_log.txt  2>&1
mkdir %ALLUSERSPROFILE%\pywin\versions >> %ALLUSERSPROFILE%\pywin\install_log.txt  2>&1
rem copy files to new directory structure
move /Y LICENSE.txt %ALLUSERSPROFILE%\pywin >> %ALLUSERSPROFILE%\pywin\install_log.txt  2>&1
move /Y README.txt %ALLUSERSPROFILE%\pywin >> %ALLUSERSPROFILE%\pywin\install_log.txt  2>&1
move /Y pywin.bat %ALLUSERSPROFILE%\pywin\bin >> %ALLUSERSPROFILE%\pywin\install_log.txt  2>&1
move /Y pywinversions.txt %ALLUSERSPROFILE%\pywin\lib >> %ALLUSERSPROFILE%\pywin\install_log.txt  2>&1
move /Y wget.exe %ALLUSERSPROFILE%\pywin\lib >> %ALLUSERSPROFILE%\pywin\install_log.txt  2>&1
move /Y wget_LICENSE.txt %ALLUSERSPROFILE%\pywin\lib >> %ALLUSERSPROFILE%\pywin\install_log.txt  2>&1
move /Y easy_install.bat %ALLUSERSPROFILE%\pywin\shims >> %ALLUSERSPROFILE%\pywin\install_log.txt  2>&1
move /Y pip.bat %ALLUSERSPROFILE%\pywin\shims >> %ALLUSERSPROFILE%\pywin\install_log.txt  2>&1
move /Y py.bat %ALLUSERSPROFILE%\pywin\shims >> %ALLUSERSPROFILE%\pywin\install_log.txt  2>&1
move /Y python.bat %ALLUSERSPROFILE%\pywin\shims >> %ALLUSERSPROFILE%\pywin\install_log.txt  2>&1
move /Y pythonw.bat %ALLUSERSPROFILE%\pywin\shims >> %ALLUSERSPROFILE%\pywin\install_log.txt  2>&1
rem set envir
setx PYWIN_HOME %ALLUSERSPROFILE%\pywin >> %ALLUSERSPROFILE%\pywin\install_log.txt  2>&1
SET PYWIN_HOME="%ALLUSERSPROFILE%\pywin" >> %ALLUSERSPROFILE%\pywin\install_log.txt  2>&1
setx PATH "%PATH%;%PYWIN_HOME%\bin" >> %ALLUSERSPROFILE%\pywin\install_log.txt  2>&1
