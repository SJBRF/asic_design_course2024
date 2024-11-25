export DESIGN_NICKNAME = VSDbabysoc_pri
export DESIGN_NAME = vsdbabysoc
export PLATFORM    = sky130hd


export VSDbabysoc_pri_DIR = $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)

export VERILOG_FILES =  $(sort $(wildcard $(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/*.v \
	 $(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/vsdbabysoc.v \
	 ))
	 
export VERILOG_INCLUDE_DIRS = $(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/include
export SDC_FILE      = $(wildcard $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/constraints.sdc)
export ADDITIONAL_LEFS = $(wildcard $(VSDbabysoc_pri_DIR)/avsddac.lef) \
			$(wildcard $(VSDbabysoc_pri_DIR)/avsdpll.lef)
export ADDITIONAL_LIBS = $(wildcard $(VSDbabysoc_pri_DIR)/lib/*.lib)
export ADDITIONAL_GDS  = $(wildcard $(VSDbabysoc_pri_DIR)/gds)


export PLACE_OPT_CONGESTION_DRIVEN = 1

#export FP_PIN_ORDER_CFG = $(wildcard $ (VSDbabysoc_pri_DIR)/pin_order.cfg)
export FP_SIZING = absolute
export DIE_AREA = 0 0 3000 3000
export CORE_AREA = 50 50 2900 2900

export global_pins_spacing = 20


export MACRO_PLACEMENT = $(VSDbabysoc_pri_DIR)/macro.cfg

#export CORE_UTILIZATION = 30
export PLACE_DENSITY_LB_ADDON = 0.1

export REMOVE_ABC_BUFFERS = 1
