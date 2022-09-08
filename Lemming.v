`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: NIST
// Engineer: Kirti Kumar
// 
// Create Date: 08.09.2022 00:46:33
// Design Name: 
// Module Name: Lemming
// Project Name: Lemming game design in verilog 
// Description: 
//
//////////////////////////////////////////////////////////////////////////////////


module Lemming(clk,areset,bump_left,bump_right,walk_left,walk_right);
input clk; // Clock signal
input areset; // Asynchronous Reset signal
input bump_left; // Marks when obstacle is hit on left
input bump_right; // Marks when obstacle is hit on right
output walk_left;  // Movement in left direction
output walk_right; // Movement in right direction 
parameter LEFT=0, RIGHT=1; // Makes default direction for walking is towards right
reg state, next_state;
always @(*) begin
case(state)
LEFT:next_state=(bump_left)?RIGHT:LEFT;
RIGHT:next_state=(bump_right)?LEFT:RIGHT;
endcase
end
always @(posedge clk, posedge areset) begin
if(areset)
state<=LEFT;
else
state<=next_state;
end
assign walk_left=(state==LEFT);
assign walk_right=(state==RIGHT);
endmodule
    

