MATLAB=matlab -nodisplay -nodesktop -nojvm -nosplash

all : run_code # compile_matlab
	echo "Done everything"

run_code : ./master_file.m ./make_db.m
	$(MATLAB) < make_db.m
	$(MATLAB) < $<


compile_matlab : ./Suite2P/SpikeDetection/deconvL0.c 
	@echo "Compiling c code"
	mex -largeArrayDims $<
