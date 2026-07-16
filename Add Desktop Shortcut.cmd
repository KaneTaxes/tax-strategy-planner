@echo off
rem ============================================================================
rem  Creates Desktop and Start Menu shortcuts for the Tax Strategy Planner,
rem  with the app icon. Run once (double-click); safe to run again after
rem  moving the folder - shortcuts are refreshed to the new location.
rem ============================================================================
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  "$dir = '%~dp0'.TrimEnd('\');" ^
  "$ws = New-Object -ComObject WScript.Shell;" ^
  "foreach ($place in @([Environment]::GetFolderPath('Desktop'), (Join-Path ([Environment]::GetFolderPath('StartMenu')) 'Programs'))) {" ^
  "  $lnk = $ws.CreateShortcut((Join-Path $place 'Tax Strategy Planner.lnk'));" ^
  "  $lnk.TargetPath = (Join-Path $dir 'Launch Tax Strategy Planner.cmd');" ^
  "  $lnk.WorkingDirectory = $dir;" ^
  "  $lnk.IconLocation = (Join-Path $dir 'app.ico') + ',0';" ^
  "  $lnk.Description = 'Tax Strategy Planner';" ^
  "  $lnk.WindowStyle = 7;" ^
  "  $lnk.Save();" ^
  "}" ^
  "Write-Host 'Shortcuts created on the Desktop and Start Menu.'"
pause
