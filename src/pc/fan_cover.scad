$fs = 0.5;
$fa = 0.5;

innerDiamater=41;
outerDiamater=115;
width=7.5;
thickness=1;

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

!clip();

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
        [width,thickness+1],
        [width-thickness*1.5,thickness+1], 
        [thickness,height-thickness*1.25]]);
}
