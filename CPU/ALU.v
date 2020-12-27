module ALU#(parameter d=0)(input [63:0] dataA,dataB,
	input [3:0] ALUctrl,
	output [63:0] ALUres,
	output Z,C
);
	reg [64:0] res_temp;
	reg z_temp;
	always @(*)
	begin
		z_temp = 0;
		case(ALUctrl)
		4'b0000: #d res_temp = dataA & dataB;
		4'b0001: #d res_temp = dataA | dataB;
		4'b0010: #d res_temp = dataA + dataB;
		4'b0110: #d res_temp = dataA - dataB;
		4'b0111: #d res_temp = dataB;
		4'b1100: #d res_temp = ~(dataA | dataB);
		endcase
		if(res_temp[63:0]==0)
		begin
			z_temp = 1;
		end
	end
	assign ALUres = res_temp[63:0];
	assign C = res_temp[64];
	assign Z = z_temp;
endmodule
