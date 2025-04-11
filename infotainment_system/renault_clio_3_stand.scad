use <MCAD/boxes.scad>
use <./../utils.scad>

thickness = 3;
width = 180;
length = 120;

screwHoleWidth = 7;
screwHoleLength = 11;

screenDegrees = 84;
screenStandWidth = 80;
screenStandHeight = 95;

union() {
    translate([CENTER(width, screenStandWidth),length-thickness,thickness]) rotate([-6, 0, 0]) {
        difference() {
            cube([screenStandWidth, thickness, screenStandHeight]);
            clipHoleWidth=screenStandWidth-10;
            clipHoleHeight=50;
            translate([CENTER(screenStandWidth,clipHoleWidth),0, screenStandHeight-clipHoleHeight-10]) #cube([clipHoleWidth, thickness, clipHoleHeight]);
        }
    }

    translate([CENTER(width, screenStandWidth),length-thickness-length/2,thickness]) rotate([-36.52, 0, 0]) {
        difference () {
            cube([screenStandWidth, thickness, 117.6]);
            #translate([CENTER(screenStandWidth, screenStandWidth-30),0,CENTER(116.7, 116.7-30)])cube([screenStandWidth-30, thickness, 116.7-30]);
        }
    }

    difference() {
        roundedCube(size=[width, length, thickness], r=30, center=false, sidesonly=true);

        rotate([0, 0, 180]) {
            translate([CENTER(-width, 168), -38, 0]) screwHoles(width, length, thickness);
        }

        negativeWidthHoles = width-60;
        #translate([CENTER(width, negativeWidthHoles), 20, 0]) cube([negativeWidthHoles, 30, thickness]);

        negativeWidth = negativeWidthHoles+25;
        #translate([CENTER(width, negativeWidth), 75, 0]) cube([negativeWidth, 30, thickness]);
    }
}

module screwHoles(width, length, height) {
        margin = 3.25;
        inBetweenX = 134.5;
        inBetweenY = 12;
        topInBetweenX = 40;

        translate([0, 0, 0]) screwHole(screwHoleWidth, screwHoleLength, thickness);
        translate([screwHoleWidth+margin, 0, 0]) screwHole(screwHoleWidth, screwHoleLength, thickness);

        translate([screwHoleWidth*2+margin+inBetweenX, 0, 0]) screwHole(screwHoleWidth, screwHoleLength, thickness);
        translate([screwHoleWidth*3+margin*2+inBetweenX, 0, 0]) screwHole(screwHoleWidth, screwHoleLength, thickness);
        
        translate([screwHoleWidth+topInBetweenX, screwHoleLength+inBetweenY, 0]) screwHole(screwHoleWidth, screwHoleLength, thickness);
        translate([screwHoleWidth*2+topInBetweenX+margin, screwHoleLength+inBetweenY, 0]) screwHole(screwHoleWidth, screwHoleLength, thickness);
}

module screwHole(width, length, height) {
    #roundedCube([width, length, height], r=width/2, sidesonly=true);
}