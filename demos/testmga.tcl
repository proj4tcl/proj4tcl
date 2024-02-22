#!/usr/bin/env tclsh
package require proj

set zone 56
set pos [list 502810 6964520 0]
puts $pos

puts ""

set cs [proj crs2crs EPSG:283$zone EPSG:4283]
set result [proj fwd $cs $pos]
puts [format "%.9f %.9f %.3f" {*}$result]
set result2 [proj inv $cs $result]
puts [format "%.5f %.5f %.3f" {*}$result2]

puts ""

set cs [proj crs2crs EPSG:78$zone EPSG:7844]
set cs [proj norm $cs]
set result [proj fwd $cs $pos]
puts [format "%.9f %.9f %.3f" {*}$result]
set result2 [proj inv $cs $result]
puts [format "%.5f %.5f %.3f" {*}$result2]

puts ""

set cs [proj crs2crs EPSG:283$zone EPSG:78$zone]
set result [proj fwd $cs $pos]
puts [format "%.3f %.3f %.3f" {*}$result]
set result2 [proj inv $cs $result]
puts [format "%.3f %.3f %.3f" {*}$result2]

puts ""

set mga2gda [proj crs2crs epsg:283$zone epsg:4283]
set gda2ahd [proj crs2crs epsg:4939 epsg:9464]
set result [proj inv $mga2gda [proj fwd $gda2ahd [proj fwd $mga2gda $pos]]]
puts [format "%.3f %.3f %.3f" {*}$result]

puts ""

set mga2gda [proj crs2crs epsg:78$zone epsg:7844]
set gda2ahd [proj crs2crs epsg:7843 epsg:9463]
set result [proj inv $mga2gda [proj fwd $gda2ahd [proj fwd $mga2gda $pos]]]
puts [format "%.3f %.3f %.3f" {*}$result]

puts ""

set S    "+proj=pipeline  +zone=$zone +south +ellps=GRS80"
append S " +step +inv +proj=utm"
append S " +step +proj=vgridshift +grids=au_ga_AUSGeoid09_V1.01.tif"
append S " +step +proj=utm"
set cs [proj create $S]
set result [proj fwd $cs $pos]
puts [format "%.3f %.3f %.3f" {*}$result]

puts ""

set S    "+proj=pipeline  +zone=$zone +south +ellps=GRS80"
append S " +step +inv +proj=utm"
append S " +step +proj=vgridshift +grids=au_ga_AUSGeoid2020_20180201.tif"
append S " +step +proj=utm"
set cs [proj create $S]
set result [proj fwd $cs $pos]
puts [format "%.3f %.3f %.3f" {*}$result]
