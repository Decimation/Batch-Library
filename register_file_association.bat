@echo off
setlocal EnableDelayedExpansion

:: Argument #0:   File extension (without .)
:: Argument #1:   Program


set arg_ext=%1%
set arg_prgm=%2%

set type_str=type
set dot_str=.

set ext_with_dot=%dot_str%%arg_ext%
set ft_str=%arg_ext%%type_str%

echo Associating %arg_ext% with %arg_prgm%
pause

ftype %ft_str%=%arg_prgm% "%%1"
assoc %ext_with_dot%=%ft_str%

::ftype <filetypename>="<program>" "%1"
::assoc <.ext>=<filetypename>