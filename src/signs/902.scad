use <MCAD/boxes.scad>
use <LIB/utils.scad>

$fs = 0.5;
$fa = 0.5;

letterHeight = 75;
letterThickness = 1;


width=120;
height=letterHeight+30;
thickness=2;

difference() {
    roundedCube(size=[width, height, thickness], r=5, center=false, sidesonly=true);
    translate([CENTER(width,2),5,0])#cylinder(d=5, h=thickness);
    translate([CENTER(width,2),height-5,0])#cylinder(d=5, h=thickness);
}

#translate([10,CENTER(height, letterHeight),thickness])linear_extrude(letterThickness) scale([.7,1,1]) text("902", 75, font="Agency FB:style=Bold");