module RegisterBank(
		input write, clk,
		input [4:0] a,b,c,
		input [63:0] dataC,
		output [63:0] dataA, dataB 
	);

	reg [63:0] R[31:0];
	assign	dataA = R[a];
	assign	dataB = R[b];

	integer i;
	initial begin
		R[31] = 0;
		for (i=0;i<31;i = i +1 ) begin
			R[i] = i;
		end
	end

	
	
	always @(posedge clk)
	begin			

			if (write == 1)
			begin
				R[c] = dataC;
			end
	end
endmodule
	