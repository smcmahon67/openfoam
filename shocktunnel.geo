// define some parameters.
len = DefineNumber[ 10, Name "Parameters/length" ];
wid = DefineNumber[ 10, Name "Parameters/width" ];
// largely taken from https://openfoamwiki.net/index.php/2D_Mesh_Tutorial_using_GMSH
Point(1) = {0, 0, 0, 1.0};
Point(2) = {wid, 0, 0, 1.0};
Point(3) = {wid, 0, len, 1.0};
Point(4) = {0, 0, len, 1.0};
Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};
//+
Curve Loop(1) = {3, 4, 1, 2};
//+
Plane Surface(1) = {1};
//+
Rotate {{0, 0, 1}, {0, 0, 0}, -0.04363323129985824} {
  Surface{1};
}
//+
Extrude {{0, 0, 1}, {0, 0, 0}, 0.08726646259971647} {
  Surface{1};
  Layers{1};
  Recombine;
}
//+
Physical Surface("inlet") = {12};
//+
Physical Surface("outlet") = {16};
//+
Physical Surface("wall") = {20};
//+
Physical Volume("internal") = {1};
//+

