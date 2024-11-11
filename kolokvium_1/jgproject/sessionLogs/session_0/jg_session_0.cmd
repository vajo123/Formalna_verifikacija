#----------------------------------------
# JasperGold Version Info
# tool      : JasperGold 2019.06
# platform  : Linux 3.10.0-1160.el7.x86_64
# version   : 2019.06p002 64 bits
# build date: 2019.08.30 18:14:52 PDT
#----------------------------------------
# started Mon Nov 11 17:29:43 CET 2024
# hostname  : ws7.lab003.kel.net
# pid       : 21998
# arguments : '-label' 'session_0' '-console' 'ws7.lab003.kel.net:45262' '-style' 'windows' '-data' 'AQAAADx/////AAAAAAAAA3oBAAAAEABMAE0AUgBFAE0ATwBWAEU=' '-proj' '/nethome/vajo.simic/Desktop/Formalna_verifikacija/kolokvium_1/jgproject/sessionLogs/session_0' '-init' '-hidden' '/nethome/vajo.simic/Desktop/Formalna_verifikacija/kolokvium_1/jgproject/.tmp/.initCmds.tcl' 'do.tcl'
analyze -vhdl2k black_box.vhd
analyze -sv09 top.sv
elaborate -top {top}
clock clk
reset rst
prove -bg -all
visualize -violation -property <embedded>::top._assert_7 -new_window
visualize -property <embedded>::top._assert_1:precondition1 -new_window
