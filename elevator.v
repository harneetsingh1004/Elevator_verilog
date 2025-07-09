`timescale 1ns / 1ps

module elevator(input clk, input [3:0] floor, output [3:0] y);
reg [3:0] cf = 4'b0001;
reg [31:0] clkdiv = 32'd0;

always @(posedge clk)
    clkdiv = clkdiv + 1;

always @(posedge clkdiv[24])
begin
    if (floor < cf)
    begin
        if (cf == 4'b0001)
            cf = 4'b0001;
        else
            cf = cf >> 1;
    end
    else if (floor > cf)
        cf = cf << 1;
    else if (floor == cf)
        cf = floor;
end

assign y = cf;

endmodule
