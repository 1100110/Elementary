##############################################################################
#	Ok, here's the deal.  
#	If you have dmd installed, just run:
#make
#	else run:
#make gdmd or 
#make gdc
##############################################################################	

DC:=dmd
DFLAGS:=-wi 

INCLUDE=-I../elementary -I../eina -I../eina/eina -I../evas 	\
	 	-I../ecore -I../edje

LIBS:=-lelementary -leina -lecore -levas -ledje 	\
	     -lm -lpthread -lrt
OUT:=-of
SOURCES=first second clock_example button_example_00 table_example_01


## WARNING I don't know how portable this is, it grabs the number of cores.
## Feel free to override with make -er JOPTS="1" 
JOPTS:=$(shell awk '/^processor/ { N++} END { print N }' /proc/cpuinfo)
MAKE=make -er -j$(JOPTS: %=%)	#Stupid whitespace...
################################################################################
#	'all' assumes that flags conform to dmd. (dmd -inline -O...)
#	It also assumes that you have DC and DFLAGS predefined.
################################################################################
#For dmd-ish compilers
dmd: 
	$(MAKE) LIBS="$(LIBS:%=-L%)" everything
#For gdc
everything: $(SOURCES)

%: %.o
	$(DC) $< $(LIBS) $(OUT)$@

%.o: %.d
	$(DC) $(DFLAGS) $(INCLUDE) -c $<


################################################################################
#	Compile with gdmd and/or gdc if you have them.
################################################################################
gdmd:
	$(MAKE) DC="gdmd" dmd
###		For some reason gdmd works on my system, but gdc doesn't...
gdc:
	$(MAKE) DC="gdc" DFLAGS="-O2 -pipe -march=native" \
	OUT="-o" everything

################################################################################
#	Clean up all of the files [g]dmd could have possibly written.
################################################################################
clean:
	rm -rf *.o *.gcov *.gcda *.gcno $(SOURCES)

