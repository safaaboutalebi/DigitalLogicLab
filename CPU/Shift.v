module Shift(input [63:0] in, input [4:0] shVal, input LR, output [63:0] out);
	assign out = (LR)? (in >> shVal) : (in << shVal);
endmodule
