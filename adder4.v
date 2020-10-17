module adder4 (carryin , X , Y , S , carryout);
 
input carryin;
input [3:0] X, Y;

output carryout;
output [3:0] S;

wire [3:1] c;

fulladd stage0 (carryin , X[0] , Y[0] , S[0] , c[1]);
fulladd stage1 (c[1] , X[1] , Y[1] , S[1] , c[2]);
fulladd stage2 (c[2] , X[2] , Y[2] , S[2] , c[3]);
fulladd stage3 (c[3] , X[3] , Y[3] , S[3] , carryout);

endmodule

module fulladd (cin , x , y , s , cout);

input cin , x ,y;
output s, cout;

assign s = x^y^cin,
	cout = (x&y)|(x&cin)|(y&cin);

endmodule