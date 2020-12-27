module MUX2to1#(parameter n=64)(input [n-1:0] in0,in1, input S, output [n-1:0] out);
	assign out = (S)?in1:in0;
endmodule
