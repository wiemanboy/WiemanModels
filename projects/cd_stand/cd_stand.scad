use <MCAD/boxes.scad>
use <./cd.scad>
use <./../../utils.scad>

// cd case size = w/h=145 thickness=10

caseHolder();

module caseHolder() {
    size=[100,16,10];
    thickness=2;

    radius=25;
    edge=15;
    standSize=[size.x,100+radius,thickness];

    // Feet
    cube([edge,size.y,thickness]);
    translate([size.x-edge,0,0]) cube([edge,size.y,thickness]);

    // Small wall
    translate([0,thickness,0]) rotate([90,0,0]) {
        roundedCube([edge,size.z,thickness], r=5, sidesonly=true);
        cube([edge,size.z/2,thickness]);
    }

    translate([size.x-edge,thickness,0]) cdHolder(edge, 70, thickness);

    // Backsupport
    translate([0,size.y,-radius*1.1]) rotate([90,0,0]) {
        difference() {
            roundedCube(standSize, r=radius, sidesonly=true);
            translate([CENTER(standSize.x,standSize.x-edge*2),CENTER(standSize.y,standSize.y-edge*2),0]) 
            roundedCube([standSize.x-edge*2, standSize.y-edge*2, standSize.z], r=radius*.5, sidesonly=true);

            cube([standSize.x,radius*1.1,standSize.z]);
        }
    }

    %translate([-20,thickness,thickness]) case();
}

module cdHolder(width, height, thickness) {
    rotate([90,0,0]) {
        roundedCube([width,height,thickness], r=width/2, sidesonly=true);
        cube([width,height/2,thickness]);

        internalSupportWidth=2;
        translate([width/2,height-width/2,thickness]) cylinder(internalSupportWidth, d=width-3);
        translate([width/2,height-width/2,thickness+internalSupportWidth]) cylinder(2, d=width-1);

        %translate([width/2,height-7.5,thickness+internalSupportWidth/2-.5]) cd();
    }
}
