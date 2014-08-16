@@echo off

SHIFT
IF "%1"=="--help" (
	goto Help
)
echo Not implemented yet...
:Help
echo --uninstall ^<version^>
echo     Uninstall the specified ^<version^>, if it exists