module alu (
    input wire rst,
    input wire clk,
    input wire [3:0] A,B,
    input wire [1:0] op_code,
    output reg signed [5:0] C
);
    /*internal signals*/
reg signed [5:0] C_comb;


/*combinational logic*/

always @(*) begin
    
    case(op_code)
        
        2'b00:begin
            C_comb = A+B;
            
        end
        2'b01:begin
            C_comb = A-B;
            
        end
        2'b10:begin
            C_comb = ~A;
            
        end
        2'b11:begin
            C_comb = |B;
            
        end

    endcase


end


/*sequential logic*/

always @(posedge clk , negedge rst) begin
    
    if(!rst)begin
        C <= 0;
    end
    else begin
        C <= C_comb;
    end

end


endmodule