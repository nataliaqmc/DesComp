vcom -work work Waveform1.vwf.vht
vsim -novopt -c -t 1ps -L cyclonev -L altera -L altera_mf -L 220model -L sgate -L altera_lnsim work.Aula1_vhd_vec_tst -voptargs="+acc"
add wave /*
run -all
