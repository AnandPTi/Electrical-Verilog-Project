# Spartan-6 FPGA Digital Counter and Clock Display System

## Overview

This project implements a digital counter and clock display system using Verilog hardware description language (HDL) for the Spartan-6 FPGA. The system comprises two primary components: a Johnson Counter and a Clock Counter, each designed to display their respective counts on a seven-segment display. Additionally, the Clock Counter includes a blinking colon effect for separating hours and minutes.

## Components

### 1. Johnson Counter

- The Johnson Counter generates a four-bit count with a shifting pattern.
- The sequence follows the pattern: `4'b0000 -> 4'b0001 -> 4'b0011 -> 4'b0111 -> 4'b1111 -> 4'b1110 -> 4'b1100 -> 4'b1000 -> 4'b0000`, or in Hex: `h0 -> h1 -> h3 -> h7 -> hF -> hE -> hC -> h8 -> h0`.
- The display scrolls left, showing up to three past counter values.

### 2. Clock Counter

- The Clock Counter manages hours and minutes, resetting at appropriate intervals.
- At each second, the second counter is incremented, and the colon (DP LEDs) blinks every second.
- When the minute counter reaches 60, it resets to zero, and the hour counter is incremented.
- The hour counter resets at 24.

### 3. Display Controller

- Integrates both counters into a display controller module.
- Enables seamless switching between the Johnson Counter and Clock Counter displays.
- Utilizes a 50MHz clock for accurate counter values and display scrolling.

## Implementation Details

- **FPGA:** Spartan-6
- **Tools:** Xilinx ISE Design Suite
- **Integration:** 7-Segment Display
- **Clock Signal:** Utilizes a 50MHz clock for precise counter and display control.
- **Blinking Colon:** Achieved by dividing the clock to obtain a 2Hz signal.

## How to Use

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

## Outcome

This project showcases advanced digital design skills, encompassing counter implementation, clock signal synchronization, and display control. The effective integration of Verilog modules demonstrates a comprehensive understanding of hardware description languages and FPGA development.


