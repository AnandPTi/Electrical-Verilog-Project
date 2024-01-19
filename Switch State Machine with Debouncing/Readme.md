# Switch State Machine with Debouncing

## Project Description

This FPGA project implements a switch state machine with debouncing logic on a Spartan-6 FPGA. The state machine detects a specific sequence of button presses and controls an LED accordingly.

## Features

- State machine with debouncing logic for reliable switch detection.
- LED control based on a specific sequence of button presses (Button 0 followed by Button 2 and Button 3).
- Utilizes a 50MHz clock, scaled down to 200Hz for switch sampling and debouncing.

## Implementation Details

- **Language:** Verilog
- **Target FPGA:** Spartan-6
- **Clock Frequency:** 50MHz
- **Debouncing Time:** 5ms (sampled every 200Hz)
- **Sequence to Activate LED0:** Button 0 -> Button 2 -> Button 3

## Files

- `SwitchStateMachine.v`: Verilog module containing the switch state machine with debouncing logic.
- `README.md`: Project documentation.

## Usage

1. Open the FPGA development environment (e.g., Xilinx ISE or Vivado).
2. Create a new project and set up project settings for the Spartan-6 FPGA.
3. Copy the contents of `SwitchStateMachine.v` into a new Verilog module in your project.
4. Add any necessary constraints to map buttons and LED to the appropriate physical pins on the FPGA.
5. Perform synthesis, implementation, and generate the bitstream.
6. Program the Spartan-6 FPGA with the generated bitstream.
7. Connect push buttons and LED to the configured pins.
8. Test the functionality by pressing buttons according to the specified sequence.

## Configuration

Adjust debounce parameters (`DEBOUNCE_LIMIT`) based on your specific switch characteristics.

## Notes

- This code assumes active-high buttons. If your buttons are active-low, invert the logic accordingly.
- For more details, refer to the comments within the `SwitchStateMachine.v` file.

## Author

Anand Prakash (IIT Bhilai)

