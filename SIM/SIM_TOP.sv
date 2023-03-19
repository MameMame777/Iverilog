//
//This file is top of Simlation
//
`timescale 1ns/10ps
//parameter decralations
module SIM_TOP;

parameter CLK_CYC = 10;
logic  clk;
logic  arst;
logic  in_a;
logic  in_b;
logic [1:0] out_a;
logic [1:0] out_b;

//instanciate
DUV u_DUV (
 .clk  (clk),
 .arst (arst),
 .in_a (in_a),
 .in_b (in_b),
 .out_a(out_a[1:0]),
 .out_b(out_b[1:0])
);

//initial 
initial clk = 0;
always begin
  #(CLK_CYC/2) clk = ~clk;
end

initial begin
    in_a=0;
    in_b=0;
    @(posedge clk) ;
        arst <= 1'b1;
    @(posedge clk) ;
        arst <= 1'b0;
    @(posedge clk) ;
        in_a <=1'b1;
    @(posedge clk) ;
        in_b <=1'b1;
    repeat(20)
    @(posedge clk) ;
    $finish;
end

initial begin
  $dumpfile("waves.vcd");
  $dumpvars(0, u_DUV);
end
endmodule
