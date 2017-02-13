@echo off

set /p model=Model:

for %%i IN ("%model%/360/Frames/*.png") do (
  if not exist "%model%/360/tmp" mkdir "%model%/360/tmp"
  convert -composite -geometry +60+60  "%model%/360/Background.png" "%model%/360/Frames/%%i" "%model%/360/tmp/%%~nxi"
  echo %%i
)

echo ---------------
echo Creating GIF...
convert -delay 4.8 -loop 0 -alpha set -dispose previous "%model%/360/tmp/*.png" "%model%/%model% 360.gif"

rmdir "%model%/360/tmp" /s /q
