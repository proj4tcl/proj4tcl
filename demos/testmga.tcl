#!/usr/bin/env tclsh
package require proj

set pos [list 502810 6964520 0]
puts $pos

puts ""

set cs [proj crs2crs EPSG:28356 EPSG:4283]
set result [proj fwd $cs $pos]
puts [format "%.9f %.9f %.3f" {*}$result]
# output -> -27.44279 153.02843 0.0
set result2 [proj inv $cs $result]
puts [format "%.5f %.5f %.3f" {*}$result2]

puts ""

set cs [proj crs2crs EPSG:7856 EPSG:7844]
set cs [proj norm $cs]
set result [proj fwd $cs $pos]
puts [format "%.9f %.9f %.3f" {*}$result]
# output -> -27.44279 153.02843 0.0
set result2 [proj inv $cs $result]
puts [format "%.5f %.5f %.3f" {*}$result2]

puts ""

set cs [proj crs2crs EPSG:28356 EPSG:7856]
set result [proj fwd $cs $pos]
puts [format "%.3f %.3f %.3f" {*}$result]
set result2 [proj inv $cs $result]
puts [format "%.3f %.3f %.3f" {*}$result2]

puts ""

set mga2gda [proj crs2crs epsg:28356 epsg:4283]
set gda2ahd [proj crs2crs epsg:4939 epsg:9464]
set result [proj inv $mga2gda [proj inv $gda2ahd [proj fwd $mga2gda $pos]]]
puts [format "%.3f %.3f %.3f" {*}$result]

puts ""

set mga2gda [proj crs2crs epsg:7856 epsg:7844]
set gda2ahd [proj crs2crs epsg:7843 epsg:9463]
set result [proj inv $mga2gda [proj inv $gda2ahd [proj fwd $mga2gda $pos]]]
puts [format "%.3f %.3f %.3f" {*}$result]

