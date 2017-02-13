#version 3.6;

#include "LEGO Royale.pov"

light_source {
  <0, 3, 0>
  color 3 * bright_red
  area_light <1, 0, 0>, <0, 0, 1>, 20, 20
  adaptive 1
}

light_source {
  <0, 5, 0>
  color 1 * bright_red
  area_light <1, 0, 0>, <0, 0, 1>, 20, 20
  adaptive 1
}

#include "Furnace/Furnace.pov"

ldd_model
