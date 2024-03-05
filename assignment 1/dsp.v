module dsp #(
    parameter OPERATION = "ADD" 
) (
    input wire [17:0] A,
    input wire [17:0] B,
    input wire [17:0] C,
    input wire [17:0] D,
    input wire clk,
    input wire rst_n,
    output reg [47:0] P
 

);

reg [17:0] A_delayed;
reg [17:0] A_delayed_2;
reg [17:0] B_delayed;
reg [17:0] C_delayed;
reg [17:0] D_delayed;

reg [18:0] ALU_OUT;
reg [18:0] ALU_OUT_reg;
reg [35:0] Multiplier_out;
reg [35:0] Multiplier_out_reg;
reg [47:0] P_int;

/********************input regestering ******************************/
always @(posedge clk , negedge rst_n) begin

    if(!rst_n)begin

        A_delayed <= 18'b0;
        B_delayed <= 18'b0;
        C_delayed <= 18'b0;
        D_delayed <= 18'b0;    
        
    end

    else begin
        
        A_delayed <= A;
        B_delayed <= B;
        C_delayed <= C;
        D_delayed <= D;

    end
    
end

always @(posedge clk , negedge rst_n) begin
    if(!rst_n)begin
        A_delayed_2 <= 0;
    end
    else begin
        A_delayed_2 <= A_delayed;
    end
end

always @(posedge clk , negedge rst_n) begin
    if(!rst_n)begin
        ALU_OUT_reg <= 0;
        Multiplier_out_reg <= 0;
    end
    else begin
        ALU_OUT_reg <= ALU_OUT;
        Multiplier_out_reg <= Multiplier_out;
    end
end


/*ALU operations*/
always @(*) begin
    if(OPERATION == "ADD")begin
        ALU_OUT = D_delayed + B_delayed;
        P_int = Multiplier_out_reg + C_delayed;
    end

    else begin
        ALU_OUT = D_delayed - B_delayed;
        P_int = Multiplier_out_reg - C_delayed;
        
    end
    
end

/*Multiplier operation*/

always @(*) begin
    
    Multiplier_out = ALU_OUT_reg * A_delayed_2;


end
    

/********************** output block *****************/

always @(posedge clk , negedge rst_n) begin

    if(!rst_n)begin    
        P <= 0;
    end
    else begin
        P <=  P_int;
    end 
    
end
/*******************************************************/

endmodule