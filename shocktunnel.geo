// Gmsh project created on Sat Jun 11 18:20:20 2016
length = DefineNumber[ 10, Name "Parameters/length" ];
width = DefineNumber[ 10, Name "Parameters/width" ];
Point(1) = {0, 0, 0, 1.0};
Point(2) = {width, 0, 0, 1.0};
Point(3) = {width, length, 0, 1.0};
Point(4) = {0, length, 0, 1.0};
Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};
Line Loop(6) = {4,1,2,3};
Plane Surface(6) = {6};
Physical Volume("internal") = {1};
Extrude {0, 0, 1} {
  Surface{6};
  Layers{1};
  Recombine;
}
Physical Surface("front") = {28};
Physical Surface("back") = {6};
Physical Surface("bottom") = {19};
Physical Surface("top") = {27};
Physical Surface("left") = {15};
Physical Surface("right") = {23};
