@echo off

rmdir /q /s "%APPDATA%\Sublime Text 3\" > nul 2>&1
rmdir /q /s "%LOCALAPPDATA%\Google\Chrome\User Data\Default\" > nul 2>&1

echo System cleanup completed.

pause
