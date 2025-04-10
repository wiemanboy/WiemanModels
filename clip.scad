use <./utils.scad>

tollerance = 0.5;

module femaleClip(holeWidth, holeHeight, thickness) {
    difference() {
    translate([0,0,thickness]) cube([width, height, thickness]);
    translate([CENTER(width, holeWidth), CENTER(height, holeHeight), thickness]) cube([holeWidth, holeHeight, thickness]);
    }
}

module maleClip(width, height, holeHeight, thickness, edgeWidth) {
    cube([width, height, thickness]);
    clipHeight = holeHeight - tollerance;
    clipWidth = thickness*.5;
    clipDepth = thickness *2 + tollerance;

    translate([edgeWidth/2+tollerance, CENTER(height, clipHeight),thickness]) cube([clipWidth, clipHeight, clipDepth]);
    translate([width-edgeWidth/2-1-clipWidth, CENTER(height, clipHeight),thickness]) cube([clipWidth, clipHeight, clipDepth]);
    translate([edgeWidth/2+tollerance, CENTER(height, clipHeight)+clipHeight, clipDepth]) rotate(180) {
        clipExtension(clipHeight, thickness, 1.7, 1);
    }

    translate([width-edgeWidth/2-1, CENTER(height, clipHeight),clipDepth]) 
    clipExtension(clipHeight, thickness, 1., 1);
}

module clipExtension(width, height, depth, edge) {
    rotate([90,0,0]) {
        translate([0,0,-width]) linear_extrude(height=width) polygon([
            [0, 0],
            [0, height],
            [depth, edge],
            [depth, 0],
            [0, 0],
        ]);
    }
}