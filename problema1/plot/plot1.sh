#!/bin/bash

FMT_BEGIN=201102060000
FMT_END=201102060200
FMT_X_SHOW=%H:%M


graficar()
{
gnuplot << EOF  2> error.log
set xdata time
set timefmt "%Y%m%d %H%M"
set xrange ["$FMT_BEGIN":"$FMT_END"]
set format x "$FMT_X_SHOW"
set terminal png
set output 'fig1.png'
plot "graf-0.dat" using 1:3 with lines title "sensor1","graf-0.dat" using 1:4 with linespoints title "sensor2"
EOF
}

graficar

