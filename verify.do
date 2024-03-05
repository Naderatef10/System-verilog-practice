vlog *.v +cover 
vsim work.dsp -voptargs="+acc" -coverage -do "run 100; coverage report -codeall -cvg -verbose"
add wave *


