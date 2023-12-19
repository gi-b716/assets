::自定义设置开始
set pythonver=3
set pythonpath=python
set gitpath=git
set mirrorurl=oi-wiki.org
::自定义设置结束

echo off
cls

:open
ping %mirrorurl% -n 1 -l 1
if %ERRORLEVEL%==0 goto online
if %ERRORLEVEL%==1 goto local
exit

:online
set /p inputol=online(o) or local(l):
if %inputol%==o start https://%mirrorurl%/
if %inputol%==l goto sfu
goto online
exit

:sfu
set /p inputt=update?(y/n):
if %inputt%==y goto update
if %inputt%==n goto local
goto sfu
exit

:update
rmdir /s/q OI-wiki
md OI-wiki
set /p inputu=github/gitee?:
if %inputu%==gitee %gitpath% clone https://gitee.com/OI-wiki/OI-wiki.git -b gh-pages
if %inputu%==github %gitpath% clone https://github.com/OI-wiki/OI-wiki.git -b gh-pages
cls
goto local
exit

:local
cd OI-wiki
start http://localhost:8000/
if %pythonver%==3 %pythonpath% -m http.server
if %pythonver%==2 %pythonpath% -m SimpleHTTPServer
exit