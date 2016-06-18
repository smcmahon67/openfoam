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
Line Loop(5) = {1, 2, 3, 4};
Plane Surface(6) = {5};
Physical Volume("internal") = {1};
Rotate {{0, 1, 0}, {0, 0, 0}, -0.04363323129985824} {
  Surface{6};
}
Extrude {{0, 1, 0}, {0, 0, 0}, 0.08726646259971647} {
  Surface{6};
  Layers{1};
  Recombine;
}
Physical Surface("inlet") = {14};
Physical Surface("outlet") = {21};
Physical Surface("wall") = {18};
Physical Surface("left") = {6};
Physical Surface("right") = {23};
