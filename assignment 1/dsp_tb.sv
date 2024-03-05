`timescale 1ns/1ps
`define PERIOD 10
module dsp_tb ();

 reg [17:0] A_tb;
 reg [17:0] B_tb;
 reg [17:0] C_tb;
 reg [17:0] D_tb;
 reg clk_tb;
 reg rst_n_tb;
 wire [47:0] P_tb;
 


always #((`PERIOD)/2) clk_tb = ~ clk_tb;

class transaction;

randc logic [17:0] A;
randc logic [17:0] B;
randc logic [17:0] C;
randc logic [17:0] D;

/* constraint const1 {

    A inside {[0:5]};
    B inside {[0:5]};
    C inside {[0:5]};
    D inside {[0:5]};

}
 */
function new();
        
endfunction //new()

endclass //transaction

 dsp  #(.OPERATION("ADD")) DUV (

.A(A_tb),
.B(B_tb),
.C(C_tb),
.D(D_tb),
.clk(clk_tb),
.rst_n(rst_n_tb),
.P(P_tb)

 );

initial begin
    transaction t1;
    t1 = new();
    clk_tb = 0;
    reset(5); // 5 clock cycles reset

    for(int i = 0; i < 26214 ; i++)begin
        if (t1.randomize())begin
            
        end
        else begin
            $display("randomization failed !!!!");
        end
        A_tb = t1.A;
        B_tb = t1.B;
        C_tb = t1.C;
        D_tb = t1.D;
        delay(4);
    end
     reset(5);
    $stop;

end



 task automatic reset(int number_of_cycles);
    
    rst_n_tb = 0;
    #(number_of_cycles*(`PERIOD));
    rst_n_tb = 1;

endtask //automatic

task automatic delay(int number_of_cycles);
    
    #(number_of_cycles*(`PERIOD));

endtask //automatic
    
endmodule