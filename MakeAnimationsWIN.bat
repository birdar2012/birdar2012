@echo off
SET theDelay=40
SET mydate=%date:~10%%date:~4,2%%date:~7,2%
SET theDateStamp=%mydate%
:Ask
ECHO Would you like to download images first?(y/n)
set INPUT=
set /P INPUT=Type input: %=%
If /I "%INPUT%"=="y" goto yes
IF /I "%INPUT%"=="n" goto no
echo Incorrect input & goto Ask
:yes
python /Users/dlapuma.RUSSELL/Dropbox/workPC/birdar2013win.py  
:no
convert -delay %theDelay% /Users/username/radarFiles/kmkx/bref1/%theDateStamp%*.png -layers optimize -write /Users/username/animationFolder/WI-KMKX-br-%theDateStamp%.gif -delete 1--1 -resize 200x200 /Users/username/animationFolder/WI-KMKX-br-%theDateStamp%-t.gif 
convert -delay %theDelay% /Users/username/radarFiles/kmkx/vel1/%theDateStamp%*.png -layers optimize -write /Users/username/animationFolder/WI-KMKX-bv-%theDateStamp%.gif -delete 1--1 -resize 200x200 /Users/username/animationFolder/WI-KMKX-bv-%theDateStamp%-t.gif 
