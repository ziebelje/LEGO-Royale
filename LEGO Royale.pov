// 2 = most fancy (for single frame renders)
// 1 = kinda fancy (for faster rendering for animations)
// 0 = no fancy (for testing)
#declare fancy = 1;

// Whether or not to rotate the camera around the object
#declare animate = 1;

#include "ldd_default_colors.inc"
#include "ldd_default_materials.inc"
#include "ldd_part_materials.inc"
#include "ldd_part_bevels.inc"
#include "ldd_part_position_variances.inc"

#declare black = <0/255, 0/255, 0/255>;
#declare white = <255/255, 255/255, 255/255>;
#declare bright_purple = <205/255, 98/255, 152/255>;
#declare bright_red = <196/255, 40/255, 17/255>;
#declare bright_blue = <13/255, 105/255, 171/255>;

#declare ldd_level_of_detail = 1;
#declare ldd_do_not_bevel_transparent_parts = 1;
#declare ldd_light_color = white;
#declare ldd_color_variance = 2.00;

global_settings {
  assumed_gamma 1.4
  max_trace_level 50
  adc_bailout 0.01/2

  #switch(fancy)
    #case(2)
      radiosity {
        count 1600
        nearest_count 20

        error_bound 0.02
        low_error_factor 0.25
        minimum_reuse 0.015
        pretrace_start 64 / image_width
        pretrace_end 4 / image_width
        recursion_limit 1
        gray_threshold 0
        brightness 1
        adc_bailout 0.005
        normal on
        media off
      }
    #break
    #case(1)
      radiosity {
        count 800
        nearest_count 10

        error_bound 0.02
        low_error_factor 0.25
        minimum_reuse 0.015
        pretrace_start 64 / image_width
        pretrace_end 4 / image_width
        recursion_limit 1
        gray_threshold 0
        brightness 1
        adc_bailout 0.005
        normal on
        media off
      }
    #break
    #else
      #include "rad_def.inc"
      radiosity {
        Rad_Settings(Radiosity_Debug, off, off)
      }
  #end
}

sky_sphere  {
  pigment { color rgb <255/255, 255/255, 255/255> }
  rotate <0,0,0>
}

light_source {
  <0, 100, 0>
  color 0.25 * white
  area_light 30, 30, 10, 10
  adaptive 1
  circular
  orient
}

light_source {
  <100, 100, 100>
  color 0.25 * white
  area_light 30, 30, 10, 10
  adaptive 1
  circular
  orient
}

light_source {
  <100, 100, -100>
  color 0.25 * white
  area_light 30, 30, 10, 10
  adaptive 1
  circular
  orient
}

camera {
  right -(image_width / image_height) * x
  location <46, 28, -35>
  look_at <0, 3, 0>
  angle 25

  #if(animate)
    rotate <0, -360 * clock, 0>
  #end
}
