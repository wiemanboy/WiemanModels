use <./../utils.scad>;

screenStandWidth = 81;
screenStandHeight = 90;

interfaceHeight = 139;
interfaceThickness = 2;
thickness = 4;

width = 235;
height = 50;
backplateWidth = width-30;

difference() {
    union() {
        screenInterface(width, interfaceHeight, interfaceThickness);
        translate([CENTER(width, backplateWidth),CENTER(interfaceHeight, height),0]) backplate(backplateWidth, height, thickness);
        translate([CENTER(width, screenStandWidth+2),0,0]) screenStand(screenStandWidth+2, screenStandHeight, thickness*2, interfaceThickness+1);
    }

    gapWidth = 50;

    translate([screenStandWidth/2+width/2+1, interfaceHeight/2-height/2-gapWidth, 0]) gap(gapWidth, gapWidth, thickness);
    translate([width/2-screenStandWidth/2-gapWidth-1, interfaceHeight/2-height/2-gapWidth, 0]) gap(gapWidth, gapWidth, thickness);
    translate([width/2-screenStandWidth/2-gapWidth-1, interfaceHeight/2+height/2, 0]) gap(gapWidth*2+screenStandWidth, gapWidth, thickness);
}

module gap(width, height, thickness) {
        #cube([width, height, thickness]);
}

module screenInterface(width, height, depth) {
        cube([width, height, depth]);
}

module backplate(width, height, thickness) {
    cube([width, height, thickness]);
}

module screenStand (width, height, thickness, interfaceHeight) {
    difference() {
        cube([width, height, thickness]);
        translate([CENTER(width, width-2), 0, thickness-interfaceHeight-1]) #cube([width-2, height, interfaceHeight]);
    }
}
