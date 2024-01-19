module JohnsonCounter (
  input wire clk,  // 50MHz clock
  output reg [3:0] johnson_out
);

reg [3:0] johnson_reg;

always @(posedge clk) begin
  // Johnson Counter Logic
  johnson_reg <= {johnson_reg[2:0], ~johnson_reg[3]};
end

assign johnson_out = johnson_reg;

endmodule
