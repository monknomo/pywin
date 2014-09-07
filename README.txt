Installing PyWin
=====================

To install PyWin, double click on the "pywin_0.5.EXE" and agree to the license.  PyWin will be installed to your computer.

Using PyWin
-------------

From the command line type pywin --help to get a list of commands and their usage.  

PyWin is extensible, but includes a basic list of commands to start with.

* "pywin --commands" displays a list of commands
* "pywin --current" displays the current version of Python in use
* "pywin --install <version>" installs the specified version of Python
* "pywin --installed" returns a list of installed versions of Python
* "pywin --uninstall <version>" uninstalls the specified version of Python, if it is installed
* "pywin --use" <version> switches to the specified version of Python, if it is installed
* "pywin --versions" displays a list of all currently supported Python versions to install

Manual Installation
--------------------

If you prefer to 'build from source', download/clone this repository to your machine.  Installing from the exe is the recommended approach for normal usage.

### Installation

Unzip or clone pywin to your chosen directory.  The exe installer uses %ALLUSERSPROFILE%\pywin.  For the purposes of discussion, lets say you've put PyWin in c:\pywin

### Set some environment variables

You can configure the required environment variables by right clicking on "My Computer" or "Computer" from the start menu, or on the desktop and selecting “properties”  From the System menu, select "Advanced system settings"  From there, select “Environment Variables”  Create a new System variable called “PYWIN_HOME” and set it to whatever directory you have unzipped PyWin to (you should see bin, lib etc from this directory).

Establish your %PYWIN_HOME% 
    
	setx PYWIN_HOME c:\pywin

You must add %PYWIN_HOME%\bin to your system path.

    setx PATH %PATH%;c:\pywin\bin

You must also add %PYWIN_HOME%\shims to your system path before any existing python installations

    setx PATH c:\pywin\shims;%PATH%
	
After you have setup all the environment variables, start a new command line window.

### Use

From the command line type pywin --help to get a list of commands and their usage.

Extending PyWin
---------------------

PyWin can be extended by adding files that windows can execute (batch file, vbscript, powershell script, other) to the %PYWIN_HOME%\lib\commands directory.  PyWin passes arguments to scripts in this form "script.bat script_name other args following"  Each script should parse "script.bat script_name --help" and echo something helpful.

### Simple PyWin Extension Example

example.bat
```batch
@@echo off
SHIFT
IF "%1"=="--help" (
	goto Help
)
echo This is an example script
goto End

:Help
echo --example provides an example to people who would extend pywin
goto End

:End
```
	
Placing this example into the %PYWIN_HOME%\lib\commands directory will add an additional --example command to pywin.  It will echo "This is an example script" when "pywin --example" is called.  It will echo "--example provides an example to people who would extend pywin" when "pywin --help" or "pywin --example --help" are called.


