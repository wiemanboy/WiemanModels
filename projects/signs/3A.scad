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

difference() {
    color([1,1,1]) roundedCube(size=[width, height, thickness], r=5, center=false, sidesonly=true);
    translate([CENTER(width,2),5,0])#cylinder(d=5, h=thickness);
    translate([CENTER(width,2),height-5,0])#cylinder(d=5, h=thickness);
}

translate([CENTER(width,2),5,0])#cylinder(d=5, h=thickness);
translate([CENTER(width,2),height-5,0])#cylinder(d=5, h=thickness);

color([0,0,0]) translate([letterOfset,CENTER(height, letterHeight),thickness])linear_extrude(letterThickness) text("3", letterHeight, font="National Park:style=Regular");
color([0,0,0]) translate([letterOfset+55,CENTER(height, letterHeight),thickness])linear_extrude(letterThickness) text("A", 40, font="National Park:style=Bold");