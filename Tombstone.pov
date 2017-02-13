#version 3.6;

#include "LEGO Royale.pov"

light_source { <-0.5, 1, -0.5>, 3*bright_blue }
light_source { <-0.5, 1, 0.5>, 3*bright_blue }
light_source { <0.5, 1, -0.5>, 3*bright_blue }

#include "Tombstone/Tombstone.pov"

ldd_model
