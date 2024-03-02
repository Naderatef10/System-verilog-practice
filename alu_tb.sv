`timescale 1ns/1ps

module alu_tb ();

reg rst_tb;
reg clk_tb;
reg [3:0] A_tb;
reg [3:0] B_tb;
reg [1:0] op_code_tb;
wire signed [5:0] C_tb;

/*defining period as 10ns since time scale is 1ns*/
int period = 10;
int sucessfull_test_cases_counter;
int failed_test_cases_counter;

alu DUT (
.rst(rst_tb),
.clk(clk_tb),
.A(A_tb),
.B(B_tb),
.op_code(op_code_tb),
.C(C_tb)

);

/*clock generation*/
always #5 clk_tb = ~ clk_tb;

initial begin
    /************************initialzing clock and testing reset****************************/
    clk_tb = 0;
    /***********************test case 1**************************************************/
    reset(5);
    if(C_tb == 0)begin
        sucessfull_test_cases_counter++;
    end
    else begin
        failed_test_cases_counter++;
    end
    /*****************************test case 1 testing addition of the ALU****************************/
    A_tb = 4'b0001;
    B_tb = 4'b1001;
    op_code_tb = 2'b00;
    delay(1);
    if(C_tb == 4'b1010)begin
        sucessfull_test_cases_counter++;
    end
    else begin
        failed_test_cases_counter ++;
    end

    /*********************************test case 2 testing addition overflow of the ALU ****************************************/
    A_tb = 4'b1111;
    B_tb = 4'b1111;
    if(C_tb == 5'b11110)begin
        sucessfull_test_cases_counter++;
    end
    else begin
        failed_test_cases_counter ++;
    end
/******************************** test case 3 *******************************************/

    A_tb = 4'b1111;
    B_tb = 4'b1110;
    op_code_tb = 2'b01;
    delay(1);
    if(C_tb == 4'b0001)begin
        sucessfull_test_cases_counter++;
    end
    else begin
        failed_test_cases_counter ++;
    end

/**************************** test case 4 ******************************************/
    A_tb = 4'b1111;
    B_tb = 4'b0001;
    op_code_tb = 2'b10;
    delay(1);
    if(C_tb == 4'b0000)begin
        sucessfull_test_cases_counter++;
    end
    else begin
        failed_test_cases_counter ++;
    end

/********************************* test case 5 *************************************/
    A_tb = 4'b0001;
    B_tb = 4'b1001;
    op_code_tb = 2'b11;
    delay(1);
    if(C_tb == 4'b0001)begin
        sucessfull_test_cases_counter++;
    end
    else begin
        failed_test_cases_counter ++;
    end

/**********************************   Output statistics *****************************************************/
$display("number of sucessfull test cases: %d",sucessfull_test_cases_counter);
$display("number of failed test cases: %d",failed_test_cases_counter);
end
    
task automatic reset(int number_of_cycles);
    
    rst_tb = 0;
    #(number_of_cycles*(period));
    rst_tb = 1;

endtask //automatic

task automatic delay(int number_of_cycles);
    
    #(number_of_cycles*(period));

endtask //automatic

endmodule