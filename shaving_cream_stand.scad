$fa=1;
$fs=0.1;

width=55;
height=20;

union() {
    stand(width, height);
    rotate_extrude()
    translate([width/2+1.5, height, 0])
    circle(r = 1);
}

module stand(width, height) {
    difference() {
        cylinder(height, d=width+5);

        floorHeight=3;
        cylinder(height-floorHeight, d=width);
        
        radius=2;
        translate([radius, 0, 0]) cylinder(height+1, d=2);
        translate([-radius/2, sqrt(3)/2*radius, 0]) cylinder(height+1, d=2);
        translate([-radius/2, -sqrt(3)/2*radius, 0]) cylinder(height+1, d=2);
        
        negativeFeat(width, height);
        rotate([0,0,90]) {
            negativeFeat(width, height);
        }
    }
}

module negativeFeat(width, height) {
    featNegativeHeight=height-10;
    featNegativeWidth=30;

    rotate([90,0,0]) {
        translate([-featNegativeWidth/2, 0, -width/2-5]) linear_extrude(height=width+10) polygon([
            [0, 0],
            [featNegativeWidth/2-5, featNegativeHeight],
            [featNegativeWidth/2+5, featNegativeHeight],
            [featNegativeWidth, 0],
        ]);
    }
}