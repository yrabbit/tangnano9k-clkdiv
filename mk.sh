#!/bin/sh
yosys -p "read_verilog src/blinky-clkdiv-dhcen.v; synth_gowin -top top -json top-synth.json"
nextpnr-himbaechel -v --debug --device GW1NR-LV9QN88PC6/I5 --json top-synth.json --write pnr.json --vopt family=GW1N-9C --vopt cst=src/tangnano9k.cst
gowin_pack --sspi_as_gpio --mspi_as_gpio -d GW1N-9C -o top.fs pnr.json
