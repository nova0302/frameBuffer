
QUARTUS_ROOT?= C:/tools/hardware/hdl/intelFPGA_lite/17.0/quartus
DEVICE_FAMILY = cycloneive
#DEVICE_FAMILY = maxv

PROJECT = led_test
TB = ./../../../rtl/verilog/$(PROJECT)_tb.v
TB_MODULE = $(PROJECT)_tb

NET_LIST = $(PROJECT).vo

VLOG_ARGS = -quiet +incdir+./../../../rtl/verilog +define+GATE_SIM

VSIM_ARGS = -quiet -t ps +transport_int_delays +transport_path_delays \
 -L $(DEVICE_FAMILY)_ver \
 -L 220model_ver \
 -L altera_ver \
 -L altera_mf_ver \
 -L fiftyfivenm_ver \
 -do "run -all"

# -L altera_lnsim \

WORK = work

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
	$(V)echo " -------   Generating $(WORK) directory if it does not exist!!! ----------"
	$(V)if [ -d $(WORK) ]; then vdel -lib $(WORK) -all && vlib $(WORK); fi
	$(V)if [ ! -d $(WORK) ]; then vlib $(WORK); fi

$(NET_LIST): 
	$(V)echo " "
	$(V)echo " ------- cleaning the directory for netlist generation for cyclone device !!!!! -----------"
	$(V)make -C ./../../pnr/quartus/ clean
	$(V)echo " ------- Building the project for gate simulations for cyclone device !!!!! -----------"
	$(V)make -C ./../../pnr/quartus/ GATE_SIM=1
	$(V)echo " ------- Generating netlist if it has'n benn generated yet !!!!! -----------"
	$(V)make -C ./../../pnr/quartus/ netlist 
clean:
	$(V)echo " "
	$(V)echo " ------- Clearing up this folder!!!!! ---------"
	$(V)rm -rf *.vo *.sdo *.xrf *.sft transcript $(WORK) *.wlf *.csd verilog_libs *.vo *.sdo *.sft *.wlf *.tcl
