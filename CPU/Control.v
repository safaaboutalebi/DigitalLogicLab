module Control#(parameter d = 0)(input [10:0] opcode,
	output reg Reg2Loc,Branch,MemRead,MemWrite,MemtoReg,RegWrite,ALUSrc,
	output reg [1:0] ALUOp
);
	
	always @(opcode)
	#d begin
		if (opcode==0) begin //NOP
			$display("NOP");
		  	Reg2Loc <= 0;
		  	Branch <= 0;
		  	MemRead <= 0;
		  	MemWrite <= 0;
		  	MemtoReg <= 0;
		  	RegWrite <= 0;
		  	ALUSrc <= 0;
		  	ALUOp <= 0;
		end

		if(opcode[10]==1&&opcode[7:4]==4'b0101&&opcode[2:0]==3'b000) begin // R-Type
			$display("R-Type");
		  	Reg2Loc <= 0;
		  	Branch <= 0;
		  	MemRead <= 0;
		  	MemWrite <= 0;
		  	MemtoReg <= 0;
		  	RegWrite <= 1;
		  	ALUSrc <= 0;
		  	ALUOp <= 2'b10;
		end
		else if(opcode[10:3]==8'b11111000) begin // D-Type (Unscaled offset)
			$display("D-Type");
		  	Reg2Loc = 1;	
		  	Branch = 0;
		  	ALUSrc = 1;
		  	ALUOp = 2'b00;			
			if(opcode[1:0]==2'b00) begin //STUR
				$display("/STUR");
		  		MemRead = 0;
		  		MemWrite = 1;
		  		MemtoReg = 0;
		  		RegWrite = 0;
			end
			else if(opcode[1:0]==2'b10) begin //LDUR
				$display("/LDUR");
		  		MemRead = 1;
		  		MemWrite = 0;
		  		MemtoReg = 1;
		  		RegWrite = 1;
			end
		end	

		if(opcode[10:3]==8'b10110100) begin // CB-Type	//CBZ
				$display("CB-Type/CBZ");
				Reg2Loc = 1;
				Branch = 1;
				MemRead = 0;
		  		MemWrite = 0;
		  		MemtoReg = 0;
		  		RegWrite = 0;
		  		ALUSrc = 0;
		  		ALUOp = 2'b01;
		end
		
	end
endmodule
