@echo off
setlocal
cd /d "%~dp0"
if /i "%~1"=="install" goto install
where node >nul 2>nul
if %errorlevel%==0 (
  node scripts\start.js %*
  goto finish
)
echo Node.js is required. Install Node.js 22 or 24 LTS, then try again.
exit /b 1
:install
where pnpm >nul 2>nul
if %errorlevel%==0 (
  call pnpm install --frozen-lockfile
  goto finish
)
echo pnpm is required for installation. Install pnpm, then run: pnpm install --frozen-lockfile
exit /b 1
:finish
if errorlevel 1 (
  echo.
  echo The command failed. Review the error above.
  exit /b 1
)
