module InstructionMemory#(parameter d=0)(input reg [63:0] PC, output [31:0] instruction);
	wire [31:0] addr1 = PC[63:32]>>2,
		 addr2 = PC[31:0]>>2;
	reg [31:0] IM [0:31][0:31];
	initial begin
		IM[0][32'd0] = 32'h8b1f03e5;
		IM[0][32'd1] = 32'b0;
		IM[0][32'd2] = 32'hf84000a4; 
		IM[0][32'd3] = 32'h8b040086; 
		IM[0][32'd4] = 32'hf80010a6; 
		//for (ins=0;ins<=32'hfffffff;ins = ins + 1)
		//begin
		//	IM[32'd0][ins[31:0]] = ins[31:0];
		//	IM[32'hffffffff][ins[31:0]] = ins[31:0];
		//end
	end
	assign #d instruction = IM[addr1][addr2];
endmodule	