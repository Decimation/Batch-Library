@ECHO OFF

SET Str=%1

::SET SubStr=el
SET SubStr=%2
::SET SubStr=eZ

CALL :SUBSTRINGCHECK %Str% %SubStr% RESULT
ECHO %RESULT%
exit /b

:SUBSTRINGCHECK
SET RESULT=FALSE
SET Str=%~1
SET SubStr=%~2
CALL :reset_error
ECHO "%Str%" | FIND /i "%SubStr%" >nul
IF %ERRORLEVEL% EQU 0 (
 Set RESULT=TRUE
)
SET %3=%RESULT%
exit /b

:reset_error
exit /b 0