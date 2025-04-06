use <MCAD/boxes.scad>
$fa=1;
$fs=0.1;

width=80;
depth=width;
height=30;


box(width, depth, height);


module box (width, depth, height) {
    difference(){
        roundedCube(size=[width, depth, height], r=1, center=false, sidesonly=false);
        
        extrusionWidth=width-5;
        extrusionDepth=depth-5;
        extrusionHeight=height-5;
        
        translate([width/2 - extrusionWidth/2, depth/2 -        extrusionDepth/2, height-extrusionHeight+1]) 
        #cube([extrusionWidth, extrusionDepth, extrusionHeight]);
    }
}