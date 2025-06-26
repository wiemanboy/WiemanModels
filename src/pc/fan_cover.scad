use <LIB/utils.scad>

$fs = 0.5;
$fa = 0.5;

innerDiamater=41;
outerDiamater=116;
width=7.5;
thickness=1;

color("purple") cover();
color("purple") translate([100,0,0]) clip();
color("#ffffff") translate([0,thickness,0]) icon(thickness);

module cover() {
    cylinder(d=innerDiamater, h=thickness, center=true);
    count = 3;       
    for (i = [0 : count - 1]) {
        angle = 360 / count * i;
        rotate([0, 0, angle])
            translate([0, 0, 0]) {
                translate([outerDiamater/4,0,0]) cube([outerDiamater/2, width, thickness], center=true);
                length=20;
                rotate(-length/2) point(outerDiamater/2, length, width);
            }
    }
}

module point(radius, length, width) {
    rotate_extrude(length) translate([radius,0,0]) square(size=[width, thickness], center=true);
    translate([radius,0,0]) cylinder(d=width, h=thickness, center=true);
    rotate([0,0,length-180]) translate([-radius,0,0]) cylinder(d=width, h=thickness, center=true);
}

module clip() {
    thickness=1;
    height=8;
    linear_extrude(5) polygon(points=[
        [thickness,thickness],
        [width,thickness],
        [width,0],
        [0,0],
        [0,height],
        [thickness,height],
        [width-.5,thickness+2.5],
        [width-2,thickness+2.5], 
        [thickness,height-thickness*1.25]]);
}

module icon(thickness) {
    tipSize=4;
    tipDistance=10;

    baseSize=8;
    baseDistance=7;
    translate([0,0-.75,0]) linear_extrude(thickness) {
        hull() {
            translate([tipDistance,tipDistance,tipDistance]) circle(d=tipSize);
            translate([0,baseDistance/2,0]) circle(d=baseSize);
        }
        hull() {
            translate([0,baseDistance/2,0]) circle(d=baseSize);
            translate([0,-baseDistance/2,0]) circle(d=baseSize);

        }
        hull() {
            translate([-tipDistance,-tipDistance,-tipDistance]) circle(d=tipSize);
            translate([0,-baseDistance/2,0]) circle(d=baseSize);
        }
    }
}