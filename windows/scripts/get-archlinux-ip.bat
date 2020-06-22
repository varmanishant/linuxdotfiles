@echo off

echo IP addresses of the Archlinux Virtual Machine:
arp -a | findstr 00-15-5d-0a-23-01
pause
