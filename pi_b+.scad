/*
Rasperrby Pi B+

James Brandreth
*/



// PCB Dimensions
width = 56;
length = 85;
depth = 2;

circle_quality = 0.1;

module corner_chamfer(radius){
    difference() {
        square([radius,radius]);
        circle(r=radius, $fs=circle_quality);
    };
}

module rounded_square(dims, radius) {
    difference() {
        square(dims);
        rotate(180) translate([-radius,-radius]) corner_chamfer(radius);
        translate([dims[0]-radius, radius])rotate(270) corner_chamfer(radius);
        translate([radius, dims[1]-radius])rotate(90)  corner_chamfer(radius);
        translate([dims[0]-radius, dims[1]-radius]) corner_chamfer(radius);
    }
}

module hole() {
    cylinder(d=2.75, h=depth+2, $fs=circle_quality);
}

module board() {
    difference() {
        color("green")  linear_extrude(height = depth) rounded_square([width,length], 3);
        translate([3.5, 3.5,-1]) hole();
        translate([width-3.5, 3.5,-1]) hole();
        translate([3.5, 3.5+58,-1]) hole();
        translate([width-3.5, 3.5+58,-1]) hole();
    }
}

board();