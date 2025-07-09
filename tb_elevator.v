`timescale 1ns / 1ps
module tb_elevator;

    reg clk;
    reg [3:0] floor;
    wire [3:0] y;

    elevator uut (
        .clk(clk),
        .floor(floor),
        .y(y)
    );
    always #5 clk = ~clk;
    
    initial begin
        clk = 0;
        floor = 4'b0001;  // Start at floor 1
        #100000000;

        floor = 4'b0010;  // Move to floor 2
        #100000000;

        floor = 4'b0100;  // Move to floor 3
        #100000000;

        floor = 4'b0001;  // Back to floor 1
        #100000000;

        $stop;
    end

endmodule
