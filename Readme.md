# FPGA Projects Repository

This repository contains two FPGA projects implemented in Verilog for the Spartan-6 FPGA. Each project is located in its respective subfolder.

## Project 1: Switch State Machine with Debouncing

### Project Description

This FPGA project implements a switch state machine with debouncing logic on a Spartan-6 FPGA. The state machine detects a specific sequence of button presses and controls an LED accordingly.

### Features

- State machine with debouncing logic for reliable switch detection.
- LED control based on a specific sequence of button presses (Button 0 followed by Button 2 and Button 3).
- Utilizes a 50MHz clock, scaled down to 200Hz for switch sampling and debouncing.

### Implementation Details

- **Language:** Verilog
- **Target FPGA:** Spartan-6
- **Clock Frequency:** 50MHz
- **Debouncing Time:** 5ms (sampled every 200Hz)
- **Sequence to Activate LED0:** Button 0 -> Button 2 -> Button 3

### Usage

1. Open the FPGA development environment (e.g., Xilinx ISE or Vivado).
2. Create a new project and set up project settings for the Spartan-6 FPGA.
3. Copy the contents of `SwitchStateMachine.v` into a new Verilog module in your project.
4. Add any necessary constraints to map buttons and LED to the appropriate physical pins on the FPGA.
5. Perform synthesis, implementation, and generate the bitstream.
6. Program the Spartan-6 FPGA with the generated bitstream.
7. Connect push buttons and LED to the configured pins.
8. Test the functionality by pressing buttons according to the specified sequence.

## Project 2: Spartan-6 FPGA Digital Counter and Clock Display System

### Overview

This project implements a digital counter and clock display system using Verilog hardware description language (HDL) for the Spartan-6 FPGA. The system comprises two primary components: a Johnson Counter and a Clock Counter, each designed to display their respective counts on a seven-segment display. Additionally, the Clock Counter includes a blinking colon effect for separating hours and minutes.

### Components

- Johnson Counter
- Clock Counter
- Display Controller

### Implementation Details

- **FPGA:** Spartan-6
- **Tools:** Xilinx ISE Design Suite
- **Integration:** 7-Segment Display
- **Clock Signal:** Utilizes a 50MHz clock for precise counter and display control.
- **Blinking Colon:** Achieved by dividing the clock to obtain a 2Hz signal.

### How to Use

1. **Setup Environment:**
   - Ensure you have Xilinx ISE installed and configured for your Spartan-6 FPGA.
   - Create a new project in ISE and add the Verilog files to your project.

2. **Run Simulation (Optional):**
   - Use Xilinx ISim or other simulation tools to verify the functionality of the design.
   - Simulation scripts are provided in the `simulation/` folder.

3. **Synthesize and Implement:**
   - Run synthesis using the provided synthesis script (`synthesis_script.tcl`).
   - Implement the design and generate the bitstream.

4. **Program FPGA:**
   - Use Xilinx iMPACT or any other appropriate tool to program the bitstream onto the Spartan-6 FPGA.

5. **Monitor Display:**
   - Observe the display for the scrolling Johnson Counter and the Clock Counter with blinking colon.

### Outcome

This project showcases advanced digital design skills, encompassing counter implementation, clock signal synchronization, and display control. The effective integration of Verilog modules demonstrates a comprehensive understanding of hardware description languages and FPGA development.

## Author

Anand Prakash(IIT Bhilai)
