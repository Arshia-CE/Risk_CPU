module oct_register(input[7:0] in , output reg [7:0] out,input load, input inc,input res,input clk);

always @(posedge clk)
	if (load==1) out<=in;
	else if(inc==1) out<=out+1;
	
always@(*) if (res==1) out<=0;

endmodule

module reg_tb;
reg [7:0] in;
reg load, inc,res, clk;
wire [7:0] out;
oct_register oc(in,out,load,inc,res,clk);
initial
begin
	clk=0;
	in=8'b00000001;
	load=1;
	#10 load=0;
	inc=1;
	#10 inc=0;
	res=1;
end
always begin
	#5 clk = ~clk;
end

endmodule