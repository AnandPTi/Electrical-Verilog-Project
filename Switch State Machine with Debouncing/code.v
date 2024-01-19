module SwitchStateMachine (
  input wire clk,      // 50MHz clock input
  input wire rst,      // Reset signal
  input wire btn0,     // Button 0 input
  input wire btn2,     // Button 2 input
  input wire btn3,     // Button 3 input
  output reg led0      // LED0 output
);

  // Enumerated states
  typedef enum logic [2:0] {
    Idle,
    Button0Pressed,
    Button2Pressed,
    Button3Pressed,
    Button2And3Pressed
  } State;

  // Internal signals
  reg [2:0] state, next_state;
  reg [2:0] switch_value, debounced_switch;

  // Debounce parameters
  reg [3:0] debounce_counter;
  parameter DEBOUNCE_LIMIT = 4'd2; // Adjust based on your needs

  // State transition and debouncing logic
  always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
      state <= Idle;
      switch_value <= 3'b000;
      debounced_switch <= 3'b000;
      debounce_counter <= 4'b0000;
      led0 <= 0;
    end else begin
      switch_value <= {btn3, btn2, btn0}; // Concatenate switch values

      // Debounce logic
      if (debounce_counter < DEBOUNCE_LIMIT) begin
        debounce_counter <= debounce_counter + 1;
      end else begin
        debounce_counter <= 4'b0000;
        debounced_switch <= switch_value;
      end

      // State transitions
      case (state)
        Idle: if (btn0) next_state <= Button0Pressed;
        Button0Pressed: if (!btn0) next_state <= Idle;
        Button2Pressed: if (btn3 && btn2) next_state <= Button2And3Pressed;
        Button3Pressed: if (btn2 && btn3) next_state <= Button2And3Pressed;
        Button2And3Pressed: if (!(btn2 && btn3)) next_state <= Idle;
        default: next_state <= Idle;
      endcase
    end
  end

  // Assign the debounced switch value based on the current state
  always_comb begin
    case (state)
      Idle: debounced_switch <= 3'b000;
      Button0Pressed, Button2Pressed, Button3Pressed, Button2And3Pressed: debounced_switch <= switch_value;
      default: debounced_switch <= 3'b000;
    endcase
  end

  // LED control logic
  always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
      led0 <= 0;
    end else begin
      // Turn on LED0 when the specific sequence is detected
      if (state == Button0Pressed && next_state == Button2Pressed && debounced_switch[2] && debounced_switch[1] && !debounced_switch[0]) begin
        led0 <= 1;
      end else begin
        led0 <= 0;
      end

      // Update state
      state <= next_state;
    end
  end

endmodule
