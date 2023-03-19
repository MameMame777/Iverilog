module DUV(
    input logic clk,
    input logic arst,
    input logic in_a,
    input logic in_b,
    output logic [1:0] out_a,
    output logic [1:0] out_b
);

    always_ff @(posedge clk or posedge arst) begin
        if(arst==1'b1) begin
            out_a[1:0] <= 2'd0;
            out_b[1:0] <= 2'd0;
        end else begin
            out_a[1:0] <= {out_a[0],in_a};
            out_b[1:0] <= {out_b[0],in_b};
        end
    end
endmodule