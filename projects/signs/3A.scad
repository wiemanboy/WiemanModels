use <MCAD/boxes.scad>
use <./../../utils.scad>

$fs = 0.5;
$fa = 0.5;

letterHeight = 75;
letterThickness = 1;
letterOfset = 3;

width=100;
height=100;
thickness=2;

holeWidth=5;
pegWidth=7;
pegHeight=5;
margin=5;


difference() {
    color([1,1,1]) backPlate();

    translate([5,CENTER(height,holeWidth),0])#cylinder(d=holeWidth, h=thickness+pegHeight);
    translate([width-5,CENTER(height,holeWidth),0])#cylinder(d=holeWidth, h=thickness+pegHeight);
}

module backPlate() {
    roundedCube(size=[width, height, thickness], r=5, center=false, sidesonly=true);

    translate([margin,CENTER(height,holeWidth),0]) cylinder(d=pegWidth, h=thickness+pegHeight);
    translate([width-margin,CENTER(height,holeWidth),0]) cylinder(d=pegWidth, h=thickness+pegHeight);

    translate([CENTER(width,holeWidth),margin,0]) cylinder(d=pegWidth, h=thickness+pegHeight);
    translate([CENTER(width,holeWidth),height-margin,0]) cylinder(d=pegWidth, h=thickness+pegHeight);
}

color([0,0,0]) translate([letterOfset,CENTER(height, letterHeight),thickness]) linear_extrude(letterThickness) text("3", letterHeight, font="National Park:style=Regular");
color([0,0,0]) translate([letterOfset+55,CENTER(height, letterHeight),thickness]) linear_extrude(letterThickness) text("A", 40, font="National Park:style=Bold");