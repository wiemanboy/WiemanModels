use <LIB/utils.scad>
use <MCAD/boxes.scad>

$fa=1;
$fs=0.1;

top_degrees=92;
back_degrees=8;
lamp_size=[85,20,25];
exposed_size=[75,20];
thickness=2;
case_size=[lamp_size.x+thickness*2, lamp_size.y+thickness, lamp_size.z+thickness*2];

top_height=9.326; // 23 deg
back_height=10.61187; // 25 deg


difference() {
    union() {
        cube(case_size);
        top();
        back();
    }
    translate([thickness, thickness, thickness]) cube([lamp_size.x, lamp_size.y*2, lamp_size.z]);
    #rotate([90,0,0]) translate([CENTER(case_size.x, exposed_size.x),CENTER(case_size.z, exposed_size.y),-thickness]) roundedCube(size=[exposed_size.x, exposed_size.y, thickness], r=thickness, sidesonly=true);
}

module top() {
    translate([case_size.x,0,case_size.z]) rotate([0,-90,0]) linear_extrude(case_size.x) polygon([
        [0,0],
        [0,case_size.y],
        [top_height, 0],
    ]);
    }

module back() {
    difference() {
        translate([case_size.x,case_size.y,case_size.z]) rotate([-90,0,90]) linear_extrude(case_size.x) polygon([
            [0,0],
            [0,case_size.z],
            [back_height, 0],
        ]);

        translate([0,0,case_size.z+top_height]) rotate([-23,0,0]) cube([case_size.x,50,5]);
    }
}