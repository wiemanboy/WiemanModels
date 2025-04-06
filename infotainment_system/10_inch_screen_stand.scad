$fs = 0.5;
$fa = 0.5;

width = 40;
height = 147.5;
depth = 19;
screenSize = 15;
thickness = 2;

pegWidth = 2.75;
pegHeight = 3.75;
pegNegativeHeight = 2;
pegScrewSize = 1.25;
pegOffset = pegWidth + 2;

union() {
    sleeve(width, height, depth, screenSize, thickness);
    rotate([90, 0, 0]) {
            translate([screenSize-pegOffset, height-pegOffset-thickness, -depth-pegNegativeHeight]) peg(pegWidth, pegHeight+pegNegativeHeight+thickness, pegScrewSize);
            translate([screenSize-pegOffset, pegOffset+thickness, -depth-pegNegativeHeight]) peg(pegWidth, pegHeight+pegNegativeHeight+thickness, pegScrewSize);
    };
    translate([0, depth, CENTER(height, height-40)]) attachment(screenSize, height-40, 2*thickness, thickness);
}

module sleeve(width, height, depth, screenSize, thickness) {
    difference() {
        cube([width, depth, height]);

        translate([0,0,CENTER(height, height-thickness*2)]) cube([width - 25, depth - thickness, height - thickness*2]);

        translate([screenSize, thickness, CENTER(height, height-thickness*2)]) #cube([width - screenSize, depth - thickness, height - thickness*2]);

        rotate([90, 0, 0]) {
            translate([screenSize-pegOffset, height-pegOffset-thickness, -depth]) pegHole(pegWidth, pegHeigh+pegNegativeHeightt, pegScrewSize);
            translate([screenSize-pegOffset, pegOffset+thickness, -depth]) pegHole(pegWidth, pegHeight+pegNegativeHeight, pegScrewSize);
    };
    }
}

module attachment(width, height, depth, thickness) {
    difference() {
        cube([width, depth, height]);
        translate([0, 0, CENTER(height, height-thickness*2)]) cube([width, depth-thickness, height-thickness*2]);
    }
}

module peg(width, height, screwSize) {
    difference() {
        cylinder(r=width, h=height);
        cylinder(r=screwSize, h=height);
    }
}

module pegHole(width, height, screwSize) {
        cylinder(r=screwSize, h=height+1);
        cylinder(r=width, h=height);
}

function CENTER(parentCoordinate, childCoordinate) = 
    parentCoordinate / 2 - childCoordinate / 2;
