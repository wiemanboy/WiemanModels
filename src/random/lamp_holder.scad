use <LIB/utils.scad>
use <MCAD/boxes.scad>

top_degrees=92;
back_degrees=8;
lamp_size=[82,18,24.3];
exposed_size=[75,20];
thickness=2;
case_size=[lamp_size.x+thickness*2, lamp_size.y+thickness, lamp_size.z+thickness*2];


difference() {
    cube(case_size);
    translate([thickness, thickness, thickness]) cube(lamp_size);
    #rotate([90,0,0]) translate([CENTER(case_size.x, exposed_size.x),CENTER(case_size.z, exposed_size.y),-thickness]) roundedCube(size=[exposed_size.x, exposed_size.y, thickness], r=thickness, sidesonly=true);
}

translate([case_size.x,0,case_size.z]) rotate([0,-90,0]) linear_extrude(case_size.x) polygon([
    [0,0],
    [0,case_size.y],
    [0.629, 0],
]);