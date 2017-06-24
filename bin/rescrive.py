#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import random
import os

#print sys.argv[1]


def listFiles(dir):
    basedir = dir
    print "\n %s \n" % dir
    subdirlist = []
    print " -" * 5
    
    for item in os.listdir(dir):
        print "  -> %s" % item

        if os.path.isdir(os.path.join(basedir,item)):
            subdirlist.append(os.path.join(basedir, item))

        else:
            print os.path.join(basedir, item)
            reescrive(os.path.join(basedir, item))
    for subdir in subdirlist:
        listFiles(subdir)

def reescrive(infile):
    arch = open(infile, 'w')
    strr = ''
    
    for x in range(random.randint(1,10)):
        strr += str(random.random())
        arch.write(str(strr))
    arch.write(strr)
    arch.close()

if (len(sys.argv) == 2 ):
#  print sys.argv[1]

  listFiles(sys.argv[1])

else:
  print "\tuso: rescrive.py <path>"
