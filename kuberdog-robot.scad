$fn=1000;

have_origins = true;
module origin(thickness) {
    if(have_origins) {
      cube([thickness,20,10000]);
      cube([thickness,10000, 20]);
    }
}
module evolution(n) {
  span = 1000;
  translate([span * n + 5, 0 ,0]) {
    gap = 50;
    translate([2 + gap,0,0]) children();
    origin_thickness = 40;
    translate([span-origin_thickness,0,0]) origin(origin_thickness);
  }
}

evolution(0) {
  cube([10,10,10]);
}

evolution(1) {
  cube([100,100,100]);
}

evolution(2) {
  cube([50,1000,1000]);
  translate([400,0,0]) cube([50,1000,1000]);
}

evolution(3) {
  y = 500;
  cube([50,y,1000]);
  translate([400,0,0]) cube([50,y,1000]);
}

//  ================================================

module arm(height, gap) {
  y = 500;
  cube([50,y,height]);
  translate([gap,0,0]) cube([50,y,height]);
}
evolution(4) {
  arm_height = 1000;
  smaller_arm_gap = 200;
  arm(arm_height, 400);
  translate([smaller_arm_gap / 2, 0,arm_height]) rotate([-90,0,0]) arm(arm_height, 200);
}

// ================================================
module arm(height, gap) {
  y = 500;
  cube([50,y,height]);
  translate([gap,0,0]) cube([50,y,height]);
}

module lower_arm(arm_height) {
  difference() {
    arm(arm_height, 400);
    translate([- 10, 250, arm_height - 200]) rotate([0, 90, 0]) cylinder(r = 100, h = 800);
  }
}
module upper_arm(arm_height) {
  smaller_arm_gap = 200;
  translate([smaller_arm_gap / 2, 0, arm_height]) rotate([- 90, 0, 0]) arm(arm_height, 200);
}

evolution(5) {
  arm_height = 1000;
  upper_arm(arm_height);
  lower_arm(arm_height);
}
