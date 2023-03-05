
span = 500;

module evolution(n) {
  translate([span * n, 0 ,0]) children();
}

evolution(0) {
  cube([10,10,10]);
}



evolution(1) {
  cube([100,100,100]);
}

