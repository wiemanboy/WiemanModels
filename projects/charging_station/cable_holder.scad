cableHolderHeight=5;
cableHolderWidth=12;
cableWidth=5;
cableDepth=cableHolderWidth-2;
thickness=2;
between=4;
cables=5;

width=70;
clipHeight=17;
clipWidth=10;

watchHolderHeight=3;
watchChargerDiamater=38;
watchGap=30;
chargerGap=15;

translate([0,cableHolderWidth,0])tableClip();
translate([0,0,clipHeight+thickness*2-cableHolderHeight]) cableHolder();
translate([thickness*2+between*(cables-1)+cableWidth*cables,0,clipHeight+thickness*2]) watchHolder();

module tableClip() {
    difference() {
        cube([width,clipWidth+thickness,clipHeight+thickness*2]);
        translate([0,thickness,thickness])cube([width,clipWidth,clipHeight]);
    }
}

module cableHolder() {
    difference() {
        cube([thickness*2+between*(cables-1)+cableWidth*cables,cableHolderWidth,cableHolderHeight]);

        for (i=[0:cables-1]) {
            translate([thickness+between*i+cableWidth*i,0,0]) #cube([cableWidth,cableDepth,cableHolderHeight]);
        }
    }
}

module watchHolder() {
    difference() {
        translate([(watchChargerDiamater+thickness)/2,(watchChargerDiamater+thickness)/2,0]) cylinder(watchHolderHeight+thickness, d=watchChargerDiamater+thickness);
        #translate([watchChargerDiamater/2+thickness/2,watchChargerDiamater/2+thickness/2,thickness]) cylinder(watchHolderHeight, d=watchChargerDiamater);
    }
}