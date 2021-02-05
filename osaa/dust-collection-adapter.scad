// Plate Dimensions
plate_width = 130;
plate_height = 58;
plate_thickness = 3;

// Screw Hole Variables
screw_hole_diameter = 2;
screw_hole_center_distance_from_side = 8;

// Hose Adapter Variables
hose_adapter_lower_diameter = 37;
hose_adapter_upper_diameter = 34.5;
hose_adapter_wall_thickness = 2;
hose_adapter_height = 40;

// Inner Hose Adapter Calculated Variables
inner_hose_adapter_lower_diameter = hose_adapter_lower_diameter - hose_adapter_wall_thickness * 2;
inner_hose_adapter_upper_diameter = hose_adapter_upper_diameter - hose_adapter_wall_thickness * 2;

// Hose Adapter
translate([0,0,plate_thickness])
difference() {
  cylinder(r1 = hose_adapter_lower_diameter/2, r2 = hose_adapter_upper_diameter/2, h = hose_adapter_height);
  cylinder(r1 = inner_hose_adapter_lower_diameter/2, r2 = inner_hose_adapter_upper_diameter/2, h = hose_adapter_height);
}

difference() {
  // Plate
  translate([-plate_width/2, -plate_height/2, 0])
  cube([plate_width,plate_height,plate_thickness]);

  // Hose Hole
  cylinder(r = inner_hose_adapter_lower_diameter/2, h = plate_thickness);

  // Screw Holes
  for(a = [plate_width/2-screw_hole_center_distance_from_side,-plate_width/2+screw_hole_center_distance_from_side])
    for(b = [plate_height/2-screw_hole_center_distance_from_side,-plate_height/2+screw_hole_center_distance_from_side])
      translate([a, b, 0])
      cylinder(r = screw_hole_diameter/2, h = plate_thickness);
}


