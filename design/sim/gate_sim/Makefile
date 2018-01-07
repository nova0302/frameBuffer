
QUARTUS_ROOT?= C:/intelFPGA_lite/17.0/quartus
DEVICE_FAMILY = cycloneive

PROJECT = led_test
TB = ./../../../rtl/verilog/$(PROJECT)_tb.sv
TB_MODULE = $(PROJECT)_tb

NET_LIST = $(PROJECT).vo

VLOG_ARGS = -quiet +incdir+./../../../rtl/verilog

VSIM_ARGS = -quiet -t ps +transport_int_delays +transport_path_delays \
 -L $(DEVICE_FAMILY)_ver \
 -L 220model_ver \
 -L altera_ver \
 -do "run -all"

WORK = gate_work

V?=@
all: lib com sim
sim: 
	$(V)echo " "
	$(V)echo " -------   Starting Simulation!!!!!  --------------------"
	$(V)vsim -c $(VSIM_ARGS) $(WORK).$(TB_MODULE)
gsim: 
	$(V)echo " "
	$(V)echo " -------   Starting GUI Simulation!!!!!  --------------------"
	$(V)vsim $(VSIM_ARGS) $(WORK).$(TB_MODULE)
com: $(NET_LIST) 
	$(V)echo " "
	$(V)echo " -------   Compiling testbench & netlist !!! ------------"
	$(V)vlog $(VLOG_ARGS)  -work $(WORK) $(NET_LIST) $(TB)
lib:
	$(V)echo " -------   Generate work directory if it does not exist!!! ----------"
	$(V)if [ -d $(WORK) ]; then vdel -lib $(WORK) -all && vlib $(WORK); fi
	$(V)if [ ! -d $(WORK) ]; then vlib $(WORK); fi

$(NET_LIST): 
	$(V)echo " "
	$(V)echo " ------- Generating netlist!!!!! -----------"
	$(V)make -C ./../../pnr/quartus/ netlist
clean:
	$(V)echo " "
	$(V)echo " ------- Clearing this folder!!!!! ---------"
	$(V)rm -rf *.vo *.sdo *.xrf *.sft transcript $(WORK) *.wlf *.csd verilog_libs *.vo *.sdo *.sft *.wlf *.tcl
