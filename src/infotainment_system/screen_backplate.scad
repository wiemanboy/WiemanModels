use <LIB/utils.scad>
use <LIB/clip.scad>;

screenStandWidth = 81;
screenStandHeight = 50;

interfaceHeight = 100;
interfaceThickness = 2;
thickness = 4;

width = 235;
height = 50;
backplateWidth = width-30;

clipHoleWidth=70;
clipHoleHeight=50;

difference() {
    union() {
        screenInterface(width, interfaceHeight, interfaceThickness);
        translate([CENTER(width, backplateWidth),0,0]) backplate(backplateWidth, height, thickness);
        translate([CENTER(width, clipHoleWidth+10),0,0]) screenStand(clipHoleWidth+10, clipHoleHeight+10, thickness*2);
    }

    gapWidth = 50;

    translate([width/2-screenStandWidth/2-gapWidth-1, height, 0]) gap(gapWidth*2+screenStandWidth, gapWidth, thickness);
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

module screenStand (width, height, thickness) {
    union() {
        cube([width, height, thickness]);
        translate([0,0, thickness]) maleClip(width, height, height, 3, 10);
    }
}
