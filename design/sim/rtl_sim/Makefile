#VLIB = $(shell which vlib)
#VLOG = $(shell which vlog)
#VSIM = $(shell which vsim)
VLIB =  vlib
VLOG =  vlog
VSIM =  vsim

WORK = work

#VLOG_OPTIONS = -sv -lint -y $(VDIR) +libext+.sv +incdir+$(VDIR) +define+SIMULATION
VSIM_OPTIONS = -c -novopt -do "run -all; quit"
GVSIM_OPTIONS = -novopt -do "add wave *; radix -hex; run -all; quit"

VDIR =./../../../rtl/verilog
_VSRCS=$(DUT).v $(DUT)_tb.v
VSRCS =$(patsubst %,$(VDIR)/%,  $(_VSRCS))
#VSRCS =$(wildcard $(VDIR)/*.sv)

#DUT  = led_test
DUT  = rrarb
TB   = $(DUT)_tb
V=@
all: lib com sim
sim:com
	$(V)echo " "
	$(V)echo " -------   Starting Simulation!!!!!  --------------------"
	$(VSIM) $(VSIM_OPTIONS) $(WORK).$(TB)
gsim:
	$(V)echo " "
	$(V)echo " -------   Starting Simulation!!!!!  --------------------"
	$(VSIM) $(GVSIM_OPTIONS) $(WORK).$(TB)
com:
	$(V)echo " "
	$(V)echo " -------   Compiling verilog source files !!! ------------"
	$(VLOG) $(VLOG_OPTIONS) -work $(WORK) $(VSRCS)
#	$(V)echo " "
#	$(V)echo " -------   Compiling testbench !!! ------------"
#	$(VLOG) $(VLOG_OPTIONS) -work $(WORK) $(VDIR)/$(TB).sv
#	$(VLOG) $(VLOG_OPTIONS) -f vlog.args

lib:
	$(V)echo " -------   Generating $(WORK) directory if it does not exist!!! ----------"
	if [ ! -d $(WORK) ]; then vlib $(WORK); fi

clean:
	rm -rf $(WORK) transcript *.wlf
