use <MCAD/boxes.scad>
use <./../utils.scad>

thickness = 3;
width = 170;
length = 120;

screwHoleWidth = 7;
screwHoleLength = 11;

screenDegrees = 84;
screenStandWidth = 80;
screenStandHeight = 143;

union() {
    rotate([-6, 0, 0]) {
        translate([CENTER(width, screenStandWidth),length-thickness,13])cube([screenStandWidth, thickness, screenStandHeight]);
    }

    rotate([-45, 0, 0]) {
        translate([CENTER(width, screenStandWidth),length-thickness-80,40])cube([screenStandWidth, thickness, 100]);
    }

    difference() {
        roundedCube(size=[width, length, thickness], r=30, center=false, sidesonly=true);

        rotate([0, 0, 180]) {
            translate([CENTER(-width, 163), -38, 0]) screwHoles(width, length, thickness);
        }

        #translate([CENTER(width, width-50), 20, 0]) cube([width - 50, 30, thickness]);
        #translate([CENTER(width, width-50), 75, 0]) cube([width - 50, 30, thickness]);
    }
}

module screwHoles(width, length, height) {
        margin = 3.25;
        inBetweenX = 135;
        inBetweenY = 12; //?
        topInBetweenX = 40; //?

        translate([0, 0, 0]) screwHole(screwHoleWidth, screwHoleLength, thickness);
        translate([screwHoleWidth+margin, 0, 0]) screwHole(screwHoleWidth, screwHoleLength, thickness);
        translate([screwHoleWidth+margin+inBetweenX, 0, 0]) screwHole(screwHoleWidth, screwHoleLength, thickness);
        translate([screwHoleWidth*2+margin*2+inBetweenX, 0, 0]) screwHole(screwHoleWidth, screwHoleLength, thickness);
        translate([screwHoleWidth+topInBetweenX, screwHoleLength+inBetweenY, 0]) screwHole(screwHoleWidth, screwHoleLength, thickness);
}

module screwHole(width, length, height) {
    #roundedCube([width, length, height], r=width/2, sidesonly=true);
}