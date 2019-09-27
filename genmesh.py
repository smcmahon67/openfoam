#!/usr/bin/python
# genmesh.py - generate a blockmesh compatible file
# write to stdout and let command line redirect accordingly

import math

# define parameters
# the width of the tunnel and the length of the tunt
wid = 0.038
len = 10.0

# calculate coordinates
x = wid/2.0*math.cos(math.pi*2.5/180)
y = wid/2.0*math.sin(math.pi*2.5/180)

# create points
point=[[0.0,0.0,0.0],
    [x,y,0.0],
    [x,y,len],
    [0.0,0.0,len],
    [x,-y,0.0],
    [x,-y,len]]

# print header
print """FoamFile
{
    version         2.0;
    format          ascii;

    root            "";
    case            "";
    instance        "";
    local           "";

    class           dictionary;
    object          blockMeshDict;
}

// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

convertToMeters 1;

vertices
("""

# print points
for i in range(6):
    print "( ",
    for j in range(2):
        print "%f " % point[i][j],
    print "%f)" % point[i][2]
print ");"

# print the rest
print """
blocks
(
hex (0 4 1 0 3 5 2 3) (50  1 1500) simpleGrading (1 1 1)
);

edges
(
);

boundary
(
     front
     {
           type wedge;
           faces
           (
               (0 1 2 3)
           );
      }
     back
     {
           type wedge;
           faces
           (
               (0 3 5 4)
           );
      }
     tunnelWall
     {
           type wall;
           faces
           (
               (1 4 5 2)
           );
      }
     inlet
     {
           type patch;
           faces
           (
               (0 4 1 0)
           );
      }
     outlet
     {
           type patch;
           faces
           (
               (3 5 2 3)
           );
      }
     axis
     {
           type empty;
           faces
           (
               (0 3 3 0)
           );
      }
);

mergePatchPairs
(
);
"""
