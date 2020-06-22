import ctypes
import fileinput
import os
import re
import sys

from subprocess import PIPE, run

if not ctypes.windll.shell32.IsUserAnAdmin():
    print("Please run as administrator.")
    sys.exit()

hosts = os.path.join("C:\\", "Windows", "System32", "drivers", "etc", "hosts")

pattern = r"\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}"

response = run(
    ["get-archlinux-ip.bat"],
    stdin=PIPE,
    stdout=PIPE,
    stderr=PIPE,
    shell=True
)

stdout = response.stdout.decode()

ip = re.findall(pattern, stdout)[0]

with fileinput.FileInput(hosts, inplace=True) as file:
    for line in file:
        if "archlinux" in line:
            sys.stdout.write(re.sub(pattern, ip, line))
        else:
            sys.stdout.write(line)

print("Updated DNS.")
