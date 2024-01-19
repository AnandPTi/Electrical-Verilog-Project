module ClockCounter (
  input wire clk,  // 50MHz clock
  output reg [7:0] clock_out,
  output reg dp_led
);

reg [23:0] counter;

always @(posedge clk) begin
  // Clock Counter Logic
  counter <= counter + 1;

  if (counter == 24'd1200000) begin  // 1 second
    counter <= 0;
    dp_led <= ~dp_led;  // Toggle DP LEDs every second
  end
end

always_comb begin
  // Convert counter to hours and minutes
  clock_out = {counter[23:20], counter[19:14], counter[13:10], counter[9:4]};
end

endmodule
