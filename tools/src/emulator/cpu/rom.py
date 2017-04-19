#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#  rom.py
#
#  Copyright 2017 Vladislav <vladislav.mlejnecky@student.upce.cz>

from memitem import memitem
import sys

class rom(memitem):
    def __init__(self, baseAddress, size, globDef, name):
        memitem.__init__(self, baseAddress, size, name)

        self.loadeif(globDef.rom0filename)

    def loadeif(self, fileName):
        try:
            f = file(fileName, "r")
        except:
            print "Can't open input file for reading!"
            sys.exit(1)

        i = 0
        for line in f:
            line.replace("\n", "")
            line.replace("\r", "")
            line.replace(" ", "")
            self.mem[i] = int(line.upper(), 16)
            i = i + 1

        f.close()