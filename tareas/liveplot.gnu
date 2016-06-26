#set xrange [0:200]
set yrange [0:100]
plot "plot.dat" using 1 with lines title "Consumo % CPU"
pause 1
reread
