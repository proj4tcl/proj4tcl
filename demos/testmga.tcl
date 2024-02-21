#!/usr/bin/env tclsh
package require proj

set pos [list 502810 6964520 0]
puts $pos
set cs [proj crs2crs EPSG:28356 EPSG:4283]
puts $cs
set result [proj fwd $cs $pos]
puts [format "%.9f %.9f %.3f" {*}$result]
# output -> -27.44279 153.02843 41.901
set result2 [proj inv $cs $result]
puts [format "%.5f %.5f %.3f" {*}$result2]

set cs [proj crs2crs EPSG:7856 EPSG:7844]
puts $cs
set result [proj fwd $cs $pos]
puts [format "%.9f %.9f %.3f" {*}$result]
# output -> -27.44279 153.02843 41.901
set result2 [proj inv $cs $result]
puts [format "%.5f %.5f %.3f" {*}$result2]
