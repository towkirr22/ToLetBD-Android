@echo off
cd /d "%~dp0"
echo Installing npm dependencies...
call npm install
if errorlevel 1 goto failed
if not exist android\build.gradle (
  echo Creating Android project...
  call npx cap add android
  if errorlevel 1 goto failed
)
echo Syncing Android project...
call npx cap sync android
if errorlevel 1 goto failed
echo Opening Android Studio...
call npx cap open android
exit /b 0
:failed
echo Build setup failed. Check the error above.
pause
exit /b 1
