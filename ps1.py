#!/opt/bb/bin/python
import os
s = os.getcwd()
if len(s) > 30:
    s = ".." + s[-30:]
#     s = '..'+s[s[:s.rfind('/')].rfind('/'):] # get last two folders


if os.system("git rev-parse 2> /dev/null") == 0:
    branch = os.popen("git rev-parse --abbrev-ref HEAD").read()
    branch = branch.strip()
    s = s + " [" + branch + "]"
print s,


