`timescale 1ns / 1ps

// Author: Abdelrahman Nasser Taha

module timer_input #(parameter BITS = 4)(
    input clk,
    input reset_n,
    input enable,
    input [BITS - 1:0] FINAL_VALUE,
    output tick
    );
    
    reg [BITS - 1:0] Q_reg, Q_next;
    
    always @(posedge clk, negedge reset_n)
    begin
        if (~reset_n)
            Q_reg <= 'b0;
        else if(enable)
            Q_reg <= Q_next;
        else
            Q_reg <= Q_reg;
    end
    
    // Next state logic
    assign tick = Q_reg == FINAL_VALUE;

    always @(*)
        if(Q_reg >= FINAL_VALUE)
            Q_next = 'b0;
        else
            Q_next = tick? 'b0: Q_reg + 1;
    
    
endmodule
