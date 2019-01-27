#!/usr/bin/python2
import os
s = os.getcwd()
if len(s) > 30:
    s = ".." + s[-30:]
#     s = '..'+s[s[:s.rfind('/')].rfind('/'):] # get last two folders

print s,


