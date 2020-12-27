module PC#(parameter n = 64,parameter d=0)(input clk,reset,write,
	 input  [n-1:0] newPC,
	 output reg [n-1:0] pc);
	
	always @(posedge clk)
	#d begin 
		if(reset)
		begin
			pc = 0;
		end
		else if(write)
		begin
			pc <= newPC ;
		end
	end
endmodule
