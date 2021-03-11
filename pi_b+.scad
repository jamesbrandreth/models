/*
Rasperrby Pi B+

James Brandreth
*/



// PCB Dimensions
width = 56;
length = 85;
depth = 2.75;

module hole() {
    cylinder(d=2.75, h=depth+2, $fs=0.1);
}

module board() {
    difference() {
        color("green")  linear_extrude(height = depth) square([width,length]);
        translate([3.5, 3.5,-1]) hole();
        translate([width-3.5, 3.5,-1]) hole();
    }
}

board();