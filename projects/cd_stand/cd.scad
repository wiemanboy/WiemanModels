module cd() {
    // diamaterEdge, diamaaterCenter, width
    cdSize = [120, 15, 1.2];
    difference() {
        cylinder(d=cdSize[0], h=cdSize[2],);
        cylinder(d=cdSize[1], h=cdSize[2],);
    }
}