module DUV(
    input logic clk,
    input logic arst,
    input logic in_a,
    input logic in_b,
    output logic [1:0] out_a,
    output logic [1:0] out_b
);
    logic [1:0] out_c;
    always_ff @(posedge clk or posedge arst) begin
        if(arst==1'b1) begin
            out_a[1:0] <= 2'd0;
            out_b[1:0] <= 2'd0;
        end else begin
            out_a[1:0] <= {out_a[0],in_a};
            out_b[1:0] <= {out_b[0],in_b};
        end
    end

    always_ff@(posedge clk or posedge arst)begin
        if(arst==1'b1) begin
        end else begin
            casez(out_a[1:0])  
                2'b00  :begin out_c[1:0] <= 2'b00; end
                2'b0?  :begin out_c[1:0] <= 2'b01; end
                2'b1?  :begin out_c[1:0] <= 2'b11; end
                default:begin out_c[1:0] <= 2'b00; end
            endcase
        end
    end

endmodule