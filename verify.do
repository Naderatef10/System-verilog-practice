
#final Do file 
#Create a directory where compilation files are stored, default is 'work'
vlib work

#Compile design in that order
vlog  +cover +acc dsp.v dsp_tb.sv

#Load the top module for simulation

vsim -coverage -vopt work.dsp_tb   
add wave *
run -all
coverage report -output report.txt  -cvg -codeAll -verbose
coverage save dsp_tb.ucdb -onexit
exit 
