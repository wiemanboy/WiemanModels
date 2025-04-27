use <LIB/clip.scad>

thickness=2;

width=20;
clipWidth=10;
clipHeight=16.5;

hangerHeight=20;
hangerWidth=thickness;
hangerSpacing=10+thickness;

union() {
    translate([0,hangerSpacing,0]) tableClip(width, clipWidth, clipHeight, thickness);
    translate([width,hangerWidth,0]) rotate([0,0,180]) hanger();
    difference() {
        cube([width,hangerSpacing,thickness]);
        translate([thickness*2,0,0]) cube([width-thickness*4,hangerSpacing,thickness]);
    }
}

module hanger() {
    rotate([90,0,90]) linear_extrude(height = width) 
    polygon(points=[
        [0,0],
        [hangerWidth,0],
        [hangerWidth,hangerHeight],
        [hangerWidth-0.8,hangerHeight],
        [0, 10],
    ]);
    
}