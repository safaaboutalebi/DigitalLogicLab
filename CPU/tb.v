module tb(input clk,
	output reg write,
	output reg [4:0] a,b,c,	
	output reg [63:0] dataC
);
	initial begin
		write = 0;
		a = 5'd0;
		b = 5'd1;
		c = 5'd2;
		dataC = 64'd12;
	end
	always @(posedge clk)
	begin
		write = ~write;
		a = a + 5'b0001;
		b = b + 5'b0001;
		c = c + 5'b0001;
		dataC = dataC + 64'd16;
	end
endmodule
