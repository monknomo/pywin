Installing winpyenv
=====================

At the moment, there is no easy installer for winpyenv.  This means you need to take the manual approach.

Prerequisites
--------------

*** Set some environment variables

You can configure the required environment variables by right clicking on “My Computer” or “Computer” from the start menu, or on the desktop and selecting “properties”  From the System menu, select “Advanced system settings”  From there, select “Environment Variables”  Create a new System variable called “PYWINENV_HOME” and set it to whatever directory you have unzipped pywinenv to (you should see bin, lib etc from this directory)

You must add %PYWINENV_HOME%\bin to your system path before any existing python installations

Python requires msvcr100.dll in c:\windows\system32 and possibly in C:\Windows\SysWOW64 if you wish to run 32bit python on 64bit windows.  You can obtain this by installing Visual C++ 2010 SP1 Redistributable Package x86 or a python version.  

*** Installation

Unzip winpyenv to %PYWINENV_HOME%

*** Use

From the command line type pywinenv --help to get a list of commands and their usage.  


