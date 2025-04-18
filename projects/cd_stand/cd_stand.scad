use <MCAD/boxes.scad>
use <./cd.scad>
use <./../../utils.scad>

// cd case size = w/h=145 thickness=10

caseHolder();

module caseHolder() {
    size=[125,16,16];
    caseThickness=12;
    thickness=2;

    diagnal = DIAGNAL(size.x, size.x);
    standSize=[diagnal/2,diagnal/2,thickness];

    translate([0,size.y,size.z]) rotate([90,45,0]) {
        roundedCube(standSize, r=6, sidesonly=true);
        cube(standSize);
    }

    difference() {
        cube(size);
        #translate([0,CENTER(size.y, caseThickness),thickness]) cube([size.x,caseThickness,size.z-thickness]);
    }
}

module cdHolder() {
    rotate([90,0,0]) {
        roundedCube([25,100,2], r=12.5, sidesonly=true);
    }
}