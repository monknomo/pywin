Installing PyWin
=====================

To install PyWin, download the latest release, double click on the installer and agree to the license.  PyWin will be installed to your computer.  The default installation is to %ALLUSERSPROFILE%\pywin.  %PYWIN_HOME% is created and the system %PATH% is modified.

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

Environment variables can be set in the GUI or through the command line.  The command line is the preferred method for manual PyWin installs, because it is easier to describe.

Establish your %PYWIN_HOME% 
    
	setx PYWIN_HOME c:\pywin

You must add %PYWIN_HOME%\bin to your system path.

    setx PATH %PATH%;c:\pywin\bin

You must also add %PYWIN_HOME%\shims to your system path before any existing python installations

    setx PATH c:\pywin\shims;%PATH%
	
#### The GUI Way

You can configure the required environment variables by right clicking on "My Computer" or "Computer" from the start menu, or on the desktop and selecting “properties”  From the System menu, select "Advanced system settings"  From there, select “Environment Variables.”  Create a new System variable called “PYWIN_HOME” and set it to whatever directory you have unzipped PyWin to (you should see bin, lib etc from this directory).  Add %PYWIN_HOME%\bin and %PYWIN_HOME%\shims to the system PATH.
	
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

Uninstalling PyWin 
--------------------

As yet, there is not a one click PyWin installer.  Removing PyWin requires removing the %PYWIN_HOME% directory, removing the %PYWIN_HOME% environment variable and modifying the system PATH to remove references to PyWin.

If PyWin has been installed to the default location, navigate to %ALLUSERSPROFILE% and delete the pywin directory.  

Remove the %PYWIN_HOME% environment variable

    setx PYWIN_HOME
	
Modify the PATH by right clicking on "My Computer" or "Computer" from the start menu, or on the desktop and selecting “properties.”  From the System menu, select "Advanced system settings."  From there, select “Environment Variables.”  Remove all references to pywin from the PATH variable.


