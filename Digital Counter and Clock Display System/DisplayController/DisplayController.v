module DisplayController (
  input wire clk,  // 50MHz clock
  input [3:0] johnson_out,
  input [7:0] clock_out,
  input dp_led,
  output reg [7:0] display_out
);

reg [7:0] display_reg [0:2];
reg [1:0] scroll_count;

always @(posedge clk) begin
  // Scroll display logic
  if (scroll_count == 2'b00) begin
    display_reg[2] <= {johnson_out, 2'b00};  // Johnson Counter
    display_reg[1] <= display_reg[2];
    display_reg[0] <= display_reg[1];
  end else if (scroll_count == 2'b01) begin
    display_reg[2] <= {clock_out[7:4], 2'b00};  // Hours
    display_reg[1] <= display_reg[2];
    display_reg[0] <= display_reg[1];
  end else begin
    display_reg[2] <= {clock_out[3:0], dp_led};  // Minutes with DP LEDs
    display_reg[1] <= display_reg[2];
    display_reg[0] <= display_reg[1];
  end

  // Increment scroll count
  scroll_count <= scroll_count + 1;
  if (scroll_count == 2'b10) scroll_count <= 2'b00;

end

assign display_out = display_reg[0];

endmodule
