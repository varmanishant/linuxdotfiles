@echo off

pushd %~dp0
python update-dns.py
popd

pause