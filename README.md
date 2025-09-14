# Verilog UART Implementation for FPGAs 🚀

This repository contains the Verilog source code and Vivado project files for a universal asynchronous receiver/transmitter (UART) module. This project provides a fundamental building block for enabling serial communication between an FPGA and other devices like microcontrollers, PCs, or peripheral sensors.

The design is written in synthesizable Verilog, making it portable across various FPGA platforms.

---

## Key Features 📜

* **Full-Duplex Communication**: Includes both a transmitter (`uart_tx`) and a receiver (`uart_rx`) module for simultaneous data sending and receiving.
* **Configurable Baud Rate**: The baud rate can be easily adjusted via a parameter, which configures a dedicated baud rate generator.
* **Standard UART Frame**: Supports the standard asynchronous serial data frame, including a start bit, 8 data bits, and a stop bit (8-N-1 format).
* **Parity Support (Optional)**: Can be easily extended to include parity bits for error checking.
* **FIFO Buffers**: Implements First-In, First-Out (FIFO) buffers for both the transmitter and receiver to prevent data loss and handle timing discrepancies between the system clock and the serial data stream.
* **Modularity**: The transmitter, receiver, and baud rate generator are designed as separate modules for clarity, reusability, and ease of testing.

---

## Technical Details 💻

* **Language**: Verilog HDL
* **Toolchain**: Xilinx Vivado Design Suite
* **Core Modules**:
    * `uart_top.v`: The top-level module that integrates the transmitter and receiver.
    * `uart_tx.v`: The transmitter module responsible for parallel-to-serial data conversion and sending data frames.
    * `uart_rx.v`: The receiver module that handles serial-to-parallel data conversion, using oversampling to reliably detect the start bit and sample the data bits.
    * `baud_rate_generator.v`: A counter-based module that generates the required clock tick for the transmitter and receiver based on the system clock and the desired baud rate.


The receiver employs an oversampling technique (typically 16x the baud rate) to robustly detect the falling edge of the start bit and sample the subsequent data bits at their approximate center, mitigating potential synchronization errors.

---

## Getting Started 🚀

#### Prerequisites

* Xilinx Vivado Design Suite (tested on version 202X.X)
* A supported FPGA development board (e.g., Digilent Basys 3, Arty A7) or a Verilog simulator.

#### Simulation

1.  Clone the repository:
    ```bash
    git clone [https://github.com/your-username/verilog-uart.git](https://github.com/your-username/verilog-uart.git)
    ```
2.  Open the project in Vivado.
3.  The repository includes a testbench file (`uart_tb.v`). Set this as the top simulation module.
4.  Run the behavioral simulation to observe the transmitter sending data and the receiver correctly interpreting the serial stream.

#### Hardware Implementation

1.  Open the project in Vivado.
2.  In the `uart_top.v` file, set the `CLK_FREQ` and `BAUD_RATE` parameters to match your board's system clock and desired communication speed.
3.  Synthesize, implement, and generate the bitstream.
4.  Program your target FPGA board with the generated bitstream.
5.  Connect the FPGA's UART pins (TX, RX) to a USB-to-UART converter or another serial device.
6.  Use a serial terminal program (like PuTTY, Tera Term, or the Arduino IDE Serial Monitor) to send and receive data. Configure the terminal with the same baud rate and an 8-N-1 frame format.
