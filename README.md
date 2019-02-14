# Fibonacci-on-FPGA-and-using-Microblaze
Implemented in VHDL a circuit which takes 2 digits in BCD (binary coded decimal) and outputs the Fibonacci number for that given index on 4 digits. If the result overflows the 4 digits , it becomes 9999 and a light comes on. To maximize performance, the design uses only LUT (look up table) modules.  In the second part, I used Microblaze to show the first 20 Fibonacci numbers on Xilinx SDK console.

Fibonacci.src contains the VHDL code for FPGA implementation. The Microblaze implementation can be found [here](https://drive.google.com/open?id=1NF0gy0urxBAvmkgfwMUHjRvzOslT32Dh)
and the full Fibonacci implementation [here](https://drive.google.com/open?id=1opfkudkcIXP_7AkNnJpThgm2d6wJSTgB).
