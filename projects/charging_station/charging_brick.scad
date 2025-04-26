use <MCAD/boxes.scad>
use <./../../utils.scad>

size=[80, 80, 29];
clipHeight=17;
thickness=2;
radius=10;

difference() {
    roundedCube([size.x+thickness*2, size.y+thickness*2, size.z+thickness], r=radius+thickness, sidesonly=true);
    #translate([CENTER(size.x+thickness*2,size.x),CENTER(size.y+thickness*2,size.y),thickness]) roundedCube([size.x, size.y, size.z], r=radius, sidesonly=true);
    #translate([CENTER(size.x,size.x-radius*2),0,thickness]) cube([size.x-radius*2, size.y+thickness*2, size.z]);
}