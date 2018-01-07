
* Important
  - the pin file should have one blank line at the top of the file.

* This is a sample project for Systemverilog sim and pnr with Modelsim and Quartus.

** rtl simulation.
   1. go to ./sim/modelsim/
   2. put your design files(verilog & systemverilog) in ./rtl/verilog/
   3. "make"

** to pnr your design
   1. go to ./pnr/quartus
   2. "make"

** download the design to FPGA
   1. go to ./pnr/quartus
   2. "make program"
