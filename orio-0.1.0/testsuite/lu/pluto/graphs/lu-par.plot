#!/usr/bin/gnuplot

# plot file for speedup
set data style lp
#set logscale x 2
#set key top left
#set grid


#set ytics ("1x" 1, "2x" 2, "3x" 3, "4x" 4, "5x" 5, \
        #"6x" 6, "7x" 7, "8x" 8) 

set xlabel 'Number of cores' font "Helvetica,16"
set ylabel "GFLOPs" font "Helvetica,16"

set title "LU Decomposition (Parallel) with N=4096" #font "Helvetica,20"

set xtics (1, 2, 3, 4)

set xrange [0.7:4.3]
set yrange [0:18]

set terminal postscript enhanced color eps #"Times-Roman" 22
#set terminal png enhanced tiny size 450,350

set output 'lu-par.eps'
#set output 'lu-par.png'

set style line 1 lt 9 lw 3 pt 3 ps 0.5
set style line 2 lt 7 lw 2 pt 3 ps 0.5

plot 'lu-par.dat' using 1:2 title 'ICC -parallel -fast' ,  \
         '' using 1:3 title 'PLuTo 0.0.1', \
         '' using 1:5 title 'PLuTo+ancc'
