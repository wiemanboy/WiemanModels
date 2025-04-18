module cd() {
    // diamaterEdge, diamaaterCenter, width
    cdSize = [120, 15, 1.2];
    color([1,1,1]) difference() {
        cylinder(d=cdSize[0], h=cdSize[2],);
        cylinder(d=cdSize[1], h=cdSize[2],);
    }
}

module case() {
    color([.2,.2,.2]) cube([140, 12, 140]);
}