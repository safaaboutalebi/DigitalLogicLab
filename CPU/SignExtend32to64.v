module SignExtend32to64(input [31:0] ins, output reg [63:0] out);
	always @(ins) begin
		case(ins[31:29])
		3'b010: out = { {55{ins[20]}}  , ins[20:12] }; //D-Type
		3'b100: out = { {45{ins[23]}}  , ins[23:5] }; //CBZ
		endcase
	end
endmodule
