#!/usr/bin/python
# genmesh.py - generate a blockmesh compatible file
# write to stdout and let command line redirect accordingly

import math

# define parameters
wid = 10.0
len = 10.0

# this is the size of the area where the driver gas
# is defined
startlen = 1

# calculate coordinates
x = startlen/2.0*math.cos(math.pi*2.5/180)
y = startlen/2.0*math.sin(math.pi*2.5/180)

print "box (0 0 -1) (%g %g %g);" % (x,y,len+1)
