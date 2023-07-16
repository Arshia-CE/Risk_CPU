module CPU(input clk, input R, output [7:0] ac, output [7:0] dr, output [15:0] sc
,output [7:0] ir, output [7:0] tr, output [4:0] pc, output [4:0] ar);

wire [15:0] T;
wire [7:0] D;
wire [7:0] out_bus;
wire [63:0] in_bus;
wire carry_flag;

Data_Path datapath(clk, R, T, D, in_bus, out_bus, carry_flag);
Control_Unit controlunit(clk, R, carry_flag, in_bus, T, D);

assign ac = in_bus[31:24];
assign dr = in_bus[23:16];
assign ir = in_bus[39:32];
assign tr = in_bus[63:56];
assign pc = in_bus[12:8];
assign ar = in_bus[4:0];

assign sc = T;

endmodule




module CPU_tb;

reg clk,R;
wire [7:0] ac, dr, ir, tr;
wire [4:0] pc, ar;
wire [15:0] sc;


CPU cpu(clk,R,ac,dr,sc,ir,tr,pc,ar);

initial begin
    clk = 0;
    R = 1;
    #10 R = 0; #1
    forever #5 clk = ~clk;
end
endmodule

