
Labs done as a part of the Asic Design course in IIITB  aug-dec 2024 term. 

# Table of contents
-----
1. [Lab Preparations](#Lab-Preparations)
2. [Lab1 : Introduction to RISC-V ISA and GNU compiler toolchain](#Lab1-Introduction-to-RISCV-ISA-and-GNU-compiler-toolchain)
  	- [Task1 : Illustration of GCC GNU compiler](#Task1)
  	- [Task2 : Illustration of RISC-V GNU compiler](#Task2)  
  		- [O1 mode compilation](#a.-O1-Mode-compilation)  
        	- [Ofast mode compilation](#b.-Ofast-mode-compilation) 
        	- [Command explaination](#Commands-Explaination)   
3. [Lab2 : Simulation and debugging of a C program using Spike](#Lab2-Simulation-using-Spike-simulator)
4. [Lab3 : RISC-V Instruction identification](#Lab3-RISCV-Instruction-identification)
5. [Lab4 : Functional simulation of RISC-V Core](#Lab4)
6. [Lab5 : Choose an application and compile the c code for the same using GCC and Spike simulators](#Lab5-Write-a-Custom-real-life-application-C-Code-and-do-the-following)
7. [Lab6 : RISC-V MYTH WORKSHOP](#RISC-V-MYTH-WORKSHOP)
   * [RISCV- Day3 : Digital Logic with TL-Verilog and Makerchip](#Day3-Digital-Logic-with-TL-Verilog-and-Makerchip)
   	* [Basic Combinational Circuits in Makerchip](#Basic-Combinational-Circuits-in-Makerchip)
   	* [Basic Sequential Circuits in Makerchip](#Basic-Sequential-Circuits-in-Makerchip)
   	* [Pipeline Concept](#Pipeline-Concept)
   * [Day4- Building a RISC-V CPU core Micro-architecture](#Day4--Building-a-RISC-V-CPU-core-Micro-architecture)
     	1. [Program Counter](#Program-Counter)
     	2. [Instruction Fetch](#Instruction-Fetch)
     	3. [Instruction Decoder](#Instruction-Decoder)
     	4. [ALU](#ALU)
     	5. [Read Register File](#IRead-Register-File)
     	6. [Register File Write](#Register-File-Write)
     	7. [Branch Instruction](#Branch-Instruction)
     	8. [Final design of CPU](#Final-design-of-CPU)
   * [Day- 5 Complete Pipelined RISC-V CPU Micro-architecture](#Day5--Complete-Pipelined-RISC-V-CPU-Micro-architecture)
8. [Lab7: RISC-V pre-synthesis simulation using iverilog GTKwave](#RISC-V-pre-synthesis-simulation-using-iverilog-GTKwave)
9. [Lab8: BabySoc Pre-synthesis simulation using iverilog GTKwave](#BabySoc-Pre-synthesis-simulation-using-iverilog-GTKwave)
10. [Lab9 : RTL Design with Verilog using SKY130 Technology - Workshop](#RTL-Design-with-Verilog-using-SKY130-Technology---Workshop)
    * [Software Installations](#Software-Installations)
    * [Day1: Introduction to Verilog RTL Design and Synthesis](#Day1--Introduction-to-Verilog-RTL-Design-and-Synthesis)
    * [Day2: Timing Libs, Hierarchical vs Flat Synthesis, efficient Flop coding styles](#Day2--Timing-Libs,-Hierarchical-vs-Flat-Synthesis,-efficient-Flop-coding-styles)
    * [Day3: Combinational and Sequential Optimizations](#Day3--Combinational-and-Sequential-Optimizations)
    * [Day4: GLS, Blocking vs Non-Blocking, Synthesis-Simulation Mismatch](#Day4--GLS,-Blocking-vs-Non-Blocking,-Synthesis-Simulation-Mismatch)
11. [Lab 10: Synthesis of RISC-V using yosys and Post synthesis simulation of Babysoc using iverilog GTKwave](#Synthesis-of-RISC-V-using-yosys-and-Post-synthesis-simulation-of-Babysoc-using-iverilog-GTKwave)
12. [Lab 11: Static Timing Analysis (STA) of VSDBabySoC](#Static-Timing-Analysis-(STA)-of-VSDBabySoC)
13. [Lab 12: Synthesize VsdBabySoC design using different PVT Corner Library Files](#Synthesize-VsdBabySoC-design-using-different-PVT-Corner-Library-Files)
14. [Lab13: Advanced Physical Design Using Openlane/Sky130 Wokshop](#Advanced-Physical-Design-Using-Openlane/Sky130-Wokshop)
    
    * [Day1: Inception of open-source EDA, OpenLANE and Sky130 PDK](#Inception-of-open-source-EDA,-OpenLANE-and-Sky130-PDK)
    * [Day2: Good Floorpan vs Bad Floorplan and Introduction to Library Cell](#Good-Floorpan-vs-Bad-Floorplan-and-Introduction-to-Library-Cell)
    * [Day3: Design Library Cell Using Magic Layout and Cell characterization](#Design-Library-Cell-Using-Magic-Layout-and-Cell-characterization)
    * [Day4: Pre-Layout timing analysis and Importance of good clock tree](#Pre-Layout-timing-analysis-and-Importance-of-good-clock-tree)
    * [Day5: Final steps for RTL2GDS using tritonRoute and openSTA](#Final-steps-for-RTL2GDS-using-tritonRoute-and-openSTA)
        
- [References](#References)
  
  	

--------
## Lab Preparations: 

Create GitHub repository to manage the progress. Install GCC and RISC-V toolchain using VDI shared over whatsapp group. 



## Lab1 Introduction to RISCV ISA and GNU compiler toolchain   


#### Task1:

**Compile and execute a C program with GCC GNU compiler toolchain and generate the output.**
**Code:**
Consider a simple C program which calculates the sum of the number form 1 to n. The code is shown below:

```C Code
		#include<stdio.h>    
		int main() {    
			int i, sum=0, n=100;     
    		for (i=1; i<=n; i++) {      
        		sum+=i;	  
    		}      
    		printf("The sum of numbers from 1 to %d is %d\n", n, sum);      
    		return 0;      
		}  
```

The code can be edited via leafpad editor in the terminal window. The command for opening the editor is:

	leafpad sum1ton.c

**Code Compilation command:**

	gcc sum1ton.c

**Code execution command:**

	./a.out  

	
 <img width="728" alt="Screenshot 2024-08-07 at 2 31 44 PM" src="https://github.com/user-attachments/assets/59dea9e3-e6a4-4692-9e67-4067ea8e9aa2">  
 


**Execution Output:**

<img width="717" alt="Screenshot 2024-08-07 at 2 22 29 PM" src="https://github.com/user-attachments/assets/ae1d0c34-a815-462c-a9aa-9712096f5bd3">



----

#### Task2:

**Compile and execute the same C program with RISC-V GNU compiler toolchain, and compare the generated output with the output of Lab1 Task A.**

### a. O1 Mode compilation:

Consider the same C code used in task 1.
``` C Code
	#include<stdio.h>
	int main() {
    	int i ,sum=0,n=100;
    	for (i=1;i<=n;i++){
        	sum+=i;
    	}
    	printf("The sum of numbers from 1 to %d is %d\n",n,sum);
    	return 0;
	}
```

In order to map this command to riscv based assembly language compile it using the riscv-gnu-toolchain shown below  


<img width="773" alt="Screenshot 2024-08-07 at 2 40 29 PM" src="https://github.com/user-attachments/assets/e908c94e-fc88-4582-a0f7-45218761c9ef">


**Output of the file:**  



<img width="1145" alt="Screenshot 2024-08-07 at 2 45 57 PM" src="https://github.com/user-attachments/assets/e2ce6b7c-4000-454e-9daf-acb58a0357af">



*The calculation beside the disassembled output shows the number of instructions required to generate the corresponding output. The value is in hexadecimal.*

	To view the address of the subroutine (line main()) in the C code, type /main (if main()). To quit type :q.


### b. Ofast mode compilation:

Consider the same C program given in the O1 mode.

Map this command to riscv based assembly language and compile it in Ofast mode using the riscv-gnu-toolchain as shown below
```terminal window command
	vsduser@vsduser-VirtualBox: $
	riscv64-unknown-elf-gcc -Ofast -mabi=lp64 -march=rv64i -o sum1ton.o sum1ton.c
	riscv64-unknown-elf-objdump -d sum1ton_Ofast.o | less
```

**Output of the file:**

<img width="1208" alt="Screenshot 2024-08-07 at 2 56 12 PM" src="https://github.com/user-attachments/assets/9733c4c4-d097-449e-974c-b3c4bcb2f717">  


The number of instructions for executing the code in the ofast mode were found to be 12, less than and optimized as compared to the O1 mode.

From the above results, we can observe:

O1: selects a basic level of optimization which involves short compilation time. It optimizes the code without any major agressive changes.The code size reduction for the given example was 35.  

Ofast: selects an aggressive level of optimization. It gives us maximum performance but at the cost of precision and correctness issues. The code size or the given example was 12.

------
#### Commands Explaination:

**riscv64-unknown-elf-gcc -** RISC-V architecture based gcc compiler .

**-O1/-Ofast -** This flag specifies the optimization level to be used during compilation. In this case, the level is set to 1, which represents a basic level of optimization. Higher optimization levels (like -O2 or -O3) can potentially result in more optimized and faster code, but they might also increase compilation time.-Ofast is an optimization level flag used in GCC (GNU Compiler Collection) to enable aggressive optimizations that go beyond the optimizations performed by -O3.

**-mabi=lp64 -** Specify integer and floating-point calling convention. ABI-string contains two parts: the size of integer types and the registers used for floating-point types. "lp64" ABI stands for "Long and Pointer 64-bit," indicating that long integers and pointers are 64 bits in size.

**-march=rv64i -** Generate code for given RISC-V ISA. ISA strings must be lower-case. Examples include ‘rv64i’, ‘rv32g’, ‘rv32e’, and ‘rv32imaf’. In this case, "rv64i" specifies a 64-bit RISC-V architecture with the "i" extension, which denotes the base integer instruction set.

**-o sum1ton_O1.o -** This flag indicates the name of the output file after compilation. In this case, the compiled code will be saved as "sum1ton_O1.o".

**sum1ton.c -** This is the source code file that you want to compile. In this case, it's named "sum1ton.c".

**riscv64-unknown-elf-objdump -** This is the command-line utility used for examining the contents of object files, executables, and libraries. It can provide information about the disassembled machine code, symbol tables, and more.

**-d -** This flag specifies that the disassembly mode should be used. In other words, you are requesting to see the disassembled machine code instructions corresponding to the binary content in the object file.

**sum1ton_O1.o -** This is the object file that you want to disassemble. It contains the compiled machine code generated from the "sum1ton.c" source code file using the specified compiler options.

--------

## Lab2 Simulation using Spike simulator:


Task: Simulate the same C program used above (sum1ton.c) using the spike simulator and debug the RISC-V instructions

A RISC-V ISA is a simulator, enabling the testing and analysis of RISC-V programs without the need for actual hardware.
Spike is a free, open-source C++ simulator for the RISC-V ISA that models a RISC-V core and cache system. It can be used to run programs and a Linux kernel, and can be a starting point for running software on a RISC-V target.   

The command for running the spike simulation is
	
 	spike -d pk sum1ton_O1.o 
	
 
<img width="723" alt="Screenshot 2024-08-08 at 9 01 07 AM" src="https://github.com/user-attachments/assets/76ba7651-602b-4890-9d86-d7ec4d819099">  

* **Command Explaination:**

*  **spike -** Spike is a RISC-V ISA simulator that emulates the behavior of a RISC-V processor. It's used to run RISC-V binary programs on a host machine, simulating how those programs would execute on actual RISC-V hardware.  

* **-d** - indicates spike in debug mode. Debug mode enables you to closely monitor and interact with the simulated program's execution, making it useful for analyzing code behavior, identifying issues, and stepping through instructions.  


* **pk -** The "proxy kernel" (pk) is a small user-mode runtime environment that provides a basic set of functionalities needed to execute programs in the Spike simulator. It serves as a minimal operating system interface for the simulated environment. The proxy kernel handles basic interactions with the simulated environment, such as managing memory, handling system calls, and providing essential runtime support.

* **until pc 0 10ob0** - continue executing the program until the program counter reaches address 100b0.

* **reg 0 a2**- check the value stored in register a2. 




* **Debugging the code using Spike:**

The command for debugging the assembly code is:

 	spike -d pk sum1ton_O1.o 
	#run the program counter (pc) from 0 till the count where main is located
 	until pc 0 100b0
	
	#check the contents of the a2 register
	reg 0 a2

  	#press enter to go to next instruction set
   	#check the updated value of a2
   	reg 0 a2
 	

<img width="727" alt="Screenshot 2024-08-08 at 9 08 50 AM" src="https://github.com/user-attachments/assets/54748cde-801e-4f82-935b-95707eb42611">    


![contents update a2](https://github.com/user-attachments/assets/e9ffd4b5-4377-404f-a9ed-2fc78ed5305c)    


![contents update a0](https://github.com/user-attachments/assets/66bbfe57-8c91-4f13-b961-5797055ef7c1)  



Similarly the debug checks can be run for other instructions. for example the stack pointer can be verified by checking the values stored in sp before and after execution of the instruction  

![sp update](https://github.com/user-attachments/assets/d24e7b3f-b1d6-4b27-a991-0a9d6fbf2a50)    

------

## Lab3 RISCV Instruction identification:

**WHAT IS RISC-V?**
RISC-V is an open-source instruction set architecture (ISA) that allows developers to develop processors for specific applications.
RISC-V is based on reduced instruction set computer principles and is the fifth generation of processors built on this concept.
RISC-V can also be understood as an alternative processor technology which is free and open, meaning that it does not require you to purchase the license of RISC-V to use it.   

**INSTRUCTIONS FORMAT IN RISC-V**
The instructions format of a processor is the way in which machine language instructions are structured and organized for a processor to execute. It is made up of series of 0s and 1s, each containing information about the location and operation of data.
There are 6 instruction formats in RISC-V:

*	R-format
*	I-format
*	S-format
*	B-format
*	U-format
*	J-format
*	RISCV Instruction Types

<img width="610" alt="Screenshot 2024-08-11 at 11 10 38 AM" src="https://github.com/user-attachments/assets/96e5f9d3-6ecb-4f48-9847-c81171868570">    

**1. R-type Instruction**
In RV32, each instruction is of size 32 bits. In R-type instruction, R stands for register which means that operations are carried on the Registers and not on memory location. This instruction type is used to execute various arithmetic and logical operations. The entire 32 bits instruction is divided into 6 fields as shown below.

<img width="650" alt="Screenshot 2024-08-11 at 11 19 48 AM" src="https://github.com/user-attachments/assets/c2661851-0ae7-4979-9af4-33ec3eb9cbf3">    


The first field in the instruction format is known as opcode, also referred as operation code. The opcode is of length 7 bits and is used to determine the type of instruction format.
The next subfield is known as rd field which is referred as Destination Register. The rd field is of length 5 bits and is used to store the final result of operation.
The next subfield is func3 also referred as function 3. Here the ‘3’ represents the size of this field. This field tells the detail about the operation, i.e., the type of arithmetic and logical that is performed.
The next two subfields are the source registers, rs1 and rs2 each of length 5 bits. These are mainly used to store and manipulate the data during the execution of instructions.
The last subfield is func7 also referred as function 7. Here ‘7’ represents the size of the field. The function of func7 field is same as that of func3 field.
2. I-type Instruction
In RV32, each instruction is of size 32 bits. In I-type instruction, I stand for immediate which means that operations use Registers and Immediate value for their execution and are not related with memory location. This instruction type is used in immediate and load operations. The entire 32 bits instruction is divided into 5 fields as shown below.  


**2. I-type Instruction**   

<img width="648" alt="Screenshot 2024-08-11 at 11 25 44 AM" src="https://github.com/user-attachments/assets/21d50a59-6e09-49d0-bd5e-51a80b6f5ed8">  


The first field in the instruction format is known as opcode, also referred as operation code. The opcode is of length 7 bits and is used to determine the type of instruction format.
The next subfield is known as rd field which is referred as Destination Register. The rd field is of length 5 bits and is used to store the final result of operation.
The next subfield is func3 also referred as function 3. Here the ‘3’ represents the size of this field. This field tells the detail about the operation, i.e., the type of arithmetic and logical that is performed.
The next subfield is the source registers, rs1 of length 5 bits. It is mainly used to store and manipulate the data during the execution of instructions.
The only difference between R-type and I-type is rs2 and func7 field of R-type has been replaced by 12-bits signed immediate, imm[11:0].
3. S-type Instruction
In RV32, each instruction is of size 32 bits. In S-type instruction, S stand for store which means it is store type instruction that helps to store the value of register into the memory. Mainly, this instruction type is used for store operations. The entire 32 bits instruction is divided into 6 fields as shown below.

**3. S-type Instruction**   

<img width="654" alt="Screenshot 2024-08-11 at 11 26 02 AM" src="https://github.com/user-attachments/assets/b19ddac0-a333-428d-8de4-6577b4090b10">   


The first field in the instruction format is known as opcode, also referred as operation code. The opcode is of length 7 bits and is used to determine the type of instruction format.
S-type instructions encode a 12-bit signed immediate, with the top seven bits imm[11:5] in bits [31:25] of the instruction and the lower five bits imm[4:0] in bits [11:7] of the instruction.
S-type instruction doesn’t have rd fields which states that these instructions are not used to write value to a register, but to write/store a value to a memory.
The value to be stored is defined in rs1 field and address to which we have to store this value is calculated using rs1 and immediate field. The width of the operation and types of instruction is defined by func3, it can be a word, half-word or byte.
4. B-type Instruction
In RV32, each instruction is of size 32 bits. In B-type instruction, B stand for branching which means it is mainly used for branching based on certain conditions. The entire 32 bits instruction is divided into 8 fields as shown below.

**4. B-type Instruction**    

<img width="649" alt="Screenshot 2024-08-11 at 11 26 18 AM" src="https://github.com/user-attachments/assets/2d10dae1-6f70-41ce-9823-eac5cbc8322f">     


The first field in the instruction format is known as opcode, also referred as operation code. The opcode is of length 7 bits and is used to determine the type of instruction format.
B-type instructions encode a 12-bit signed immediate, with the most significant bit imm[12] in bit [31] of the instruction, six bits imm[10:5] in bits [25:30] of the instruction, four bits imm[4:1] in bits [11:8] and one bit imm[11] on bit[7].
There are two source registers rs1 and rs2 on which various operations are performed based on certain conditions, and those conditions are defined by func3 field.
After performing operations on the source register based on the conditions, it is evaluated that if the condition is true, Program Counter value gets updated by PC = Present PC Value + Immediate Value, and if the condition is false then PC will be given as PC = Present PC value + 4 bytes, which states that PC will move to next instruction set.
RV32 instructions are word-aligned, which means that address is always defined in the multiple of 4 bytes.
5. U-type Instruction
In RV32, each instruction is of size 32 bits. In U-type instruction, U stand for Upper Immediate instructions which means it is simply used to transfer the immediate data into the destination register. The entire 32 bits instruction is divided into 3 fields as shown below.

**6. U-type Instruction**      

<img width="655" alt="Screenshot 2024-08-11 at 11 26 30 AM" src="https://github.com/user-attachments/assets/b8284855-e5da-4646-b804-7267847dd884">    


The first field in the instruction format is known as opcode, also referred as operation code. The opcode is of length 7 bits and is used to determine the type of instruction format.
The U-type instruction only consists of two instructions, i.e., LUI and AUIPC.
For Example, lets take the instruction lui rd, imm and understand this instruction. lui x15, 0x13579 : This instruction will be executed and the immediate value 0x13579 will be written in the MSB of the rd x15, and it will look like x15 = 0x13579000.
6. J-type Instruction
In RV32, each instruction is of size 32 bits. In U-type instruction, J stand for jump, which means that this instruction format is used to implement jump type instruction. The entire 32 bits instruction is divided into 6 fields as shown below.

**7. J-type Instruction**    

<img width="648" alt="Screenshot 2024-08-11 at 11 26 41 AM" src="https://github.com/user-attachments/assets/d43b51cf-464b-4509-b784-de50424a3086">     


The first field in the instruction format is known as opcode, also referred as operation code. The opcode is of length 7 bits and is used to determine the type of instruction format.
The J-type instruction only consists of single instruction, JAL.
J-type instruction encode 20 bits signed immediate which is divided into four fields.
The J-type instructions are often used to perform jump to the desired memory location. The address of the desired memory location is defined in the instruction. These instructions are also used to implement loops.


**Lab Task: Analysis and encode the given RISC-V instruction**
	
 	1. ADD r7, r8, r9

*	All the arithmetic and logical operations are performed using R-type instruction format, hence this instruction belongs to R-type instruction set.
*	r7 is the destination register that will hold the sum of values stored in the register r8 and r9.
  
	```
  	Opcode for ADD = 0110011
 	rd  = r7 = 00111
 	rs1 = r8 = 01000
 	rs2 = r9 = 01001
 	func3 = 000
 	func7 = 0000000
 	**32 bits instruction : 0000000_01001_01000_000_00111_0110011**
 	```

```
2. SUB r9, r7, r8
```

*	r9 is the destination register that will hold the sum of values stored in the register r8 and r9.

	```
 	Opcode for SUB = 0110011
	rd  = r9 = 01001
	rs1 = r7 = 00111
	rs2 = r8 = 01000
	func3 = 000
	func7 = 0100000
	**32 bits instruction : 0100000_01000_00111_000_00111_0110011**
 	```

```
3. AND r8, r7, r9
```

*	r8 is the destination register that will hold the sum of values stored in the register r8 and r9.

	```
 	Opcode for SUB = 0110011
	rd  = r8 = 01000
	rs1 = r7 = 00111
	rs2 = r9 = 01001
	func3 = 111
	func7 = 0100000
	32 bits instruction : 0000000_01001_00111_111_01000_0110011
 	```
 
```
4. OR r8, r8, r5
```

*	r8 is the destination register that will hold the value of r2 | r5, means performing OR operation bit by bit.

	```
 	Opcode for OR = 0110011
	rd = r8 = 01000
	rs1 = r8 = 01000
	rs2 = r5 = 00101
	func3 = 110
	func7 = 0000000
	32 bits instruction : 0000000_00101_01000_110_01000_0110011
 	```

```
5. XOR r8, r7, r4
```
 	
*	r8 is the destination register that will hold the value of r1 ^ r4, means performing XOR operation bit by bit.

	```
 	Opcode for XOR = 0110011
	rd = r8 = 01000
	rs1 = r7 = 00111
	rs2 = r4 = 00100
	func3 = 100
	func7 = 0000000
	32 bits instruction : 0000000_00100_00111_100_01000_0110011
 	```

```
6. SLT r10, r2, r4
```
 	
*	r10 is the destination register that sets to 1, if r2 is less than r4, else 0 if r2 is greater than r4.

	```
 	Opcode for SLT = 0110011
	rd = r10 = 01010
	rs1 = r2 = 00010
	rs2 = r4 = 00100
	func3 = 010
	func7 = 0000000
	32 bits instruction : 0000000_00100_00010_010_01010_0110011
 	```

```
7. ADDI r12, r3, 5
```
 	
*	In this instruction ADD means Addition, I means Immediate, therefore ADDI means Addition with Immediate, hence this instruction belongs to I-type instruction set.
*	r12 is the destination register that will store the value of r3 sum-up with the immediate value 5.

	```
 	Opcode for ADDI = 0010011
	rd  = r12 = 01100
	rs1 = r3 = 00011
	imm[11:0] = 5 = 000000000101
	func3 = 000
	32 bits instruction : 000000000101_00011_000_01100_0010011
 	```

```
8. SW r3, r1, 4
```
 	
*	In this instruction SW means store word, hence this instruction belongs to S-type instruction set.
*	r3 is the source register. This instruction will store the value located in register r3 at the address obtained by adding the immediate address 4 with the address located in register r1.
  
	```
 	Opcode for SW = 0100011
	rs2 = r3 = 00011
	rs1 = r1 = 00001
	imm[11:0] = 4 = 000000000100
	func3 = 010
	32 bits instruction : 0000000_00011_00001_010_00100_0100011
 	```

```
9. SRL r16, r11, r2
```

*	SRL means Logical Shift Right and since the operation is performed on registers, this instruction belongs to R-type instruction set.
*	r16 is the destination register, in which the value stored in r11 will be written after performing logical right shift based on the number stored in r2.
  
	```
 	Opcode for SRL = 0110011
	rd = r16 = 10000
	rs1 = r11 = 01011
	rs2 = r2 = 00010
	func3 = 101
	func7 = 0000000
	32 bits instruction : 0000000_00010_01011_101_10000_0110011
 	```

```
10. BNE r0, r1, 20
```

*	BNE is a branching instruction (B-type) based on conditions. Here BNE specifies the condition that the value stored in r0 != (is not equal to) the value stored in r1.
*	If the condition becomes true, Program Counter will be updated by PC + 20, else PC + 4 for next instruction.
	
	```
 	Opcode for BNE = 1100011
	rs1 = r0 = 00000
	rs2 = r1 = 00001
	imm[12:1] = 20 = 000000010100
	func3 = 001
	32 bits instruction : 0_000001_00001_00000_001_0100_0_1100011
 	```

```
11. BEQ r0, r0, 15
```

*	BEQ is a branching instruction (B-type) based on conditions. Here BEQ specifies the condition that the value stored in r0 == (is equal to) the value stored in r0.
*	If the condition becomes true, Program Counter will be updated by PC + 15, else PC + 4 for next instruction.

	```
 	Opcode for BEQ = 1100011
	rs1 = r0 = 00000
	rs2 = r0 = 00000
	Imm[12:1] = 000000001111
	func3 = 000
	32 bits instruction : 0_000000_00000_00000_000_1111_0_1100011
	```

```
12. LW r13, r11, 2
```

*	LW stands for Load Word. Word is equal to 32 bits or 4 bytes. Since there is an immediate value given in the instruction which helps to calculate the address of memory from where we have to fetch the data, hence this instruction belongs to I-type.
*	r13 is the destination register that will hold the value fetched from the memory location calculated by using (address value stored in r11 + immediate value)

	```
 	Opcode for LW = 0000011
	rd  = r13 = 01101
	rs1 = r11 = 01011
	imm[11:0] = 000000000010
	func3 = 010
	32 bits instruction : 000000000010_01011_010_01101_0000011
	```


```
13. SLL r15, r11, r2
```

*	SLL means Logical Shift Left and since the operation is performed on registers, this instruction belongs to R-type instruction set.
*	r15 is the destination register, in which the value stored in r11 will be written after performing logical left shift based on the number stored in r2.

	```
 	Opcode for SLL = 0110011
	rd  = r15 = 01111
	rs1 = r11 = 01011
	rs2 = r2 = 00010
	func3 = 001
	func7 = 0000000
	32 bits instruction :0000000_00010_01011_001_01111_0110011
 	```
  
	   | Instruction | Type | Standard ISA Code |
	   |:-----------:|:----:|:-----------------:|
	   |ADD r7, r8, r9 | R | 0x009403B3 |
	   |SUB r9, r7, r8 | R | 0x408383B3 |
	   |AND r8, r7, r9 | R | 0x0093F433 |
	   |OR  r8, r8, r5 | R | 0x00546433 |
	   |XOR r8, r7, r4 | R | 0x0043C433 |
	   |SLT r10, r2, r4| R | 0x00412533 |
	   |ADDI r12, r3, 5| I | 0x00518613 |
	   |SW r3, r1, 4   | S | 0x0030A223 |
	   |SRL r16, r11, r2 | R | 0x0025D833 |
	   |BNE r0, r1, 20 | B | 0x02101463 |
	   |BEQ r0, r0, 15 | B | 0x00000F63|
	   |LW r13, r11, 2 | I | 0x0025A683 |
	   |SLL r15, r11, r2 | R | 0x002597B3|
  

   
----
## Lab4: 

**Use RISC-V Core: Verilog netlist and Testbench and perform the function simulation and observe the ouputs**

 We will be using the Verilog Code Netlist and the Testbench of RISC-V architecture that has already been written. The reference GitHub repository is :   [(https://github.com/vinayrayapati/rv32i/?tab=readme-ov-file#2-BLOCK-DIAGRAM-OF-RISC-V-RV32I)]

* **RISC-V RV32I**
  
This lab provides an insight into the working of a few important instructions of the instruction set of a Single cycle Reduced Instruction Set Computer - Five(RISC-V) Instruction Set Architecture suitable for use across wide-spectrum of Applications from low power embedded devices to high performance Cloud based Server processors. The base RISC-V is a 32-bit processor with 31 general-purpose registers, so all the instructions are 32-bit long. Some Applications where the RISC-V processors have begun to make some significant threads are in Artificial intelligence and machine learning, Embedded systems, Ultra Low power processing systems etc.

* **Block Diagram of RISC-V RV32I**

	![181293948-beb8622c-7696-4b06-b6c9-eeab9b8ab9d3](https://github.com/user-attachments/assets/b176cf60-5e40-451f-a58d-ab906f9925c5)   

* **Instruction Set of RISC-V RV32I**
  
	![181298133-60269bc2-01da-4b5c-8b42-69057b8dc15c](https://github.com/user-attachments/assets/82d9d234-b27b-4e8e-a3e5-4354bc4bce84)  

* **Functional Simulation of RISC-V**
  
Steps to perform functional simulation of RISC-V

1. Create a new directory with your name mkdir <your_name>
	mkdir <priyanka>

2. Create two files by using touch command as name_rv32i.v and name_rv32i_tb.v
   	priyanka_rv32i.v
   	priyanka_rv32i_tb.v

3. Copy the code from the reference github repo and paste it in your verilog and testbench files

4. To run and simulate the verilog code, enter the following command:

	```
 	$ iverilog -o priyanka_rv32i priyanka_rv32i.v priyanka_rv32i_tb.v
	$ ./priytanka_rv32i
 	```
To see the simulation waveform in GTKWave, enter the following command:

	$ gtkwave priyanka_rv32i.vcd
  
 
The GTKWave will be opened and following window will appear  

	<img width="937" alt="Screenshot 2024-08-11 at 12 06 13 PM" src="https://github.com/user-attachments/assets/48614ab2-c8a8-4502-98c4-2b97511a3151">   

As shown in the figure below, all the instructions in the given verilog file is hard-coded. Hard-coded means that instead of following the RISCV specifications bit pattern, the designer has hard-coded each instructions based on their own pattern. Hence the 32-bits instruction that we generated in Task-2 will not match with the given instruction.

```verilog
	always @(posedge RN) begin
	    //NPC<= 32'd0;
	MEM[0] <= 32'h02208300;         // add r6,r1,r2.(i1)
	MEM[1] <= 32'h02209380;         //sub r7,r1,r2.(i2)
	MEM[2] <= 32'h0230a400;         //and r8,r1,r3.(i3)
	MEM[3] <= 32'h02513480;         //or r9,r2,r5.(i4)
	MEM[4] <= 32'h0240c500;         //xor r10,r1,r4.(i5)
	MEM[5] <= 32'h02415580;         //slt r11,r2,r4.(i6)
	MEM[6] <= 32'h00520600;         //addi r12,r4,5.(i7)
	MEM[7] <= 32'h00209181;         //sw r3,r1,2.(i8)
	MEM[8] <= 32'h00208681;         //lw r13,r1,2.(i9)
	MEM[9] <= 32'h00f00002;         //beq r0,r0,15.(i10)
	MEM[25] <= 32'h00210700;         //add r14,r2,r2.(i11)
	//MEM[27] <= 32'h01409002;         //bne r0,r1,20.(i12)
	//MEM[49] <= 32'h00520601;         //addi r12,r4,5.(i13)
	//MEM[50] <= 32'h00208783;         //sll r15,r1,r2(2).(i14)
	//MEM[51] <= 32'h00271803;         //srl r16,r14,r2(2).(i15) */
```
Following are the differences between standard RISCV ISA and the Instruction Set given in the reference repository:

| Operation | Standard RISCV ISA | Hardcoded ISA |
|:---------:|:------------------:|:-------------:|
| ADD R6, R2, R1 | 32'h00110333 | 32'h02208300 |
| SUB R7, R1, R2 | 32'h402083b3	| 32'h02209380 |
| AND R8, R1, R3 | 32'h0030f433	| 32'h0230a400 |
| OR R9, R2, R5	 | 32'h005164b3	| 32'h02513480 |
| XOR R10, R1, R4| 32'h0040c533	| 32'h0240c500 |
| SLT R1, R2, R4 | 32'h0045a0b3	| 32'h02415580 |
| ADDI R12, R4, 5| 32'h004120b3	| 32'h00520600 |
| BEQ R0, R0, 15 | 32'h00000f63	| 32'h00f00002 |
| SW R3, R1, 2	 | 32'h0030a123	| 32'h00209181 |
| LW R13, R1, 2	 | 32'h0020a683	| 32'h00208681 |
| SRL R16, R14, R2 | 32'h0030a123 | 32'h00271803 |
| SLL R15, R1, R2 | 32'h002097b3 | 32'h00208783 |


The simulation output waveforms for various instructions shown in the code above are given below:
	
```
1. Instruction: ADD R6, R2, R1 
```   
 
<img width="1518" alt="ADD" src="https://github.com/user-attachments/assets/1c6b6c40-817d-45d2-94b7-a04301333e6a">    

```
2. Instruction: SUB R7, R1, R2
```     

<img width="1453" alt="SUB" src="https://github.com/user-attachments/assets/47bfca43-e16a-4adb-871c-d126c506265d">         

	
```
3. Instruction: AND R8, R1, R3
```     
  	
![AND](https://github.com/user-attachments/assets/11654c0b-dc3a-4c19-bbf3-5987da3122dd)         

```
4. Instruction: OR R9, R2, R5
```     
   	
<img width="1433" alt="OR" src="https://github.com/user-attachments/assets/487d911e-de83-468b-a4ce-4bc74f26f16e">    

```
5. Instruction: XOR R10, R1, R4
```     
     	
<img width="1442" alt="XOR" src="https://github.com/user-attachments/assets/4edfc938-0cdc-4008-8b4d-3a528927bd67">     

```
6. Instruction: SLT R1, R2, R4
```     
       	
<img width="1514" alt="SLT" src="https://github.com/user-attachments/assets/89ba949e-523f-4173-964f-59f1b976df3c">     

```
7. Instruction: ADDI R12, R4, 5
```    
	
 <img width="1481" alt="ADDI" src="https://github.com/user-attachments/assets/08516ff8-5ebf-4ce9-b35a-63556530c875">      

```
8. Instruction: BEQ R0, R0, 15
```     


![BEQ](https://github.com/user-attachments/assets/7502d23f-73c7-4ee4-a6de-a60d0cc5e9cf)

-----------     

## Lab5 Write a Custom real life application C Code and do the following:  

* Write compilable C Code for the same
* Compile and simulate it using GCC and upload the screenshot for the output
* Compile and simulate the same using RISC-V GCC compiler and Spike simulator and upload the screenshot
* Compare and validate both the outputs

  * Application choosen:
    
    **A Polynomial Multiplier which takes two polynomials A and B as user inputs and generates the multiplication output of A and B**
   
    The GCC compiler output of the code is shown below
    

    ![Pasted image](https://github.com/user-attachments/assets/596e6a65-f74d-4cc5-ad3d-202a34e723d3)
    

    The RISCV Spike simulator and the comparison of both the outputs is shown below:
    

    ![Pasted image 1](https://github.com/user-attachments/assets/71610743-62c2-4eb6-8698-a5b54d987657)      


    The simulated output O1 with GCC and O2 with RISC-V GCC compilers were found to be same for the given application for same set of user inputs.

------
## RISC-V MYTH WORKSHOP:

## Day3 Digital Logic with TL Verilog and Makerchip:

**Logic Gates**
Logic gates are fundamental building blocks of digital electronic circuits. They are responsible for performing logical operations on input signals and producing output signals based on predefined logic rules. These gates are the foundation of digital computation and are used to design and construct more complex digital systems like processors, memory units, and controllers. Logic gates manipulate binary signals, which are typically represented as "0" and "1". These binary signals correspond to the low and high voltage levels in a digital circuit, respectively. Logic gates take one or more input signals and produce an output signal based on a logical function.

Here are some common types of logic gates:

<img width="1236" alt="Screenshot 2024-08-16 at 11 27 48 PM" src="https://github.com/user-attachments/assets/803e3b49-3b35-4633-987b-728128a62bc3">    

**Multiplexer Using Ternary Operator**

Consider the verilog code for multiplexer gicen below :

```
	assign f = s ? x1 : x0;
```
This code uses ternary operator that will realize a simple 2:1 multiplexer hardware in which the output f follows x1 if s is 1 otherwise it will follow x0. The harware and logic gate representation l is shown below :

<img width="569" alt="Screenshot 2024-08-16 at 11 30 04 PM" src="https://github.com/user-attachments/assets/a86a515f-a92c-42c5-a478-0e96f75cbb58">    

The higher bit multiplexers can also be realized using the coditional operator. Consider the 4:1 multiplexer code given below :

```
	assign f = sel[0] ? a : (sel[1] ? b : (sel[2] ? c : d));
```

This code creates a priority for the inputs with input a getting the highest and input d getting the least. Instead of realizing as a single 4:1 multiplexer it will create a series of 2:1 multiplexers. In this case the sel is a one hot vector i.e, only one of the bit in the sel will be high at a time. The hardware realization is shown below :

<img width="506" alt="Screenshot 2024-08-16 at 11 31 25 PM" src="https://github.com/user-attachments/assets/6aea7668-59e4-4d6b-b382-c804885012d8">    

**Transaction Level(TL) - Verilog**

TL-Verilog is a Verilog implementation of TL-X, a language extension that extends any HDL with transaction-level modeling. TL-Verilog was developed by Redwood EDA, and it's designed to enable more efficient and concise design representation while retaining compatibility with standard Verilog. It eliminates the need for the legacy language features of Verilog and introduces simpler syntax. TL-Verilog is specifically designed for modeling hardware and provides abstract context suited to hardware design with numerous benefits. It is built for the design process, not for the mere description of static designs. In transaction-level design, a transaction is an entity that moves through a microarchitecture and is operated upon and steered through the machinery by flow components such as pipelines, arbiters, and queues. TL-Verilog is the easiest way to write and edit Verilog with fewer bugs and is supported by Makerchip.

**Makerchip IDE**

Makerchip IDE is an integrated development environment specifically designed for digital design and hardware description language (HDL) programming. It offers a comprehensive platform for engineers, students, and hobbyists to design, simulate, and test digital circuits and systems. Makerchip IDE stands out for its user-friendly interface and its ability to support various HDLs like TL Verilog, SystemVerilog, Verilog, and VHDL. Within the Makerchip IDE, users can design complex digital systems by using a combination of pre-built and custom logic elements such as logic gates, flip-flops, multiplexers, and more. It provides a virtual canvas where users can visually construct their designs by interconnecting these components. One of the notable features of Makerchip IDE is its real-time simulation capability, allowing users to simulate their designs and observe their behavior before moving on to actual hardware implementation. This virtual prototyping helps catch errors early and refine designs efficiently. Overall, Makerchip IDE serves as an invaluable tool for both beginners and experienced digital designers to explore, learn, and experiment with digital logic design, fostering innovation and advancement in the field of digital electronics.

**Basic Combinational Circuits in Makerchip**
------
**1. Pythagorean Example Demo**
```
	// Pythagora's Theorem
         $aa_sq[7:0] = $aa[3:0] ** 2;
         $bb_sq[7:0] = $bb[3:0] ** 2;

         $cc_sq[8:0] = $aa_sq + $bb_sq;
         $cc[4:0]    = sqrt($cc_sq);

      	// Print
            always_ff @(posedge clk) begin
               \$display("sqrt((\%2d ^ 2) + (\%2d ^ 2)) = \%2d", $aa, $bb, $cc);
            end

   	// Stop simulation.
   	*passed = *cyc_cnt > 40;
```

<img width="1680" alt="Screenshot 2024-08-16 at 11 44 36 PM" src="https://github.com/user-attachments/assets/1ca1357b-7d06-475c-ac84-2eb2e3c3f1ee">     

-----
**2. Inverter**    

The TL-Verilog code is shown below :
```
   	$out = $in;
```
<img width="1669" alt="inverter" src="https://github.com/user-attachments/assets/aea80830-32ce-407a-a15e-8bc8244bf262">   

-----

**3. 2 input AND Gate:**    

The TL-Verilog code is shown below :
```
	$out = $in1 && $in2;
```
<img width="1668" alt="And" src="https://github.com/user-attachments/assets/a5ab41a5-88bb-4e27-8043-f660d428b638">

------

**4. 2 input OR gate:**    

The TL-Verilog code is shown below :
```
	$out = $in1 || $in2;
```

<img width="1675" alt="or" src="https://github.com/user-attachments/assets/dda68e64-9679-4aaa-8333-201ff22dd82a">

------

**5. 2 input XOR gate:**     

The TL-Verilog code is shown below :
```
	$out = $in1 ^ $in2;
```
<img width="1670" alt="xor" src="https://github.com/user-attachments/assets/476524f7-42ec-4f98-a4c0-f2ba4708e0ab">

-----

**6. Vector Addition:**     

The TL-Verilog code is shown below :
```
	$out[4:0] = $in1[3:0] + $in2[3:0];
```
<img width="1673" alt="Screenshot 2024-08-16 at 5 08 44 PM" src="https://github.com/user-attachments/assets/ed0a8bb9-ec7e-47d1-a22f-8fd46026592a">

-----

**7. 2:1 Multiplexer:**    

The TL-Verilog code is shown below :
```
   	$out = $sel ? $in1 : $in0;
```
<img width="1665" alt="mux2_ip" src="https://github.com/user-attachments/assets/1e413646-2eba-40bb-bc79-c32b55bbb30a">

-----

**8. 2:1 Vector Multiplexer:**    

The TL-Verilog code is shown below :
```
   	$out[7:0] = $sel ? $in1[7:0] : $in0[7:0];
```

<img width="1606" alt="Screenshot 2024-08-16 at 5 17 32 PM" src="https://github.com/user-attachments/assets/71a8106c-cb64-4c68-b13d-092ccb7d8c0f">

-----

**9. Calculator?:**
The function table is given below : 

|Function|opcode|
|:------:|:----:|
|Addition|0x00|
|Subration|0x01|
|Multiplication|0x02|
|Division|0x03|
         

The TL-Verilog code is shown below :
```
	   $reset = *reset;
	   $op[1:0] = $random[1:0];
	   
	   $val1[31:0] = $rand1[3:0];
	   $val2[31:0] = $rand2[3:0];
	   $sum[31:0]  = $val1+$val2;
	   $diff[31:0] = $val1-$val2;
	   $prod[31:0] = $val1*$val2;
	   $quot[31:0] = $val1/$val2;
	   
	   $out[31:0] = $op[1] ? ($op[0] ? $quot : $prod):($op[0] ? $diff : $sum);
```

<img width="1574" alt="calc" src="https://github.com/user-attachments/assets/20dcea3e-d1c3-4ba0-90c1-095553962388">

-----

## Basic Sequential Circuits in Makerchip:

A sequential circuit is a type of digital circuit that employs memory elements to store information and produce outputs based not only on the current input values but also on the circuit's previous state. Unlike combinational circuits, which generate outputs solely based on the present input values, sequential circuits incorporate feedback loops and memory elements like flip-flops or registers to maintain and utilize their internal state.

**1. Fibonacci Series**:   

The TL-Verilog code for fibonacci series is shown below :
```
	   $reset = *reset;
	   $num[31:0] = $reset ? 1 : (>>1$num + >>2$num);
```

Here, 
>>1 indicates the previous value of num 
>>2 indicates Value of num before 2 clock cycle

The block diagram is shown below

<img width="787" alt="Screenshot 2024-08-16 at 6 41 35 PM" src="https://github.com/user-attachments/assets/894e88ea-5b85-4483-ab4c-fe83a7633ad3">

The makerchip simulation is shown below:   

<img width="1676" alt="Screenshot 2024-08-16 at 9 22 12 PM" src="https://github.com/user-attachments/assets/ae6c13f2-e2e2-4b4c-964f-1aa5b05a3018">     

----- 
**2. Free running counter:**    

The TL-Verilog code for free running counter is shown below :
```
	   $reset = *reset;
	   $cnt[31:0] = $reset ? 0 : (>>1$cnt + 1);
```
The block diagram and MAkerchip simulation window are shown below:

<img width="255" alt="Screenshot 2024-08-17 at 12 09 31 AM" src="https://github.com/user-attachments/assets/502957d9-49e1-48a8-9fc2-30a058c33e7c">    

<img width="1657" alt="Screenshot 2024-08-16 at 9 54 15 PM" src="https://github.com/user-attachments/assets/81f38645-dc0b-48cf-bef1-e8d4bfa03348">

-----   

**3. Counter-Output with Calculator Integration:**

The TL-verilog code for sequential calculator is shown below :
```
	   $reset = *reset;
	   
	   $cnt2[2:0] = $reset ? 0 : (>>1$cnt2 + 1);
	   $cnt3[1:0] = $reset ? 0 : (>>1$cnt3 + 1);
	   
	   $op[1:0] = $random[1:0];
	   
	   $val1[31:0] = >>1$out;
	   $val2[31:0] = $rand1[3:0];
	   $sum[31:0] = $val1+$val2;
	   $diff[31:0] = $val1-$val2;
	   $prod[31:0] = $val1*$val2;
	   $div[31:0] = $val1/$val2;
	   
	   $out[31:0] = $reset ? 32'h0 : ($op[1] ? ($op[0] ? $div : $prod):($op[0] ? $diff : $sum));
```

This code works like the normal calculator in which the result of the previous operation is considered as one of the operand for the next operation. Upon reset the result becomes zero.

<img width="1637" alt="counter_with_calc" src="https://github.com/user-attachments/assets/b88c98c4-c10a-4217-afed-d49212393fb2">     

-------
## Pipeline Concept:  

Pipelining is a technique used in computer architecture and digital system design to enhance the efficiency of processing by dividing a complex task into smaller, sequential stages. Each stage performs a specific operation on the data, and these stages are arranged in a pipeline. Pipelining enables multiple instructions or tasks to be executed concurrently, with different stages of different instructions being processed simultaneously. In a pipelined architecture, the processing of an instruction is divided into several stages. This allows for overlapping the execution of multiple instructions, reducing the overall time needed to complete a sequence of tasks.

**Basic Pipelined Circuits:**

**1. Counter and Calculator in Pipeline:**  

The block diagram of the counter with calculator in pipeline is shown below :   

<img width="618" alt="Screenshot 2024-08-18 at 3 46 28 PM" src="https://github.com/user-attachments/assets/046a79cf-dc10-4eaa-9753-e9d379030a8d">

The TL-Verilog code is given below :
```
	$reset = *reset;
   	$op[1:0] = $random[1:0];
   	$val2[31:0] = $rand2[3:0];
   
        |calc
           @1
              $val1[31:0] = >>1$out;
              $sum[31:0] = $val1+$val2;
              $diff[31:0] = $val1-$val2;
              $prod[31:0] = $val1*$val2;
              $div[31:0] = $val1/$val2;
              $out[31:0] = $reset ? 32'h0 : ($op[1] ? ($op[0] ? $div : $prod):($op[0] ? $diff : $sum));
         
              $cnt[31:0] = $reset ? 0 : (>>1$cnt + 1); 	
```     

<img width="1678" alt="cntr_pipeline_reset" src="https://github.com/user-attachments/assets/05891faa-db91-4c68-b486-2b0d7d805ddb">

**2. 2cycle pipelined Calculator:** 
The single stage calculator integrated with a counter can be extended to a 2 stage pipelined architecture. A valid signal along with reset forces the operation-decidiing mux to force an output value of 0.

<img width="591" alt="Screenshot 2024-08-18 at 9 33 08 PM" src="https://github.com/user-attachments/assets/71c9a093-e22d-42f9-9d36-9414e239115b">    

The TL verilog code for two stage calculator is shown below:

```
    $reset = *reset;
    $op[1:0] = $random[1:0];
    $val2[31:0] = $rand2[3:0];
   
    |calc
      @1
         $val1[31:0] = >>2$out;
         $sum[31:0] = $val1+$val2;
         $diff[31:0] = $val1-$val2;
         $prod[31:0] = $val1*$val2;
         $div[31:0] = $val1/$val2;
         $valid = $reset ? 0 : (>>1$valid + 1);
      @2
         $out[31:0] = ($reset | ~($valid))  ? 32'h0 : ($op[1] ? ($op[0] ? $div : $prod):($op[0] ? $diff : $sum));
```     

<img width="1669" alt="cycl2Calc_validsignal" src="https://github.com/user-attachments/assets/405ccc6b-24eb-4297-b24b-e058f294b8db">

**3. 2 Cycle Calculator with Valid_or_reset:**   

The block diagram of 2 Cycle calculator with validity is shown below :

<img width="591" alt="Screenshot 2024-08-18 at 9 33 08 PM" src="https://github.com/user-attachments/assets/06b3c553-c18c-4863-b5ef-d75066fc1dff">

The TL verilog code is given below:

```
   $reset = *reset;
   |calc
      @1
         $valid = $reset ? 0 : >>1$valid+1;
         $valid_or_reset = $valid || $reset;
	 
      ?$valid_or_reset
         @1
            $val1[31:0] = >>2$out;
            $sum[31:0] = $val1+$val2;
            $diff[31:0] = $val1-$val2;
            $prod[31:0] = $val1*$val2;
            $div[31:0] = $val1/$val2;
            $valid = $reset ? 0 : (>>1$valid + 1);
         @2
            $out[31:0] =  ($op[1:0] == 2'b00) ? $sum :
                          ($op[1:0] == 2'b01) ? $diff :
                          ($op[1:0] == 2'b10) ? $prod :
                           $quot ;
```   

<img width="1669" alt="cycl2Calc_validsignal" src="https://github.com/user-attachments/assets/c4428719-e8a3-44bb-9547-e1b72adccf63">

**4. Calculator with Single Value Memory:**

<img width="639" alt="CALC_withMemory copy" src="https://github.com/user-attachments/assets/f0dcb58f-c592-4e80-963f-78dd56d2fc21">


The TL-Verilog code is given below:
```
   |calc
      @0
         $reset = *reset;
         
      @1
         $val1 [31:0] = >>2$out;
         $val2 [31:0] = $rand2[3:0];
         
         $valid = $reset ? 1'b0 : >>1$valid + 1'b1 ;
         $valid_or_reset = $valid || $reset;
         
      ?$vaild_or_reset
         @1   
            $sum [31:0] = $val1 + $val2;
            $diff[31:0] = $val1 - $val2;
            $prod[31:0] = $val1 * $val2;
            $div[31:0] = $val1 / $val2;
            
         @2   
            $mem[31:0] = $reset ? 32'b0 :
                         ($op[2:0] == 3'b101) ? $val1 : >>2$mem ;
            
            $out [31:0] = $reset ? 32'b0 :
                          ($op[2:0] == 3'b000) ? $sum :
                          ($op[2:0] == 3'b001) ? $diff :
                          ($op[2:0] == 3'b010) ? $prod :
                          ($op[2:0] == 3'b011) ? $quot :
                          ($op[2:0] == 3'b100) ? >>2$mem : >>2$out ;
```    

<img width="1679" alt="CALC_withMemory" src="https://github.com/user-attachments/assets/2d634f17-1f9b-42f2-a6b6-e987f9cb6ebd">    

**5. Distance accumulator:**

<img width="694" alt="Screenshot 2024-08-21 at 5 43 02 PM" src="https://github.com/user-attachments/assets/7e314ca3-d716-4bcb-897f-95bd4e578496">    

The TL-Verilog code is given below:

```
   |calc
      @1
         $reset = *reset;
      ?$valid
         @1
            $aa_sq[31:0] = $aa[3:0] * $aa;
            $bb_sq[31:0] = $bb[3:0] * $bb;
         @2
            $cc_sq[31:0] = $aa_sq + $bb_sq;
         @3
            $out[31:0] = sqrt($cc_sq);
       @4
          $tot_dist[31:0] = $reset ? '0 : 
	                    $valid ? (>>1$tot_dist + $out) : 
		            >>1$tot_dist;

```    

<img width="1678" alt="valid_signal" src="https://github.com/user-attachments/assets/378f3a62-869d-42db-812c-6b5bf3bfc704">

---------

## Day4- Building a RISC-V CPU core Micro-architecture:

Micro-architecture describes how a processor is built and designed. Micro-architecture defines, the number and size of caches, cycle counts of instructions, pipeline length, and more. The basic RISC-V CPU block diagram is shown below :    

<img width="790" alt="Top_level" src="https://github.com/user-attachments/assets/b082e7e0-8f18-498d-a869-682747bf079a">    

<img width="859" alt="Screenshot 2024-08-18 at 10 35 25 PM" src="https://github.com/user-attachments/assets/d007bb50-d34a-4afa-aa4f-1cd550550457">     


## Program Counter  

The program counter is a special register in a CPU that keeps track of the memory address of the next instruction to be fetched and executed. It is incremented as instructions are fetched, and it provides the address to the instruction memory for fetching the next instruction in the program.    


<img width="927" alt="Screenshot 2024-08-18 at 10 36 23 PM" src="https://github.com/user-attachments/assets/8a7007b2-8f3f-43bf-9aa1-10932ecff22a">


The TL-Verilog code for the program counter is shown below :   

```
	\m4_TLV_version 1d: tl-x.org
	\SV
	   // This code can be found in: https://github.com/stevehoover/RISC-V_MYTH_Workshop
	   
	   m4_include_lib(['https://raw.githubusercontent.com/BalaDhinesh/RISC-V_MYTH_Workshop/master/tlv_lib/risc-v_shell_lib.tlv'])
	
	\SV
	   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
	\TLV
	
	   // /====================\
	   // | Sum 1 to 9 Program |
	   // \====================/
	   //
	   // Program for MYTH Workshop to test RV32I
	   // Add 1,2,3,...,9 (in that order).
	   //
	   // Regs:
	   //  r10 (a0): In: 0, Out: final sum
	   //  r12 (a2): 10
	   //  r13 (a3): 1..10
	   //  r14 (a4): Sum
	   // 
	   // External to function:
	   m4_asm(ADD, r10, r0, r0)             // Initialize r10 (a0) to 0.
	   // Function:
	   m4_asm(ADD, r14, r10, r0)            // Initialize sum register a4 with 0x0
	   m4_asm(ADDI, r12, r10, 1010)         // Store count of 10 in register a2.
	   m4_asm(ADD, r13, r10, r0)            // Initialize intermediate sum register a3 with 0
	   // Loop:
	   m4_asm(ADD, r14, r13, r14)           // Incremental addition
	   m4_asm(ADDI, r13, r13, 1)            // Increment intermediate register by 1
	   m4_asm(BLT, r13, r12, 1111111111000) // If a3 is less than a2, branch to label named <loop>
	   m4_asm(ADD, r10, r14, r0)            // Store final result to register a0 so that it can be read by main program
	   
	   // Optional:
	   // m4_asm(JAL, r7, 00000000000000000000) // Done. Jump to itself (infinite loop). (Up to 20-bit signed immediate plus implicit 0 bit (unlike JALR) provides byte 		address; last immediate bit should also be 0)
	   m4_define_hier(['M4_IMEM'], M4_NUM_INSTRS)
	
	   |cpu
	      @0
	         $reset = *reset;
		
	
	      // YOUR CODE HERE
	      // ...
	      @0
	         $pc[31:0] = >>1$reset ? 32'd0 : (>>1$pc+32'd4);
	      // Note: Because of the magic we are using for visualisation, if visualisation is enabled below,
	      //       be sure to avoid having unassigned signals (which you might be using for random inputs)
	      //       other than those specifically expected in the labs. You'll get strange errors for these.
	
	   
	   // Assert these to end simulation (before Makerchip cycle limit).
	   *passed = *cyc_cnt > 40;
	   *failed = 1'b0;
	   
	   // Macro instantiations for:
	   //  o instruction memory
	   //  o register file
	   //  o data memory
	   //  o CPU visualization
	   |cpu
	      //m4+imem(@1)    // Args: (read stage)
	      //m4+rf(@1, @1)  // Args: (read stage, write stage) - if equal, no register bypass is required
	      //m4+dmem(@4)    // Args: (read/write stage)
	      //m4+myth_fpga(@0)  // Uncomment to run on fpga
	
	   //m4+cpu_viz(@4)    // For visualisation, argument should be at least equal to the last stage of CPU logic. @4 would work for all labs.
	\SV
	   endmodule
```       


<img width="1644" alt="PC_1stBlock" src="https://github.com/user-attachments/assets/186187f7-9aa1-49de-a2b4-cf365804d16f">       


## Instruction Fetch   

The Instruction Fetch Unit (IFU) in a CPU is responsible for ensuring that program instructions are retrieved from memory and executed in the correct order, serving as a crucial part of the core's control logic. The program counter plays a key role by indicating the address of the next instruction that needs to be fetched from the instruction memory. This step is essential for continuing the program’s execution and performing subsequent computations.

In this setup, the instruction memory is integrated into the program, allowing the Instruction Fetch logic to access and retrieve the required instructions. Once an instruction is fetched, it is passed on to the Decode logic for further processing. The program counter provides the read address for the instruction memory, which in turn outputs a 32-bit instruction (instr[31:0]). This sequence ensures that instructions are fetched and processed efficiently, maintaining the flow of the program.   


<img width="1059" alt="Screenshot 2024-08-18 at 10 57 38 PM" src="https://github.com/user-attachments/assets/fb61c90e-23d1-4473-a830-32ce5da002ef">


TL verilog code for Instruction Fetch is:   

```    
	\m4_TLV_version 1d: tl-x.org
	\SV
	   // This code can be found in: https://github.com/stevehoover/RISC-V_MYTH_Workshop
	   
	   m4_include_lib(['https://raw.githubusercontent.com/BalaDhinesh/RISC-V_MYTH_Workshop/master/tlv_lib/risc-v_shell_lib.tlv'])
	
	\SV
	   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
	\TLV
	
	   // /====================\
	   // | Sum 1 to 9 Program |
	   // \====================/
	   //
	   // Program for MYTH Workshop to test RV32I
	   // Add 1,2,3,...,9 (in that order).
	   //
	   // Regs:
	   //  r10 (a0): In: 0, Out: final sum
	   //  r12 (a2): 10
	   //  r13 (a3): 1..10
	   //  r14 (a4): Sum
	   // 
	   // External to function:
	   m4_asm(ADD, r10, r0, r0)             // Initialize r10 (a0) to 0.
	   // Function:
	   m4_asm(ADD, r14, r10, r0)            // Initialize sum register a4 with 0x0
	   m4_asm(ADDI, r12, r10, 1010)         // Store count of 10 in register a2.
	   m4_asm(ADD, r13, r10, r0)            // Initialize intermediate sum register a3 with 0
	   // Loop:
	   m4_asm(ADD, r14, r13, r14)           // Incremental addition
	   m4_asm(ADDI, r13, r13, 1)            // Increment intermediate register by 1
	   m4_asm(BLT, r13, r12, 1111111111000) // If a3 is less than a2, branch to label named <loop>
	   m4_asm(ADD, r10, r14, r0)            // Store final result to register a0 so that it can be read by main program
	   
	   // Optional:
	   // m4_asm(JAL, r7, 00000000000000000000) // Done. Jump to itself (infinite loop). (Up to 20-bit signed immediate plus implicit 0 bit (unlike JALR) provides byte 
	     address; last immediate bit should also be 0)
	   m4_define_hier(['M4_IMEM'], M4_NUM_INSTRS)
	
	   |cpu
	      @0
	         $reset = *reset;	
	
	      // YOUR CODE HERE
	      // ...
	      @0
	         $pc[31:0] = >>1$reset ? 32'd0 : (>>1$pc+32'd4);
	      @1
	         $imem_rd_en = !$reset;
	         $imem_rd_addr[M4_IMEM_INDEX_CNT-1:0] = $pc[M4_IMEM_INDEX_CNT+1:2];
	         $instr[31:0] = $imem_rd_data[31:0];
	      ?$imem_rd_en
	         @1
	            $imem_rd_data[31:0] = /imem[$imem_rd_addr]$instr;
	      // Note: Because of the magic we are using for visualisation, if visualisation is enabled below,
	      //       be sure to avoid having unassigned signals (which you might be using for random inputs)
	      //       other than those specifically expected in the labs. You'll get strange errors for these.
	
	   
	   // Assert these to end simulation (before Makerchip cycle limit).
	   *passed = *cyc_cnt > 40;
	   *failed = 1'b0;
	   
	   // Macro instantiations for:
	   //  o instruction memory
	   //  o register file
	   //  o data memory
	   //  o CPU visualization
	   |cpu
	      m4+imem(@1)    // Args: (read stage)
	      //m4+rf(@1, @1)  // Args: (read stage, write stage) - if equal, no register bypass is required
	      //m4+dmem(@4)    // Args: (read/write stage)
	      //m4+myth_fpga(@0)  // Uncomment to run on fpga
	
	   m4+cpu_viz(@4)    // For visualisation, argument should be at least equal to the last stage of CPU logic. @4 would work for all labs.
	\SV
	   endmodule   
```    

 
<img width="1665" alt="Screenshot 2024-08-18 at 11 07 18 PM" src="https://github.com/user-attachments/assets/50504db4-f31d-4d34-b311-22f61992d24d">    


<img width="1671" alt="Screenshot 2024-08-18 at 11 07 05 PM" src="https://github.com/user-attachments/assets/4063a759-baaa-46d6-b984-36c07b5e240d">


## Instruction Decoder:

The instruction decoder is a circuit within the CPU that interprets the machine instructions fetched from memory. It decodes the binary representation of the instruction and generates control signals that govern the operation of other components in the CPU to execute the instruction.    


<img width="797" alt="Screenshot 2024-08-18 at 11 27 08 PM" src="https://github.com/user-attachments/assets/6abfb272-5480-4b36-941c-dc4fc2626560">     


The TL verilog code is given below:

```
	\m4_TLV_version 1d: tl-x.org
	\SV
	   // This code can be found in: https://github.com/stevehoover/RISC-V_MYTH_Workshop
	   
	   m4_include_lib(['https://raw.githubusercontent.com/BalaDhinesh/RISC-V_MYTH_Workshop/master/tlv_lib/risc-v_shell_lib.tlv'])
	
	\SV
	   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
	\TLV
	
	   // /====================\
	   // | Sum 1 to 9 Program |
	   // \====================/
	   //
	   // Program for MYTH Workshop to test RV32I
	   // Add 1,2,3,...,9 (in that order).
	   //
	   // Regs:
	   //  r10 (a0): In: 0, Out: final sum
	   //  r12 (a2): 10
	   //  r13 (a3): 1..10
	   //  r14 (a4): Sum
	   // 
	   // External to function:
	   m4_asm(ADD, r10, r0, r0)             // Initialize r10 (a0) to 0.
	   // Function:
	   m4_asm(ADD, r14, r10, r0)            // Initialize sum register a4 with 0x0
	   m4_asm(ADDI, r12, r10, 1010)         // Store count of 10 in register a2.
	   m4_asm(ADD, r13, r10, r0)            // Initialize intermediate sum register a3 with 0
	   // Loop:
	   m4_asm(ADD, r14, r13, r14)           // Incremental addition
	   m4_asm(ADDI, r13, r13, 1)            // Increment intermediate register by 1
	   m4_asm(BLT, r13, r12, 1111111111000) // If a3 is less than a2, branch to label named <loop>
	   m4_asm(ADD, r10, r14, r0)            // Store final result to register a0 so that it can be read by main program
	   
	   // Optional:
	   // m4_asm(JAL, r7, 00000000000000000000) // Done. Jump to itself (infinite loop). (Up to 20-bit signed immediate plus implicit 0 bit (unlike JALR) provides byte 
           address; last immediate bit should also be 0)
	   m4_define_hier(['M4_IMEM'], M4_NUM_INSTRS)
	
	   |cpu
	      @0
	         $reset = *reset;
	
	
	
	      // YOUR CODE HERE
	      // ...
	      @0
	         $pc[31:0] = >>1$reset ? 32'd0 : (>>1$pc+32'd4);
	      @1
	         //Instruction Fetch
	         $imem_rd_en = !$reset;
	         $imem_rd_addr[M4_IMEM_INDEX_CNT-1:0] = $pc[M4_IMEM_INDEX_CNT+1:2];
	         $instr[31:0] = $imem_rd_data[31:0];
	      ?$imem_rd_en
	         @1
	            $imem_rd_data[31:0] = /imem[$imem_rd_addr]$instr;
	      @1
	         //Instruction Decode
	         $is_i_instr = $instr[6:2] ==? 5'b0000x ||
	                       $instr[6:2] ==? 5'b001x0 ||
	                       $instr[6:2] ==? 5'b11001 ||
	                       $instr[6:2] ==? 5'b11100;
	         
	         $is_u_instr = $instr[6:2] ==? 5'b0x101;
	         
	         $is_r_instr = $instr[6:2] ==? 5'b01011 ||
	                       $instr[6:2] ==? 5'b011x0 ||
	                       $instr[6:2] ==? 5'b10100;
	         
	         $is_b_instr = $instr[6:2] ==? 5'b11000;
	         
	         $is_j_instr = $instr[6:2] ==? 5'b11011;
	         
	         $is_s_instr = $instr[6:2] ==? 5'b0100x;
	         
	         $imm[31:0] = $is_i_instr ? {{21{$instr[31]}}, $instr[30:20]} :
	                      $is_s_instr ? {{21{$instr[31]}}, $instr[30:25], $instr[11:7]} :
	                      $is_b_instr ? {{20{$instr[31]}}, $instr[7], $instr[30:25], $instr[11:8], 1'b0} :
	                      $is_u_instr ? {$instr[31:12], 12'b0} :
	                      $is_j_instr ? {{12{$instr[31]}}, $instr[19:12], $instr[20], $instr[30:21], 1'b0} :
	                                    32'b0;
	         $opcode[6:0] = $instr[6:0];
	         
	         $rs2_valid = $is_r_instr || $is_s_instr || $is_b_instr;
	         ?$rs2_valid
	            $rs2[4:0] = $instr[24:20];
	            
	         $rs1_valid = $is_r_instr || $is_i_instr || $is_s_instr || $is_b_instr;
	         ?$rs1_valid
	            $rs1[4:0] = $instr[19:15];
	         
	         $funct3_valid = $is_r_instr || $is_i_instr || $is_s_instr || $is_b_instr;
	         ?$funct3_valid
	            $funct3[2:0] = $instr[14:12];
	            
	         $funct7_valid = $is_r_instr ;
	         ?$funct7_valid
	            $funct7[6:0] = $instr[31:25];
	            
	         $rd_valid = $is_r_instr || $is_i_instr || $is_u_instr || $is_j_instr;
	         ?$rd_valid
	            $rd[4:0] = $instr[11:7];
	            
	         $dec_bits [10:0] = {$funct7[5], $funct3, $opcode};
	         $is_beq = $dec_bits ==? 11'bx_000_1100011;
	         $is_bne = $dec_bits ==? 11'bx_001_1100011;
	         $is_blt = $dec_bits ==? 11'bx_100_1100011;
	         $is_bge = $dec_bits ==? 11'bx_101_1100011;
	         $is_bltu = $dec_bits ==? 11'bx_110_1100011;
	         $is_bgeu = $dec_bits ==? 11'bx_111_1100011;
	         $is_addi = $dec_bits ==? 11'bx_000_0010011;
	         $is_add = $dec_bits ==? 11'b0_000_0110011;
	      
	      // Note: Because of the magic we are using for visualisation, if visualisation is enabled below,
	      //       be sure to avoid having unassigned signals (which you might be using for random inputs)
	      //       other than those specifically expected in the labs. You'll get strange errors for these.
	
	   
	   // Assert these to end simulation (before Makerchip cycle limit).
	   *passed = *cyc_cnt > 40;
	   *failed = 1'b0;
	   
	   // Macro instantiations for:
	   //  o instruction memory
	   //  o register file
	   //  o data memory
	   //  o CPU visualization
	   |cpu
	      m4+imem(@1)    // Args: (read stage)
	      //m4+rf(@1, @1)  // Args: (read stage, write stage) - if equal, no register bypass is required
	      //m4+dmem(@4)    // Args: (read/write stage)
	      //m4+myth_fpga(@0)  // Uncomment to run on fpga
	
	   m4+cpu_viz(@4)    // For visualisation, argument should be at least equal to the last stage of CPU logic. @4 would work for all labs.
	\SV
	   endmodule    

```       



<img width="1631" alt="imme_bits" src="https://github.com/user-attachments/assets/778bf196-147c-4fcf-8e13-e284025a8be0">     



<img width="1632" alt="Screenshot 2024-08-18 at 11 17 43 PM" src="https://github.com/user-attachments/assets/c5e5087a-4f25-4c72-959c-88ba276ddebb">     



<img width="1619" alt="other_fields_decode" src="https://github.com/user-attachments/assets/8f30278b-835f-482b-8ea4-5b7ea6bb56eb">    


## Register File Read   

Most instructions, particularly arithmetic ones, require data from source registers, which means the CPU needs to read from these registers. To facilitate this, the CPU's register file is designed to handle two simultaneous reads for the source operands (rs1 and rs2) and one write operation per cycle to the destination register. The register file receives rs1 and rs2 as inputs and outputs the corresponding register values. The enable bits for rs1 and rs2 are activated based on their validity, as determined earlier in the process. This setup, known as a 2-port register file, allows the CPU to read from two registers at the same time. The retrieved data is then stored in registers and sent to the ALU for further processing.    


<img width="896" alt="RF_read" src="https://github.com/user-attachments/assets/b616c16f-8a1f-4c6c-b929-8e3bfe345b83">

   
The TL-Verilog code is given below :

```
	\m4_TLV_version 1d: tl-x.org
	\SV
	   // This code can be found in: https://github.com/stevehoover/RISC-V_MYTH_Workshop
	   
	   m4_include_lib(['https://raw.githubusercontent.com/BalaDhinesh/RISC-V_MYTH_Workshop/master/tlv_lib/risc-v_shell_lib.tlv'])
	
	\SV
	   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
	\TLV
	
	   // /====================\
	   // | Sum 1 to 9 Program |
	   // \====================/
	   //
	   // Program for MYTH Workshop to test RV32I
	   // Add 1,2,3,...,9 (in that order).
	   //
	   // Regs:
	   //  r10 (a0): In: 0, Out: final sum
	   //  r12 (a2): 10
	   //  r13 (a3): 1..10
	   //  r14 (a4): Sum
	   // 
	   // External to function:
	   m4_asm(ADD, r10, r0, r0)             // Initialize r10 (a0) to 0.
	   // Function:
	   m4_asm(ADD, r14, r10, r0)            // Initialize sum register a4 with 0x0
	   m4_asm(ADDI, r12, r10, 1010)         // Store count of 10 in register a2.
	   m4_asm(ADD, r13, r10, r0)            // Initialize intermediate sum register a3 with 0
	   // Loop:
	   m4_asm(ADD, r14, r13, r14)           // Incremental addition
	   m4_asm(ADDI, r13, r13, 1)            // Increment intermediate register by 1
	   m4_asm(BLT, r13, r12, 1111111111000) // If a3 is less than a2, branch to label named <loop>
	   m4_asm(ADD, r10, r14, r0)            // Store final result to register a0 so that it can be read by main program
	   
	   // Optional:
	   // m4_asm(JAL, r7, 00000000000000000000) // Done. Jump to itself (infinite loop). (Up to 20-bit signed immediate plus implicit 0 bit (unlike JALR) provides byte 	   address; last immediate bit should also be 0)
	   m4_define_hier(['M4_IMEM'], M4_NUM_INSTRS)
	
	   |cpu
	      @0
	         $reset = *reset;
	
	
	
	      // YOUR CODE HERE
	      // ...
	      @0
	         $pc[31:0] = >>1$reset ? 32'd0 : (>>1$pc+32'd4);
	      @1
	         //Instruction Fetch
	         $imem_rd_en = !$reset;
	         $imem_rd_addr[M4_IMEM_INDEX_CNT-1:0] = $pc[M4_IMEM_INDEX_CNT+1:2];
	         $instr[31:0] = $imem_rd_data[31:0];
	      ?$imem_rd_en
	         @1
	            $imem_rd_data[31:0] = /imem[$imem_rd_addr]$instr;
	      @1
	         //Instruction Decode
	         $is_i_instr = $instr[6:2] ==? 5'b0000x ||
	                       $instr[6:2] ==? 5'b001x0 ||
	                       $instr[6:2] ==? 5'b11001 ||
	                       $instr[6:2] ==? 5'b11100;
	         
	         $is_u_instr = $instr[6:2] ==? 5'b0x101;
	         
	         $is_r_instr = $instr[6:2] ==? 5'b01011 ||
	                       $instr[6:2] ==? 5'b011x0 ||
	                       $instr[6:2] ==? 5'b10100;
	         
	         $is_b_instr = $instr[6:2] ==? 5'b11000;
	         
	         $is_j_instr = $instr[6:2] ==? 5'b11011;
	         
	         $is_s_instr = $instr[6:2] ==? 5'b0100x;
	         
	         $imm[31:0] = $is_i_instr ? {{21{$instr[31]}}, $instr[30:20]} :
	                      $is_s_instr ? {{21{$instr[31]}}, $instr[30:25], $instr[11:7]} :
	                      $is_b_instr ? {{20{$instr[31]}}, $instr[7], $instr[30:25], $instr[11:8], 1'b0} :
	                      $is_u_instr ? {$instr[31:12], 12'b0} :
	                      $is_j_instr ? {{12{$instr[31]}}, $instr[19:12], $instr[20], $instr[30:21], 1'b0} :
	                                    32'b0;
	         $opcode[6:0] = $instr[6:0];
	         
	         $rs2_valid = $is_r_instr || $is_s_instr || $is_b_instr;
	         ?$rs2_valid
	            $rs2[4:0] = $instr[24:20];
	            
	         $rs1_valid = $is_r_instr || $is_i_instr || $is_s_instr || $is_b_instr;
	         ?$rs1_valid
	            $rs1[4:0] = $instr[19:15];
	         
	         $funct3_valid = $is_r_instr || $is_i_instr || $is_s_instr || $is_b_instr;
	         ?$funct3_valid
	            $funct3[2:0] = $instr[14:12];
	            
	         $funct7_valid = $is_r_instr ;
	         ?$funct7_valid
	            $funct7[6:0] = $instr[31:25];
	            
	         $rd_valid = $is_r_instr || $is_i_instr || $is_u_instr || $is_j_instr;
	         ?$rd_valid
	            $rd[4:0] = $instr[11:7];
	            
	         $dec_bits [10:0] = {$funct7[5], $funct3, $opcode};
	         $is_beq = $dec_bits ==? 11'bx_000_1100011;
	         $is_bne = $dec_bits ==? 11'bx_001_1100011;
	         $is_blt = $dec_bits ==? 11'bx_100_1100011;
	         $is_bge = $dec_bits ==? 11'bx_101_1100011;
	         $is_bltu = $dec_bits ==? 11'bx_110_1100011;
	         $is_bgeu = $dec_bits ==? 11'bx_111_1100011;
	         $is_addi = $dec_bits ==? 11'bx_000_0010011;
	         $is_add = $dec_bits ==? 11'b0_000_0110011;
	         
	      @1
	         //Register File Read
	         $rf_wr_en = 1'b0;
	         $rf_wr_index[4:0] = 5'b0;
	         $rf_wr_data[31:0] = 32'b0;
	         
	         $rf_rd_en1 = $rs1_valid;
	         $rf_rd_index1[4:0] = $rs1;
	         
	         $rf_rd_en2 = $rs2_valid;
	         $rf_rd_index2[4:0] = $rs2;
	         
	         $src1_value[31:0] = $rf_rd_data1;
	         $src2_value[31:0] = $rf_rd_data2;
	         
	      // Note: Because of the magic we are using for visualisation, if visualisation is enabled below,
	      //       be sure to avoid having unassigned signals (which you might be using for random inputs)
	      //       other than those specifically expected in the labs. You'll get strange errors for these.
	
	   
	   // Assert these to end simulation (before Makerchip cycle limit).
	   *passed = *cyc_cnt > 40;
	   *failed = 1'b0;
	   
	   // Macro instantiations for:
	   //  o instruction memory
	   //  o register file
	   //  o data memory
	   //  o CPU visualization
	   |cpu
	      m4+imem(@1)    // Args: (read stage)
	      m4+rf(@1, @1)  // Args: (read stage, write stage) - if equal, no register bypass is required
	      //m4+dmem(@4)    // Args: (read/write stage)
	      //m4+myth_fpga(@0)  // Uncomment to run on fpga
	
	   m4+cpu_viz(@4)    // For visualisation, argument should be at least equal to the last stage of CPU logic. @4 would work for all labs.
	\SV
	   endmodule

```

## ALU 

The ALU is a fundamental digital circuit within the CPU that performs arithmetic and logical operations on data. It can perform tasks such as addition, subtraction, multiplication, division, bitwise operations (AND, OR, XOR), and comparisons. The ALU generates results that are used in various computations specified by the instructions.   


<img width="924" alt="ALU_BLOCK" src="https://github.com/user-attachments/assets/69717c56-bf73-4110-bdb3-db9c67dc6200">


The TL-Verilog Code is given below:    

```
	\m4_TLV_version 1d: tl-x.org
	\SV
	   // This code can be found in: https://github.com/stevehoover/RISC-V_MYTH_Workshop
	   
	   m4_include_lib(['https://raw.githubusercontent.com/BalaDhinesh/RISC-V_MYTH_Workshop/master/tlv_lib/risc-v_shell_lib.tlv'])
	
	\SV
	   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
	\TLV
	
	   // /====================\
	   // | Sum 1 to 9 Program |
	   // \====================/
	   //
	   // Program for MYTH Workshop to test RV32I
	   // Add 1,2,3,...,9 (in that order).
	   //
	   // Regs:
	   //  r10 (a0): In: 0, Out: final sum
	   //  r12 (a2): 10
	   //  r13 (a3): 1..10
	   //  r14 (a4): Sum
	   // 
	   // External to function:
	   m4_asm(ADD, r10, r0, r0)             // Initialize r10 (a0) to 0.
	   // Function:
	   m4_asm(ADD, r14, r10, r0)            // Initialize sum register a4 with 0x0
	   m4_asm(ADDI, r12, r10, 1010)         // Store count of 10 in register a2.
	   m4_asm(ADD, r13, r10, r0)            // Initialize intermediate sum register a3 with 0
	   // Loop:
	   m4_asm(ADD, r14, r13, r14)           // Incremental addition
	   m4_asm(ADDI, r13, r13, 1)            // Increment intermediate register by 1
	   m4_asm(BLT, r13, r12, 1111111111000) // If a3 is less than a2, branch to label named <loop>
	   m4_asm(ADD, r10, r14, r0)            // Store final result to register a0 so that it can be read by main program
	   
	   // Optional:
	   // m4_asm(JAL, r7, 00000000000000000000) // Done. Jump to itself (infinite loop). (Up to 20-bit signed immediate plus implicit 0 bit (unlike JALR) provides byte 	   address; last immediate bit should also be 0)
	   m4_define_hier(['M4_IMEM'], M4_NUM_INSTRS)
	
	   |cpu
	      @0
	         $reset = *reset;
	
	
	
	      // YOUR CODE HERE
	      // ...
	      @0
	         $pc[31:0] = >>1$reset ? 32'd0 : (>>1$pc+32'd4);
	      @1
	         //Instruction Fetch
	         $imem_rd_en = !$reset;
	         $imem_rd_addr[M4_IMEM_INDEX_CNT-1:0] = $pc[M4_IMEM_INDEX_CNT+1:2];
	         $instr[31:0] = $imem_rd_data[31:0];
	      ?$imem_rd_en
	         @1
	            $imem_rd_data[31:0] = /imem[$imem_rd_addr]$instr;
	      @1
	         //Instruction Decode
	         $is_i_instr = $instr[6:2] ==? 5'b0000x ||
	                       $instr[6:2] ==? 5'b001x0 ||
	                       $instr[6:2] ==? 5'b11001 ||
	                       $instr[6:2] ==? 5'b11100;
	         
	         $is_u_instr = $instr[6:2] ==? 5'b0x101;
	         
	         $is_r_instr = $instr[6:2] ==? 5'b01011 ||
	                       $instr[6:2] ==? 5'b011x0 ||
	                       $instr[6:2] ==? 5'b10100;
	         
	         $is_b_instr = $instr[6:2] ==? 5'b11000;
	         
	         $is_j_instr = $instr[6:2] ==? 5'b11011;
	         
	         $is_s_instr = $instr[6:2] ==? 5'b0100x;
	         
	         $imm[31:0] = $is_i_instr ? {{21{$instr[31]}}, $instr[30:20]} :
	                      $is_s_instr ? {{21{$instr[31]}}, $instr[30:25], $instr[11:7]} :
	                      $is_b_instr ? {{20{$instr[31]}}, $instr[7], $instr[30:25], $instr[11:8], 1'b0} :
	                      $is_u_instr ? {$instr[31:12], 12'b0} :
	                      $is_j_instr ? {{12{$instr[31]}}, $instr[19:12], $instr[20], $instr[30:21], 1'b0} :
	                                    32'b0;
	         $opcode[6:0] = $instr[6:0];
	         
	         $rs2_valid = $is_r_instr || $is_s_instr || $is_b_instr;
	         ?$rs2_valid
	            $rs2[4:0] = $instr[24:20];
	            
	         $rs1_valid = $is_r_instr || $is_i_instr || $is_s_instr || $is_b_instr;
	         ?$rs1_valid
	            $rs1[4:0] = $instr[19:15];
	         
	         $funct3_valid = $is_r_instr || $is_i_instr || $is_s_instr || $is_b_instr;
	         ?$funct3_valid
	            $funct3[2:0] = $instr[14:12];
	            
	         $funct7_valid = $is_r_instr ;
	         ?$funct7_valid
	            $funct7[6:0] = $instr[31:25];
	            
	         $rd_valid = $is_r_instr || $is_i_instr || $is_u_instr || $is_j_instr;
	         ?$rd_valid
	            $rd[4:0] = $instr[11:7];
	            
	         $dec_bits [10:0] = {$funct7[5], $funct3, $opcode};
	         $is_beq = $dec_bits ==? 11'bx_000_1100011;
	         $is_bne = $dec_bits ==? 11'bx_001_1100011;
	         $is_blt = $dec_bits ==? 11'bx_100_1100011;
	         $is_bge = $dec_bits ==? 11'bx_101_1100011;
	         $is_bltu = $dec_bits ==? 11'bx_110_1100011;
	         $is_bgeu = $dec_bits ==? 11'bx_111_1100011;
	         $is_addi = $dec_bits ==? 11'bx_000_0010011;
	         $is_add = $dec_bits ==? 11'b0_000_0110011;
	         
	      @1
	         //Register File Read
	         $rf_wr_en = 1'b0;
	         $rf_wr_index[4:0] = 5'b0;
	         $rf_wr_data[31:0] = 32'b0;
	         
	         $rf_rd_en1 = $rs1_valid;
	         $rf_rd_index1[4:0] = $rs1;
	         
	         $rf_rd_en2 = $rs2_valid;
	         $rf_rd_index2[4:0] = $rs2;
	         
	         $src1_value[31:0] = $rf_rd_data1;
	         $src2_value[31:0] = $rf_rd_data2;
	         
	      @1
	         //ALU
	         $result[31:0] = $is_addi ? $src1_value + $imm :
	                         $is_add ? $src1_value + $src2_value :
	                         32'bx ;
	         
	      // Note: Because of the magic we are using for visualisation, if visualisation is enabled below,
	      //       be sure to avoid having unassigned signals (which you might be using for random inputs)
	      //       other than those specifically expected in the labs. You'll get strange errors for these.
	
	   
	   // Assert these to end simulation (before Makerchip cycle limit).
	   *passed = *cyc_cnt > 40;
	   *failed = 1'b0;
	   
	   // Macro instantiations for:
	   //  o instruction memory
	   //  o register file
	   //  o data memory
	   //  o CPU visualization
	   |cpu
	      m4+imem(@1)    // Args: (read stage)
	      m4+rf(@1, @1)  // Args: (read stage, write stage) - if equal, no register bypass is required
	      //m4+dmem(@4)    // Args: (read/write stage)
	      //m4+myth_fpga(@0)  // Uncomment to run on fpga
	
	   m4+cpu_viz(@4)    // For visualisation, argument should be at least equal to the last stage of CPU logic. @4 would work for all labs.
	\SV
	   endmodule   
   
```    

<img width="1639" alt="ALU" src="https://github.com/user-attachments/assets/08c62efe-4566-4127-9ead-b854290b5991">      


## Register File Write

The write register file is responsible for storing the results of operations back into registers. After an instruction is executed, the result is often written back to the register file. This ensures that the updated data is available for subsequent instructions.

These components work together to execute machine instructions in a CPU. The program counter guides the instruction fetch process, the instruction decoder interprets instructions, the ALU performs computations, the register files hold data, and the memory components provide data storage and access. This orchestration allows a CPU to carry out the tasks required by a program's instructions.   


The TL-Verilog code is given below :      

```     
	\m4_TLV_version 1d: tl-x.org
	\SV
	   // This code can be found in: https://github.com/stevehoover/RISC-V_MYTH_Workshop
	   
	   m4_include_lib(['https://raw.githubusercontent.com/BalaDhinesh/RISC-V_MYTH_Workshop/master/tlv_lib/risc-v_shell_lib.tlv'])
	
	\SV
	   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
	\TLV
	
	   // /====================\
	   // | Sum 1 to 9 Program |
	   // \====================/
	   //
	   // Program for MYTH Workshop to test RV32I
	   // Add 1,2,3,...,9 (in that order).
	   //
	   // Regs:
	   //  r10 (a0): In: 0, Out: final sum
	   //  r12 (a2): 10
	   //  r13 (a3): 1..10
	   //  r14 (a4): Sum
	   // 
	   // External to function:
	   m4_asm(ADD, r10, r0, r0)             // Initialize r10 (a0) to 0.
	   // Function:
	   m4_asm(ADD, r14, r10, r0)            // Initialize sum register a4 with 0x0
	   m4_asm(ADDI, r12, r10, 1010)         // Store count of 10 in register a2.
	   m4_asm(ADD, r13, r10, r0)            // Initialize intermediate sum register a3 with 0
	   // Loop:
	   m4_asm(ADD, r14, r13, r14)           // Incremental addition
	   m4_asm(ADDI, r13, r13, 1)            // Increment intermediate register by 1
	   m4_asm(BLT, r13, r12, 1111111111000) // If a3 is less than a2, branch to label named <loop>
	   m4_asm(ADD, r10, r14, r0)            // Store final result to register a0 so that it can be read by main program
	   
	   // Optional:
	   // m4_asm(JAL, r7, 00000000000000000000) // Done. Jump to itself (infinite loop). (Up to 20-bit signed immediate plus implicit 0 bit (unlike JALR) provides byte 		address; last immediate bit should also be 0)
	   m4_define_hier(['M4_IMEM'], M4_NUM_INSTRS)
	
	   |cpu
	      @0
	         $reset = *reset;
	
	
	
	      // YOUR CODE HERE
	      // ...
	      @0
	         $pc[31:0] = >>1$reset ? 32'd0 : (>>1$pc+32'd4);
	      @1
	         //Instruction Fetch
	         $imem_rd_en = !$reset;
	         $imem_rd_addr[M4_IMEM_INDEX_CNT-1:0] = $pc[M4_IMEM_INDEX_CNT+1:2];
	         $instr[31:0] = $imem_rd_data[31:0];
	      ?$imem_rd_en
	         @1
	            $imem_rd_data[31:0] = /imem[$imem_rd_addr]$instr;
	      @1
	         //Instruction Decode
	         $is_i_instr = $instr[6:2] ==? 5'b0000x ||
	                       $instr[6:2] ==? 5'b001x0 ||
	                       $instr[6:2] ==? 5'b11001 ||
	                       $instr[6:2] ==? 5'b11100;
	         
	         $is_u_instr = $instr[6:2] ==? 5'b0x101;
	         
	         $is_r_instr = $instr[6:2] ==? 5'b01011 ||
	                       $instr[6:2] ==? 5'b011x0 ||
	                       $instr[6:2] ==? 5'b10100;
	         
	         $is_b_instr = $instr[6:2] ==? 5'b11000;
	         
	         $is_j_instr = $instr[6:2] ==? 5'b11011;
	         
	         $is_s_instr = $instr[6:2] ==? 5'b0100x;
	         
	         $imm[31:0] = $is_i_instr ? {{21{$instr[31]}}, $instr[30:20]} :
	                      $is_s_instr ? {{21{$instr[31]}}, $instr[30:25], $instr[11:7]} :
	                      $is_b_instr ? {{20{$instr[31]}}, $instr[7], $instr[30:25], $instr[11:8], 1'b0} :
	                      $is_u_instr ? {$instr[31:12], 12'b0} :
	                      $is_j_instr ? {{12{$instr[31]}}, $instr[19:12], $instr[20], $instr[30:21], 1'b0} :
	                                    32'b0;
	         $opcode[6:0] = $instr[6:0];
	         
	         $rs2_valid = $is_r_instr || $is_s_instr || $is_b_instr;
	         ?$rs2_valid
	            $rs2[4:0] = $instr[24:20];
	            
	         $rs1_valid = $is_r_instr || $is_i_instr || $is_s_instr || $is_b_instr;
	         ?$rs1_valid
	            $rs1[4:0] = $instr[19:15];
	         
	         $funct3_valid = $is_r_instr || $is_i_instr || $is_s_instr || $is_b_instr;
	         ?$funct3_valid
	            $funct3[2:0] = $instr[14:12];
	            
	         $funct7_valid = $is_r_instr ;
	         ?$funct7_valid
	            $funct7[6:0] = $instr[31:25];
	            
	         $rd_valid = $is_r_instr || $is_i_instr || $is_u_instr || $is_j_instr;
	         ?$rd_valid 
	            $rd[4:0] = $instr[11:7]; //rd - Destination Register
	            
	         $dec_bits [10:0] = {$funct7[5], $funct3, $opcode};
	         $is_beq = $dec_bits ==? 11'bx_000_1100011;
	         $is_bne = $dec_bits ==? 11'bx_001_1100011;
	         $is_blt = $dec_bits ==? 11'bx_100_1100011;
	         $is_bge = $dec_bits ==? 11'bx_101_1100011;
	         $is_bltu = $dec_bits ==? 11'bx_110_1100011;
	         $is_bgeu = $dec_bits ==? 11'bx_111_1100011;
	         $is_addi = $dec_bits ==? 11'bx_000_0010011;
	         $is_add = $dec_bits ==? 11'b0_000_0110011;
	         
	      @1
	         //Register File Read
	         $rf_wr_en = 1'b0;
	         $rf_wr_index[4:0] = 5'b0;
	         $rf_wr_data[31:0] = 32'b0;
	         
	         $rf_rd_en1 = $rs1_valid;
	         $rf_rd_index1[4:0] = $rs1;
	         
	         $rf_rd_en2 = $rs2_valid;
	         $rf_rd_index2[4:0] = $rs2;
	         
	         $src1_value[31:0] = $rf_rd_data1;
	         $src2_value[31:0] = $rf_rd_data2;
	         
	      @1
	         //ALU
	         $result[31:0] = $is_addi ? $src1_value + $imm :
	                         $is_add ? $src1_value + $src2_value :
	                         32'bx ;
	      @1
	         //Register File Write
	         $rf_wr_en = $rd_valid && $rd != 5'b0;
	         $rf_wr_index[4:0] = $rd;
	         $rf_wr_data[31:0] = $result;
	         
	      // Note: Because of the magic we are using for visualisation, if visualisation is enabled below,
	      //       be sure to avoid having unassigned signals (which you might be using for random inputs)
	      //       other than those specifically expected in the labs. You'll get strange errors for these.
	
	   
	   // Assert these to end simulation (before Makerchip cycle limit).
	   *passed = *cyc_cnt > 40;
	   *failed = 1'b0;
	   
	   // Macro instantiations for:
	   //  o instruction memory
	   //  o register file
	   //  o data memory
	   //  o CPU visualization
	   |cpu
	      m4+imem(@1)    // Args: (read stage)
	      m4+rf(@1, @1)  // Args: (read stage, write stage) - if equal, no register bypass is required
	      //m4+dmem(@4)    // Args: (read/write stage)
	      //m4+myth_fpga(@0)  // Uncomment to run on fpga
	
	   m4+cpu_viz(@4)    // For visualisation, argument should be at least equal to the last stage of CPU logic. @4 would work for all labs.
	\SV
	   endmodule

```      


<img width="1613" alt="CPU_RF_write" src="https://github.com/user-attachments/assets/c71f0a1b-ddc3-426d-9f04-87982131b0b5">       



## Branch Instructions

The last stage involves adding support for branch instructions. In the RISC-V instruction set architecture, branches are conditional, so a branch is executed only when a particular condition is fulfilled. Moreover, the target address for the branch (Program Counter or PC) needs to be computed. If the branch condition is met, the PC is updated to this new target address. This ensures that when a branch occurs, the program counter correctly points to the desired instruction.   


<img width="847" alt="Branch_instructions" src="https://github.com/user-attachments/assets/45dac366-7f73-4a2b-ada6-62e9cb3fe413">     


The TL-Verilog Code is given below :

```
	\m4_TLV_version 1d: tl-x.org
	\SV
	   // This code can be found in: https://github.com/stevehoover/RISC-V_MYTH_Workshop
	   
	   m4_include_lib(['https://raw.githubusercontent.com/BalaDhinesh/RISC-V_MYTH_Workshop/master/tlv_lib/risc-v_shell_lib.tlv'])
	
	\SV
	   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
	\TLV
	
	   // /====================\
	   // | Sum 1 to 9 Program |
	   // \====================/
	   //
	   // Program for MYTH Workshop to test RV32I
	   // Add 1,2,3,...,9 (in that order).
	   //
	   // Regs:
	   //  r10 (a0): In: 0, Out: final sum
	   //  r12 (a2): 10
	   //  r13 (a3): 1..10
	   //  r14 (a4): Sum
	   // 
	   // External to function:
	   m4_asm(ADD, r10, r0, r0)             // Initialize r10 (a0) to 0.
	   // Function:
	   m4_asm(ADD, r14, r10, r0)            // Initialize sum register a4 with 0x0
	   m4_asm(ADDI, r12, r10, 1010)         // Store count of 10 in register a2.
	   m4_asm(ADD, r13, r10, r0)            // Initialize intermediate sum register a3 with 0
	   // Loop:
	   m4_asm(ADD, r14, r13, r14)           // Incremental addition
	   m4_asm(ADDI, r13, r13, 1)            // Increment intermediate register by 1
	   m4_asm(BLT, r13, r12, 1111111111000) // If a3 is less than a2, branch to label named <loop>
	   m4_asm(ADD, r10, r14, r0)            // Store final result to register a0 so that it can be read by main program
	   
	   // Optional:
	   // m4_asm(JAL, r7, 00000000000000000000) // Done. Jump to itself (infinite loop). (Up to 20-bit signed immediate plus implicit 0 bit (unlike JALR) provides byte 	address; last immediate bit should also be 0)
	   m4_define_hier(['M4_IMEM'], M4_NUM_INSTRS)
	
	   |cpu
	      @0
	         $reset = *reset;
	
	
	
	      // YOUR CODE HERE
	      // ...
	      @0
	         $pc[31:0] = >>1$reset ? 32'd0 : (>>1$taken_branch ? >>1$br_tgt_pc :  (>>1$pc+32'd4));
	      @1
	         //Instruction Fetch
	         $imem_rd_en = !$reset;
	         $imem_rd_addr[M4_IMEM_INDEX_CNT-1:0] = $pc[M4_IMEM_INDEX_CNT+1:2];
	         $instr[31:0] = $imem_rd_data[31:0];
	      ?$imem_rd_en
	         @1
	            $imem_rd_data[31:0] = /imem[$imem_rd_addr]$instr;
	      @1
	         //Instruction Decode
	         $is_i_instr = $instr[6:2] ==? 5'b0000x ||
	                       $instr[6:2] ==? 5'b001x0 ||
	                       $instr[6:2] ==? 5'b11001 ||
	                       $instr[6:2] ==? 5'b11100;
	         
	         $is_u_instr = $instr[6:2] ==? 5'b0x101;
	         
	         $is_r_instr = $instr[6:2] ==? 5'b01011 ||
	                       $instr[6:2] ==? 5'b011x0 ||
	                       $instr[6:2] ==? 5'b10100;
	         
	         $is_b_instr = $instr[6:2] ==? 5'b11000;
	         
	         $is_j_instr = $instr[6:2] ==? 5'b11011;
	         
	         $is_s_instr = $instr[6:2] ==? 5'b0100x;
	         
	         $imm[31:0] = $is_i_instr ? {{21{$instr[31]}}, $instr[30:20]} :
	                      $is_s_instr ? {{21{$instr[31]}}, $instr[30:25], $instr[11:7]} :
	                      $is_b_instr ? {{20{$instr[31]}}, $instr[7], $instr[30:25], $instr[11:8], 1'b0} :
	                      $is_u_instr ? {$instr[31:12], 12'b0} :
	                      $is_j_instr ? {{12{$instr[31]}}, $instr[19:12], $instr[20], $instr[30:21], 1'b0} :
	                                    32'b0;
	         $opcode[6:0] = $instr[6:0];
	         
	         $rs2_valid = $is_r_instr || $is_s_instr || $is_b_instr;
	         ?$rs2_valid
	            $rs2[4:0] = $instr[24:20];
	            
	         $rs1_valid = $is_r_instr || $is_i_instr || $is_s_instr || $is_b_instr;
	         ?$rs1_valid
	            $rs1[4:0] = $instr[19:15];
	         
	         $funct3_valid = $is_r_instr || $is_i_instr || $is_s_instr || $is_b_instr;
	         ?$funct3_valid
	            $funct3[2:0] = $instr[14:12];
	            
	         $funct7_valid = $is_r_instr ;
	         ?$funct7_valid
	            $funct7[6:0] = $instr[31:25];
	            
	         $rd_valid = $is_r_instr || $is_i_instr || $is_u_instr || $is_j_instr;
	         ?$rd_valid 
	            $rd[4:0] = $instr[11:7]; //rd - Destination Register
	            
	         $dec_bits [10:0] = {$funct7[5], $funct3, $opcode};
	         $is_beq = $dec_bits ==? 11'bx_000_1100011;
	         $is_bne = $dec_bits ==? 11'bx_001_1100011;
	         $is_blt = $dec_bits ==? 11'bx_100_1100011;
	         $is_bge = $dec_bits ==? 11'bx_101_1100011;
	         $is_bltu = $dec_bits ==? 11'bx_110_1100011;
	         $is_bgeu = $dec_bits ==? 11'bx_111_1100011;
	         $is_addi = $dec_bits ==? 11'bx_000_0010011;
	         $is_add = $dec_bits ==? 11'b0_000_0110011;
	         
	      @1
	         //Register File Read
	         $rf_wr_en = 1'b0;
	         $rf_wr_index[4:0] = 5'b0;
	         $rf_wr_data[31:0] = 32'b0;
	         
	         $rf_rd_en1 = $rs1_valid;
	         $rf_rd_index1[4:0] = $rs1;
	         
	         $rf_rd_en2 = $rs2_valid;
	         $rf_rd_index2[4:0] = $rs2;
	         
	         $src1_value[31:0] = $rf_rd_data1;
	         $src2_value[31:0] = $rf_rd_data2;
	         
	      @1
	         //ALU
	         $result[31:0] = $is_addi ? $src1_value + $imm :
	                         $is_add ? $src1_value + $src2_value :
	                         32'bx ;
	      @1
	         //Register File Write
	         $rf_wr_en = $rd_valid && $rd != 5'b0;
	         $rf_wr_index[4:0] = $rd;
	         $rf_wr_data[31:0] = $result;
	         
	      @1
	         //Branch Instructions
	         $taken_branch = $is_beq ? ($src1_value == $src2_value):
	                         $is_bne ? ($src1_value != $src2_value):
	                         $is_blt ? (($src1_value < $src2_value) ^ ($src1_value[31] != $src2_value[31])):
	                         $is_bge ? (($src1_value >= $src2_value) ^ ($src1_value[31] != $src2_value[31])):
	                         $is_bltu ? ($src1_value < $src2_value):
	                         $is_bgeu ? ($src1_value >= $src2_value):
	                                    1'b0;
	         `BOGUS_USE($taken_branch)
	         $br_tgt_pc[31:0] = $pc + $imm;
	      // Note: Because of the magic we are using for visualisation, if visualisation is enabled below,
	      //       be sure to avoid having unassigned signals (which you might be using for random inputs)
	      //       other than those specifically expected in the labs. You'll get strange errors for these.
	
	   
	   // Assert these to end simulation (before Makerchip cycle limit).
	   *passed = *cyc_cnt > 40;
	   *failed = 1'b0;
	   
	   // Macro instantiations for:
	   //  o instruction memory
	   //  o register file
	   //  o data memory
	   //  o CPU visualization
	   |cpu
	      m4+imem(@1)    // Args: (read stage)
	      m4+rf(@1, @1)  // Args: (read stage, write stage) - if equal, no register bypass is required
	      //m4+dmem(@4)    // Args: (read/write stage)
	      //m4+myth_fpga(@0)  // Uncomment to run on fpga
	
	   m4+cpu_viz(@4)    // For visualisation, argument should be at least equal to the last stage of CPU logic. @4 would work for all labs.
	\SV
	   endmodule
```  


<img width="1625" alt="CPU_branch_Ins" src="https://github.com/user-attachments/assets/edd711ec-f8d5-4aa7-b72f-f08e02436536">     

	   

<img width="1628" alt="br_tgt_pc" src="https://github.com/user-attachments/assets/e16b21c8-22c3-48c7-9385-c4b9ceb00e75">    



## Final design of CPU:

   To test the code using the testbech include the line in @1 stage :

```   
	*passed = |cpu/xreg[10]>>5$value == (1+2+3+4+5+6+7+8+9) ;

```

<img width="1662" alt="final_simulation" src="https://github.com/user-attachments/assets/4ec047cb-56ed-4ae7-bf7f-6420a8bf3a73">

---------

## Day5- Complete Pipelined RISC-V CPU Micro-architecture:

**Hazards in Pipelinig**
Pipelining introduces certain hazards, which are situations that can potentially stall or disrupt the smooth execution of instructions. One of the most significant hazards is the "branch instruction hazard," also known as the "branch penalty."

Branch instructions are used to alter the sequence of instructions being executed by the processor. They allow the program to make decisions, such as jumping to a different section of code depending on a certain condition. Branch instructions introduce hazards in pipelining due to the fact that the outcome of the branch (taken or not taken) is often determined later in the pipeline than the fetch and decode stages.

There are three main types of branch hazards:

**Structural Hazard:** This occurs when there's a resource conflict in the pipeline. For instance, a branch instruction might need to access the same execution unit or memory stage as another instruction already in the pipeline. This leads to a pipeline stall while the resources are being reallocated or the conflict is resolved.

**Data Hazard:** Data hazards arise when instructions depend on the results of previous instructions, and the data needed for the current instruction is not yet available. This can lead to incorrect results if not handled properly. In the context of branch instructions, data hazards can occur when instructions following a branch instruction depend on the outcome of that branch, but the branch decision hasn't been made yet.

**Control Hazard (Branch Hazard)**: This is the primary concern when dealing with branch instructions in pipelining. It occurs due to the uncertainty of whether a branch will be taken or not taken. In a pipelined processor, instructions are fetched ahead of time, but the actual outcome of a branch might not be known until it reaches the execution stage. If the branch outcome is different from what was predicted, instructions fetched after the branch could be incorrect, leading to a need to flush, or discard, these incorrect instructions and restart from the correct point. This process is called "pipeline flushing" and results in a performance penalty, known as the "branch penalty."

To design the 5 stage Pipelined logic for the RISC-V processor, following steps were carried out:
1) A single stage logic is designed
2) A 3-cycle valid signal is created. There is an additional start signal which signifies the first high bit of valid signal. So valid is 0 for reset and 1 for start. 
   Otherwise, it is assigned the 3-cycle looped value.
3) A valid_taken_br signal is added to handle invalid cases. Accordingly, the PC mux is also modified.
4) Logic distribution across 5 pipeline stages is done.
5) Register File Bypass is introduced to handle data hazards and improve performance by allowing instructions to use the result of an operation before it has been written 
   back to the register file. A common hazard is Read After Write (RAW) Hazard which occurs when an instruction needs to read a register that is yet to be updated by a 
   previous instruction.
6) The branch instruction is updated to consider the 3-cycle value based on the non-existence of a valid signal in the previous two cycles. The PC is incremented every cycle.
7) The decode unit is updated with all RISC-V instructions. the ALU is also completed. The SLT(set less than) and SLTI( set less than immediate) share a common term with SLTIU( Set less than immediate unsigned) hence intermediate signals are used.
8) The load and store instructions are used to transfer data between memory and registers. These instructions are essential for handling data in programs, as they enable reading from and writing to memory locations.
9) The loading of data from memory is enabled by uncommenting the m4+dmem(@4) line. The interface signals are also connected.
10) The test program is modified to store the result in register r15.

## Final 5 Stage Pipelined Logic:

```
\m4_TLV_version 1d: tl-x.org
	\SV
	   // This code can be found in: https://github.com/stevehoover/RISC-V_MYTH_Workshop
	   
	   m4_include_lib(['https://raw.githubusercontent.com/BalaDhinesh/RISC-V_MYTH_Workshop/master/tlv_lib/risc-v_shell_lib.tlv'])
	
	\SV
	   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
	\TLV
	     
	   // /====================\
	   // | Sum 1 to 9 Program |
	   // \====================/
	   //
	   // Program for MYTH Workshop to test RV32I
	   // Add 1,2,3,...,9 (in that order).
	   //
	   // Regs:
	   //  r10 (a0): In: 0, Out: final sum
	   //  r12 (a2): 10
	   //  r13 (a3): 1..10
	   //  r14 (a4): Sum
	   // 
	   // External to function:
	   m4_asm(ADD, r10, r0, r0)             // Initialize r10 (a0) to 0.
	   // Function:
	   m4_asm(ADD, r14, r10, r0)            // Initialize sum register a4 with 0x0
	   m4_asm(ADDI, r12, r10, 1010)         // Store count of 10 in register a2.
	   m4_asm(ADD, r13, r10, r0)            // Initialize intermediate sum register a3 with 0
	   // Loop:
	   m4_asm(ADD, r14, r13, r14)           // Incremental addition
	   m4_asm(ADDI, r13, r13, 1)            // Increment intermediate register by 1
	   m4_asm(BLT, r13, r12, 1111111111000) // If a3 is less than a2, branch to label named <loop>
	   m4_asm(ADD, r10, r14, r0)            // Store final result to register a0 so that it can be read by main program
	   m4_asm(SW, r0, r10, 100)
	   m4_asm(LW, r15, r0, 100)
	   // Optional:
	   // m4_asm(JAL, r7, 00000000000000000000) // Done. Jump to itself (infinite loop). (Up to 20-bit signed immediate plus implicit 0 bit (unlike JALR) provides byte 	   address; last immediate bit should also be 0)
	   m4_define_hier(['M4_IMEM'], M4_NUM_INSTRS)
	   
	   $clk_pri = *clk;
	   
	   |cpu
	      @0
	         $reset = *reset;
	         //$start = !$reset && >>1$reset ;
	         
	         $pc[31:0] = >>1$reset ? 32'b0 :
	                     >>3$valid_taken_br ? >>3$br_tgt_pc :
	                     >>3$valid_load ? >>3$inc_pc : 
	                     (>>3$valid_jump && >>3$is_jal) ? >>3$br_tgt_pc :
	                     (>>3$valid_jump && >>3$is_jalr) ? >>3$jalr_tgt_pc :
	                     >>1$inc_pc;
	                     
	      @1
	         $inc_pc[31:0] = $pc + 32'd4;
	         $imem_rd_en = !(>>1$reset);
	         $imem_rd_addr[M4_IMEM_INDEX_CNT-1:0] = $pc[M4_IMEM_INDEX_CNT+1:2];
	         
	         $instr[31:0] = $imem_rd_data[31:0];
	            
	         //Instruction Type Decode
	         $is_i_instr = $instr[6:2] ==? 5'b0000x || 
	                       $instr[6:2] ==? 5'b001x0 || 
	                       $instr[6:2] ==? 5'b11001 ;
	         $is_r_instr = $instr[6:2] ==? 5'b011x0 || 
	                       $instr[6:2] ==? 5'b01011 || 
	                       $instr[6:2] ==? 5'b10100 ; 
	         $is_s_instr = $instr[6:2] ==? 5'b0100x ;
	         $is_b_instr = $instr[6:2] ==? 5'b11000 ;
	         $is_j_instr = $instr[6:2] ==? 5'b11011 ;
	         $is_u_instr = $instr[6:2] ==? 5'b0x101 ;
	         
	      //Extract Immediate bits
	         $imm[31:0] = $is_i_instr ? {{21{$instr[31]}}, $instr[30:20]} :
	                      $is_s_instr ? {{21{$instr[31]}}, $instr[30:25], $instr[11:7]} :
	                      $is_b_instr ? {{20{$instr[31]}}, $instr[7], $instr[30:25], $instr[11:8], 1'b0} :
	                      $is_u_instr ? {$instr[31:12], 12'b0} :
	                      $is_j_instr ? {{12{$instr[31]}}, $instr[19:12], $instr[20], $instr[30:21], 1'b0} :
	                                    32'b0;
	                                    
	         $opcode[6:0] = $instr[6:0];
	         
	         //function3 decode
	         $funct3_valid = $is_r_instr || $is_i_instr || $is_s_instr || $is_b_instr;
	         ?$funct3_valid
	            $funct3[2:0] = $instr[14:12];
	         
	         //function7 decode
	         $funct7_valid = $is_r_instr ;
	         ?$funct7_valid
	            $funct7[6:0] = $instr[31:25];
	            
	         //rs1/2_valid
	         $rs2_valid = $is_r_instr || $is_s_instr || $is_b_instr;
	         ?$rs2_valid
	            $rs2[4:0] = $instr[24:20];
	            
	         $rs1_valid = $is_r_instr || $is_i_instr || $is_s_instr || $is_b_instr;
	         ?$rs1_valid
	            $rs1[4:0] = $instr[19:15];
	            
	         $rd_valid = $is_r_instr || $is_i_instr || $is_u_instr || $is_j_instr;
	         ?$rd_valid
	            $rd[4:0] = $instr[11:7];
	            
	         $dec_bits[10:0] = {$funct7[5], $funct3, $opcode};
	         
	         // Branch Instruction
	         $is_beq = $dec_bits ==? 11'bx_000_1100011;
	         $is_bne = $dec_bits ==? 11'bx_001_1100011;
	         $is_blt = $dec_bits ==? 11'bx_100_1100011;
	         $is_bge = $dec_bits ==? 11'bx_101_1100011;
	         $is_bltu = $dec_bits ==? 11'bx_110_1100011;
	         $is_bgeu = $dec_bits ==? 11'bx_111_1100011;
	         
	         // Arithmetic Instruction
	         $is_add = $dec_bits ==? 11'b0_000_0110011;
	         $is_addi = $dec_bits ==? 11'bx_000_0010011;
	         $is_or = $dec_bits ==? 11'b0_110_0110011;
	         $is_ori = $dec_bits ==? 11'bx_110_0010011;
	         $is_xor = $dec_bits ==? 11'b0_100_0110011;
	         $is_xori = $dec_bits ==? 11'bx_100_0010011;
	         $is_and = $dec_bits ==? 11'b0_111_0110011;
	         $is_andi = $dec_bits ==? 11'bx_111_0010011;
	         $is_sub = $dec_bits ==? 11'b1_000_0110011;
	         $is_slti = $dec_bits ==? 11'bx_010_0010011;
	         $is_sltiu = $dec_bits ==? 11'bx_011_0010011;
	         $is_slli = $dec_bits ==? 11'b0_001_0010011;
	         $is_srli = $dec_bits ==? 11'b0_101_0010011;
	         $is_srai = $dec_bits ==? 11'b1_101_0010011;
	         $is_sll = $dec_bits ==? 11'b0_001_0110011;
	         $is_slt = $dec_bits ==? 11'b0_010_0110011;
	         $is_sltu = $dec_bits ==? 11'b0_011_0110011;
	         $is_srl = $dec_bits ==? 11'b0_101_0110011;
	         $is_sra = $dec_bits ==? 11'b1_101_0110011;
	         
	         // Load Instruction
	         $is_load = $dec_bits ==? 11'bx_xxx_0000011;
	         
	         // Store Instruction
	         $is_sb = $dec_bits ==? 11'bx_000_0100011;
	         $is_sh = $dec_bits ==? 11'bx_001_0100011;
	         $is_sw = $dec_bits ==? 11'bx_010_0100011;
	         
	         // Jump Instruction
	         $is_lui = $dec_bits ==? 11'bx_xxx_0110111;
	         $is_auipc = $dec_bits ==? 11'bx_xxx_0010111;
	         $is_jal = $dec_bits ==? 11'bx_xxx_1101111;
	         $is_jalr = $dec_bits ==? 11'bx_000_1100111;
	         $is_jump = $is_jal || $is_jalr ;
	         
	         //`BOGUS_USE($is_beq $is_bne $is_blt $is_bge $is_bltu $is_bgeu)
	         
	      @2
	         //Register file read
	         $rf_rd_en1 = $rs1_valid && >>2$result ;
	         $rf_rd_index1[4:0] = $rs1 ;
	         $rf_rd_en2 = $rs2_valid && >>2$result;
	         $rf_rd_index2[4:0] = $rs2 ;
	
	         
	         //O/P of read register assigned to input signals to ALU 
	         //Handling Data Hazards in Register File with Bypassing
	         
	         $src1_value[31:0] = (>>1$rf_wr_index == $rf_rd_index1) && >>1$rf_wr_en ?
	                             >>1$result :
	                             $rf_rd_data1;
	         $src2_value[31:0] = (>>1$rf_wr_index == $rf_rd_index2) && >>1$rf_wr_en ?
	                             >>1$result :
	                             $rf_rd_data2;
	         
	         //Update branch target PC
	         $br_tgt_pc[31:0] = $pc + $imm;
	         
	      @3
	         //jump target pc 
	         $jalr_tgt_pc[31:0] = $src1_value + $imm ;
	         
	         //Branch insturctions
	         $taken_br = $is_beq ? ($src1_value == $src2_value):
	                     $is_bne ? ($src1_value != $src2_value):
	                     $is_blt ? (($src1_value < $src2_value) ^ ($src1_value[31] != $src2_value[31])):
	                     $is_bge ? (($src1_value >= $src2_value) ^ ($src1_value[31]!= $src2_value[31])):
	                     $is_bltu ? ($src1_value > $src2_value) :
	                     $is_bgeu ? ($src1_value >= $src2_value) :
	                     1'b0 ;
	                     
	         //for invalid instruction
	         $valid_taken_br = $valid && $taken_br ;
	         
	         $valid = !(>>1$valid_taken_br || >>2$valid_taken_br || >>1$valid_load || >>2$valid_load 
	                  || >>1$valid_jump || >>2$valid_jump) ;
	                    
	         $valid_load = $valid && $is_load ;
	         $valid_jump = $valid && $is_jump ;
	         
	         //Register file write
	         $rf_wr_en = $rd_valid && $rd != 5'b0 && $valid || >>2$valid_load ;
	         $rf_wr_index[4:0] = >>2$valid_load ? >>2$rd : $rd ;
	         $rf_wr_data[31:0] = >>2$valid_load ? >>2$ld_data : $result ;
	         
	         
	         //ALU for the given code needs only addi and add instructions
	         $sltu_rslt[31:0] = $src1_value < $src2_value ;
	         $sltiu_rslt[31:0]  = $src1_value < $imm ;
	         
	         $result[31:0] =
	              $is_addi ? $src1_value + $imm :
	              $is_add ? $src1_value + $src2_value :
	              $is_andi ? $src1_value & $imm :
	              $is_ori  ? $src1_value | $imm :
	              $is_xori ? $src1_value ^ $imm :
	              $is_slli ? $src1_value << $imm[5:0] :
	              $is_srli ? $src1_value >> $imm[5:0] :
	              $is_and ? $src1_value & $src2_value :
	              $is_or ? $src1_value | $src2_value :
	              $is_xor ? $src1_value ^ $src2_value :
	              $is_sub ? $src1_value - $src2_value :
	              $is_sll ? $src1_value << $src2_value[4:0] :
	              $is_srl ? $src1_value >> $src2_value[4:0] :
	              $is_sltu ? $src1_value < $src2_value :
	              $is_sltiu ? $src1_value < $imm :
	              $is_lui ? {$imm[31:12], 12'b0} :
	              $is_auipc ? $pc + $imm : 
	              $is_jal ? $pc + 32'd4 :
	              $is_jalr ? $pc + 32'd4 :
	              $is_srai ? {{32{$src1_value[31]}}, $src1_value} >> $imm[4:0] :
	              $is_slt ? ($src1_value[31] == $src2_value[31]) ? $sltu_rslt : {31'b0, $src1_value[31]} :
	              $is_slti ? ($src1_value[31] == $imm[31]) ? $sltiu_rslt : {31'b0, $src1_value[31]} :
	              $is_sra ? {{32{$src1_value[31]}}, $src1_value} >> $src2_value[4:0] :
	              $is_load || $is_s_instr ? $src1_value + $imm :
	              32'bx ;
	         
	         //data memory interface:1-R/W memory             
	      @4
	         $dmem_wr_en = $is_s_instr && $valid ;
	         $dmem_addr[3:0] = $result[5:2] ;
	         $dmem_wr_data[31:0] = $src2_value ;
	         $dmem_rd_en = $is_load ;
	       
	      @5
	         //LOAD DATA from dmem
	         $ld_data[31:0] = $dmem_rd_data ;
	         
	   // Assert these to end simulation (before Makerchip cycle limit).
	   *passed = |cpu/xreg[15]>>5$value == (1+2+3+4+5+6+7+8+9) ;
	   *failed = 1'b0;

	   //Until instrutions are implemented, quiet down the warniongs
	   `BOGUS_USE($is_beq $is_bne $is_blt $is_bge $is_bltu $is_bgeu)
	   
	   |cpu
	      m4+imem(@1)    // Args: (read stage)
	      m4+rf(@2, @3)  // Args: (read stage, write stage) - if equal, no register bypass is required
	      m4+dmem(@4)    // Args: (read/write stage)
	   
	   m4+cpu_viz(@4)    // For visualisation, argument should be at least equal to the last stage of CPU logic. @4 would work for all labs.
	\SV
	   endmodule
	
```   

**customised clock signal clk_pri:**     

<img width="1478" alt="Screenshot 2024-08-21 at 4 16 55 PM" style="margin-bottom: 20px;" src="https://github.com/user-attachments/assets/94a50f38-6493-4bed-891c-88ccea8a2535">

**Reset Signal and the result output:**  

<img width="1609" alt="out_1" style="margin-bottom: 80px;" src="https://github.com/user-attachments/assets/eec22b43-67e8-4b56-8561-677e811f4861">   

 <br>

<img width="1557" alt="out2" style="margin-bottom: 80px;" src="https://github.com/user-attachments/assets/4f8254bf-3e77-447f-9d57-a123ab3b666b">   

**dmem write signal**   
	
<img width="1596" alt="Screenshot 2024-08-21 at 4 28 26 PM" src="https://github.com/user-attachments/assets/1ccc7dd8-c342-4009-a4da-ed2ffae638d6">


-----
## RISC-V pre-synthesis simulation using iverilog GTKwave

The RISC-V processor was designed and created by the TL-Verilog language in the Maketchip IDE. Now, we need a way to compile and transform it to the Verilog language for FPGA implementation. The sandpiper-saas compiler was used to do the job. The pre-synthesis simulation was carried out using the GTKWave simulkator.

**Step-by-Step process of simulation:**

1. Install the Required Packages:
```
sudo apt install make python python3 python3-pip git iverilog gtkwave docker.io
$ sudo chmod 666 /var/run/docker.sock
$ cd ~
$ pip3 install pyyaml click sandpiper-saas
```
2. Now we can clone this repository in an arbitrary directory (we'll choose home directory here):

```
$ cd ~
$ git clone https://github.com/manili/VSDBabySoC.git
```

![2](https://github.com/user-attachments/assets/59bbcabb-2ca7-4094-a8fd-712ef9c3821b)


3. Replace the .tlv file in the VSDBabySoC/src/module folder with our RISC-V design .tlv file which we want to convert into verilog

```
$ cd VSDBabySoC
```
4. Translate .tlv definition of RISC-V into .v definition.

```
$ sandpiper-saas -i ./src/module/*.tlv -o rvmyth.v --bestsv --noline -p verilog --outdir ./src/module/
```

5. Compile and simulate RISC-V design.
```
$ iverilog -o output/pre_synth_sim.out -DPRE_SYNTH_SIM src/module/testbench.v -I src/include -I src/module -
```

6. The result of the simulation (i.e. pre_synth_sim.vcd) will be stored in the output/pre_synth_sim directory.
```
$ cd output
$ ./pre_synth_sim.out
```

 7. To open the .vcd simulation file through GTKWave simulation tool
    
```
$ gtkwave pre_synth_sim.vcd
```

<img width="1318" alt="Screenshot 2024-08-25 at 6 16 38 PM" src="https://github.com/user-attachments/assets/21b96dac-1a00-4616-9831-645e90b8ceed">

The verilog testbench code for the pre-synthesis simulation of the RISC-V verilog code is given below:

![TB](https://github.com/user-attachments/assets/a401e644-8bfa-4d39-99d7-6ba4099e05b4)

**Pre-synthesis Simulation results:**
Signals to note are the following:
a. clk_pri: This is the clock input to the RISC-V core. 
b. reset: This is the input reset signal to the RISC-V core. 
c. OUT[9:0]: This is the 10-bit output [9:0] OUT port of the RISC-V core. This port comes from the RISC-V register #15, originally.

**GTKWave Simulation waveforms:**
1. clk_pri and reset signals
   
![clk_reset](https://github.com/user-attachments/assets/8b1b6e5d-e321-4942-b8de-270cb85d2df6)

   <br>
2. Sum output of 1+2+3

![out1_ed](https://github.com/user-attachments/assets/76a1c5d1-cc01-4b85-8b6e-f44cca85753b)

   <br>
3. Sum output till (1+2+3) +4+5+6

![out2_ed](https://github.com/user-attachments/assets/6aed5b1a-e78f-4c85-9368-dceef087abe1)

   <br>
5. Sum output of 1+2+3+4+5+6+7+8+9

![out3_ed](https://github.com/user-attachments/assets/36bb106e-edd2-40c9-a0f0-86753b506385)

   <br>
6. 10- bit output result of RISC-V processor

![10bit_out_ed](https://github.com/user-attachments/assets/beaca0aa-74af-49a2-a038-8072ca44a43d)


**Makerchip IDE simulation results for comparison**
1. <img width="1478" alt="Screenshot 2024-08-21 at 4 16 55 PM" style="margin-bottom: 20px;" src="https://github.com/user-attachments/assets/94a50f38-6493-4bed-891c-88ccea8a2535">

   <br>
   
2. <img width="1609" alt="out_1" style="margin-bottom: 80px;" src="https://github.com/user-attachments/assets/eec22b43-67e8-4b56-8561-677e811f4861">   

   <br>

3. <img width="1557" alt="out2" style="margin-bottom: 80px;" src="https://github.com/user-attachments/assets/4f8254bf-3e77-447f-9d57-a123ab3b666b">   

-------------

## BabySoc Pre-synthesis simulation using iverilog GTKwave

**Task1: Software Installation: Install iverilog, GTKwave, Yosys and OpenSTA on our personal machines.**
--------
**OpenSTA:**
   
OpenSTA is a gate level static timing verifier. As a stand-alone executable it can be used to verify the timing of a design using standard file formats such as Verilog netlist, Liberty library, SDC timing constraints, SDF delay annotation and SPEF parasitics. OpenSTA uses a TCL command interpreter to read the design, specify timing constraints and print timing reports.
**Steps to install OpenSTA**
a. Install the dependencies using the command shown below-
```
sudo apt-get install cmake clang gcc tcl swig bison flex
```

b. Use the following command to install OpenSTA
```
git clone https://github.com/The-OpenROAD-Project/OpenSTA.git
cd OpenSTA
mkdir build
cd build
cmake ..
make
sudo make install
```
![Pasted image 12](https://github.com/user-attachments/assets/a1b90840-fd54-46e0-a4ca-f54ceb12f370)

   
**Yosys:**

Yosys is a framework for Verilog RTL synthesis. It currently has extensive Verilog-2005 support and provides a basic set of synthesis algorithms for various application domains. Selected features and typical applications:
	a. Process almost any synthesizable Verilog-2005 design
	b. Converting Verilog to BLIF / EDIF/ BTOR / SMT-LIB / simple RTL Verilog / etc.
	c. Built-in formal methods for checking properties and equivalence
	d. Mapping to ASIC standard cell libraries (in Liberty File Format)
	e. Mapping to Xilinx 7-Series and Lattice iCE40 and ECP5 FPGAs
	f. Foundation and/or front-end for custom flows

Yosys can be adapted to perform any synthesis job by combining the existing passes (algorithms) using synthesis scripts and adding additional passes as needed by extending the Yosys C++ code base. Yosys also serves as backend for several tools that use formal methods to reason about designs, such as sby for SMT-solver-based formal property checking or mcy for evaluating the quality of testbenches with mutation coverage metrics. Yosys is free software licensed under the ISC license (a GPL compatible license that is similar in terms to the MIT license or the 2-clause BSD license).

**Steps to install Yosys**:
```
sudo apt-get update
 git clone https://github.com/YosysHQ/yosys.git
 cd yosys
 sudo apt install make (If make is not installed please install it) 
 sudo apt-get install build-essential clang bison flex \
    libreadline-dev gawk tcl-dev libffi-dev git \
    graphviz xdot pkg-config python3 libboost-system-dev \
    libboost-python-dev libboost-filesystem-dev zlib1g-dev
 make config-gcc
 make 
 sudo make install
```

![Pasted image 10](https://github.com/user-attachments/assets/bfaa7777-24a2-4bee-b55d-92e34135500c)

**iverilog:**

Icarus Verilog (iverilog) is an implementation of the Verilog hardware description language compiler that generates netlists in the desired format (EDIF). It supports the 1995, 2001 and 2005 versions of the standard, portions of SystemVerilog, and some extensions.Icarus Verilog is released under the GNU General Public License, Icarus Verilog is free software. Icarus is composed of a Verilog compiler (including a Verilog preprocessor) with support for plug-in backends, and a virtual machine that simulates the design.

**Steps to install iverilog**
```
sudo apt-get install iverilog
```

![Pasted image 8](https://github.com/user-attachments/assets/3a0d2a38-ad7a-459d-ad66-cb86d9eb50e4)

**GTKwave:**

GTKWave is a fully featured GTK+ based wave viewer for Unix and Win32 which reads LXT, LXT2, VZT, FST, and GHW files as well as standard Verilog VCD/EVCD files and allows their viewing.

**Steps to install GTKwave**:
```
sudo apt install gtkwave
```

![GTKwave](https://github.com/user-attachments/assets/5eb38340-092c-4b4a-8b3e-d8608e2e7006)
-----

**Task2:** Download all the files from the VSDBabySoc project from the given github link: https://github.com/manili/VSDBabySoC.git
--------
VSDBabySoC is a small yet powerful RISCV-based SoC. The main purpose of designing such a small SoC is to test three open-source IP cores together for the first time and calibrate the analog part of it. VSDBabySoC contains one RVMYTH microprocessor, an 8x-PLL to generate a stable clock, and a 10-bit DAC to communicate with other analog devices.

![babysoc](https://github.com/user-attachments/assets/f4f7b91f-9d7c-4dbe-bb2c-77bc2d964d50)

**What is RVMYTH?**

RVMYTH core is a simple RISCV-based CPU, introduced in Lab6 and Lab7. In lab 6,  a risc-v processor was created from scratch using the TLV for faster development. The main task of the processor is to add numbers from 1 to 9 and generate the sum output.

**What is AVSDPLL?**

A phase-locked loop or PLL is a control system that generates an output signal whose phase is related to the phase of an input signal. PLLs are widely used for synchronization purposes, including clock generation and distribution. In this Soc project, the PLL will generate the clock for the rvmyth core.

**What is AVSDDAC?**
A digital-to-analog converter or DAC is a system that converts a digital signal into an analog signal. DACs are widely used in modern communication systems enabling the generation of digitally-defined transmission signals. As a result, high-speed DACs are used for mobile communications and ultra-high-speed DACs are employed in optical communications systems. The DAC module will that the 10 bit digital output from the rvmyth core and generate the corresponding analog output signal 'OUT'.

All the the files relevant for the VSDBabySoC simulation, including RVMYTH.tlv, pll.v and dac.v, were downloaded from the reference repository using the following commands
```
$ cd ~
$ git clone https://github.com/manili/VSDBabySoC.git
```
------
**Task3:** **Edit the VSDBabySoC top level so that it links to my rvmyth code and produce the output for that.**

The RVMYTH.tlv file in the cloned VSDBabySoC folder was replaced by my rvmyth.tlv file. The .tlv file was converted into verilog file using sandpiper-saas. The top module VSDBabySoC was modified to include my rvmyth.v file. The step by step modeling walkthrough is given below.

1. Installation of some important packages:
```
sudo apt install make python python3 python3-pip git iverilog gtkwave
cd ~
sudo apt-get install python3-venv
python3 -m venv .venv
source ~/.venv/bin/activate
pip3 install pyyaml click sandpiper-saas
```

2. Cloning the VSDBabySoC repository:
```
git clone https://github.com/manili/VSDBabySoC.git
```

3. Creating the pre_synthesis.vcd simulation file
```
cd VSDBabySoC
sandpiper-saas -i ./src/module/*.tlv -o rvmyth.v --bestsv --noline -p verilog --outdir ./src/module/

mkdir output
iverilog -o output/pre_synth_sim.out -DPRE_SYNTH_SIM src/module/testbench.v -I src/include -I src/module

cd output
./pre_synth_sim.out
```
![Pasted image](https://github.com/user-attachments/assets/0ef62303-8488-47a8-8a6c-6608693b6b4b)

4. opening simulation waveforms in GTKwave
```
gtkwave pre_synth_sim.vcd
```
![Pasted image 9](https://github.com/user-attachments/assets/b330f6a4-2e87-493a-9584-f0e37818827b)

-----
**Task4: Generating the output waveforms**
The toplevel module VSDBabySoC.v verilog code was updated to include my rvmyth.v file. The verilog code is given below.
```
module vsdbabysoc (
   output wire OUT,
   //
   input  wire reset,
   //
   input  wire VCO_IN,
   input  wire ENb_CP,
   input  wire ENb_VCO,
   input  wire REF,
   //
   // input  wire VREFL,
   input  wire VREFH
);

   wire clk_pri;
   wire [9:0] RV_TO_DAC;

   rvmyth core_pri(
      .OUT(RV_TO_DAC),
      .clk_pri(clk_pri),
      .reset(reset)
   );

   avsdpll pll (
      .CLK(clk_pri),
      .VCO_IN(VCO_IN),
      .ENb_CP(ENb_CP),
      .ENb_VCO(ENb_VCO),
      .REF(REF)
   );

   avsddac dac (
      .OUT(OUT),
      .D(RV_TO_DAC),
      // .VREFL(VREFL),
      .VREFH(VREFH)
   );
   
endmodule
```

The output waveforms are given below:

**1. clk and reset signals**
   ![Pasted image 7](https://github.com/user-attachments/assets/8f333775-7e73-481f-9a38-5d4e076ecb7a)
------

**2. PLL clock input and output signals**

   ![Pasted image 11](https://github.com/user-attachments/assets/db2ce619-9231-4105-b1c1-005a77b52cb9)
-----

**3. rvmyth sum output signal**

   ![Pasted image 3](https://github.com/user-attachments/assets/9a4d9c3b-be66-49a8-a72e-67f8e3dbf876)
-----
   ![Pasted image 4](https://github.com/user-attachments/assets/599a634a-f4aa-4877-8373-a385652b2c25)
----
   ![Pasted image 5](https://github.com/user-attachments/assets/d806cca1-6664-4689-98ba-96863a0388a7)
-----

**4. DAC output signal**

   ![Pasted image 6](https://github.com/user-attachments/assets/95f782cf-61e9-4ac3-9ab1-f0fd96d57dba)
----

**5. Proof of authenticity:**

   
   ![Pasted image 2](https://github.com/user-attachments/assets/72a1e25c-1111-4749-b7b3-dc50beed8d34)

------
## RTL Design with Verilog using SKY130 Technology - Workshop:

## **Software Installations**

**a) YOSYS**

Yosys is a framework for Verilog RTL synthesis. It currently has extensive Verilog-2005 support and provides a basic set of synthesis algorithms for various application domains. Selected features and typical applications:
i) 	Process almost any synthesizable Verilog-2005 design
ii) 	Converting Verilog to BLIF / EDIF/ BTOR / SMT-LIB / simple RTL Verilog / etc.
iii)	Built-in formal methods for checking properties and equivalence
iv)	Mapping to ASIC standard cell libraries (in Liberty File Format)
v)	Mapping to Xilinx 7-Series and Lattice iCE40 and ECP5 FPGAs
vi)	Foundation and/or front-end for custom flows

Yosys can be adapted to perform any synthesis job by combining the existing passes (algorithms) using synthesis scripts and adding additional passes as needed by extending the Yosys C++ code base. Yosys also serves as backend for several tools that use formal methods to reason about designs, such as sby for SMT-solver-based formal property checking or mcy for evaluating the quality of testbenches with mutation coverage metrics. Yosys is free software licensed under the ISC license (a GPL compatible license that is similar in terms to the MIT license or the 2-clause BSD license).

**Installation Steps:**
```
git clone https://github.com/YosysHQ/yosys.git
cd yosys 
sudo apt install make
sudo apt-get install build-essential clang bison flex \
    libreadline-dev gawk tcl-dev libffi-dev git \
    graphviz xdot pkg-config python3 libboost-system-dev \
    libboost-python-dev libboost-filesystem-dev zlib1g-dev
make config-gcc
make 
sudo make install
```
![yosys](https://github.com/user-attachments/assets/8f933b66-fc8e-4be6-92b6-29a06d718b2f)

**b) ICARUS Verilog**

Icarus Verilog is an implementation of the Verilog hardware description language compiler that generates netlists in the desired format (EDIF). It supports the 1995, 2001 and 2005 versions of the standard, portions of SystemVerilog, and some extensions.Icarus Verilog is released under the GNU General Public License, Icarus Verilog is free software. Icarus is composed of a Verilog compiler (including a Verilog preprocessor) with support for plug-in backends, and a virtual machine that simulates the design.

**Installation Steps:**
```
sudo apt-get install iverilog
```

![iverilog](https://github.com/user-attachments/assets/40163d0f-0695-4340-9a0a-b228657ed598)


**c) GTKwave:**

GTKWave is a fully featured GTK+ based wave viewer for Unix and Win32 which reads LXT, LXT2, VZT, FST, and GHW files as well as standard Verilog VCD/EVCD files and allows their viewing.

**Installion Steps:**
```
sudo apt install gtkwave
```

![gtkwave](https://github.com/user-attachments/assets/52cd998a-91f3-4904-84f6-74f572c7f0fd)


**d) NGSPICE:**

ngspice is the open source spice simulator for electric and electronic circuits comprising of JFETs, bipolar and MOS transistors, passive elements like R, L, or C, diodes, transmission lines and other devices, all interconnected in a netlist. Digital circuits are simulated as well, event driven and fast, from single gates to complex circuits. And you may enter the combination of both analog and digital as a mixed-signal circuit. ngspice offers a wealth of device models for active, passive, analog, and digital elements. Model parameters are provided by our collections, by the semiconductor device manufacturers, or from semiconductor foundries. The user can add their circuits as a netlist, and the output is one or more graphs of currents, voltages and other electrical quantities or is saved in a data file.

**Installation Steps:**

```
# Dependency for ngspice:
sudo apt-get install build-essential
sudo apt-get install libxaw7-dev

# ngspice installation:
wget https://sourceforge.net/projects/ngspice/files/ngspice-40.tar.gz
tar -zxvf ngspice-40.tar.gz
cd ngspice-40
mkdir release
cd release
sudo apt install automake libtool libxaw7-dev flex bison libncurses5-dev
../configure  --with-x --with-readline=yes --disable-debug
make
sudo make install
```

![ngspice](https://github.com/user-attachments/assets/cd3c123a-7f59-4ff7-832c-3e0e4f81cefa)

**e) OPENSTA:**
OpenSTA is a gate level static timing verifier. As a stand-alone executable it can be used to verify the timing of a design using standard file formats such as Verilog netlist, Liberty library, SDC timing constraints, SDF delay annotation and SPEF parasitics. OpenSTA uses a TCL command interpreter to read the design, specify timing constraints and print timing reports.

**Installation Steps:**
Prior to the installation of the OpenSTA install the dependencies using the command shown below :
```
sudo apt-get install cmake clang gcc tcl swig bison flex
```

After installing the dependencies use the following command to install OpenSTA:
```
git clone https://github.com/The-OpenROAD-Project/OpenSTA.git
cd OpenSTA
mkdir build
cd build
cmake ..
make
sudo make install
```

![sta](https://github.com/user-attachments/assets/aecdbcad-f566-4447-a583-9e70b14ddc8b)

**f) MAGIC:**
Magic is an electronic design automation (EDA) layout tool for very-large-scale integration (VLSI) integrated circuit (IC) originally written by John Ousterhout and his graduate students at UC Berkeley. Work began on the project in February 1983. The main difference between Magic and other VLSI design tools is its use of "corner-stitched" geometry, in which all layout is represented as a stack of planes, and each plane consists entirely of "tiles" (rectangles). Magic is primarily famous for writing the scripting interpreter language Tcl.

**Installation Steps:**

```
sudo apt-get install m4
sudo apt-get install tcsh
sudo apt-get install csh
sudo apt-get install libx11-dev
sudo apt-get install tcl-dev tk-dev
sudo apt-get install libcairo2-dev
sudo apt-get install mesa-common-dev libglu1-mesa-dev
sudo apt-get install libncurses-dev
git clone https://github.com/RTimothyEdwards/magic
cd magic-master
./configure
make
make install
sudo apt install magic
```

![magic](https://github.com/user-attachments/assets/6113f1c7-0443-483c-82ca-57fb05545485)


-----


## Day1- Introduction to Verilog RTL Design and Synthesis

**Overview**

This session is about steps followed to compile and simulate verilog design and testbench codes using iverilog tool. This section also deals with graphical waveform viewer tool called gtkwave and synthesis tool called yosys and its steps to produce netlist from design file.

**Steps followed to copy the lab example files**
```
mkdir PD
cd PD
git clone https://github.com/kunalg123/vsdflow.git
git clone https://github.com/kunalg123/sky130RTLDesignAndSynthesisWorkshop.git
```
Command to view the folder structure of the lab, and list the contents of the directory:
```
cd PD/sky130RTLDesignAndSynthesisWorkshop/
ls -R
```
![all_files_ls_r](https://github.com/user-attachments/assets/17f9e210-847f-4da3-8324-dc78e6d57ff5)
------
Standard cell library - It is a collection of well defined and appropriately characterized logic gates that can be used to implement a digital design. Timing data of standard cells is provided in the Liberty format.

The lib directory contains the library file sky130_fd_sc_hd__tt_025C_1v80.lib. Libraries in the SKY130 PDK are named using the following scheme:
<Process_name><Library_Source_Abbreviation><Library_type_abbreviation>[_<Library_name]

sky130 - Process Technology of the PDK sky130
fd - SkyWater Foundry
sc - Digital standard cells
hd - High density
tt - Typical Timing
025C - 25 degree celsius Temperature
1v80 - 1.8V Supply Voltage

-----

## **Demostration of the I-Verilog and GTKWave**

This session takes an example of 2x1 multiplexer (verilog design and test bench) to demonstrate iverilog compilation and gtkwave waveform viewer.

Change the current working directory to the directory containing the Verilog files using the following command :
```
cd /PD/sky130RTLDesignAndSynthesisWorkshop/verilog_files
```

Simulate the RTL design and testbench in i-verilog using the following command:
```
iverilog good_mux.v tb_good_mux.v 
```

The above command will compile and check for the syntax errors in both the design and testbench. Upon compiling successfully it will generate an executable file a.out.

Execute the a.out using the command ./a.out , resulting in the generation of a tb_good_mux.vcd file that captures changes in the input and output values. This vcd file is given as the input to the GTKWave to view the wave form. In GTKWave drag and drop the required input and output signals to view the waveform. Since the simulation is done for long amount of time use the zoom to fit option to view the entire waveform.

Commands to execute to view the waveform :
```
./a.out
gtkwave tb_good_mux.vcd

```
![gtkwave_mux](https://github.com/user-attachments/assets/42476bfc-37ae-4e6d-9c31-d1c0d9bcfb68)

To view the contents of the verilog files good_mux.v and tb_good_mux.v use the following command:
```
gvim -o good_mux.v tb_good_mux.v # -o is to open multiple windows at a time.
```

![read_files](https://github.com/user-attachments/assets/d9c21def-4125-490f-9232-463770ec8631)

--------
## **Introduction to Synthesizer**

Synthesis is the process that converts RTL into a technology-specific gate-level netlist, optimized for a set of pre-defined constraints.Synthesizer is a tool used to convert the RTL from the netlist. Yosys is one such open source synthesizer. A netlist is a file that represents the gates and flip-flops required to implement the design in hardware and the ineterconnections between them which is a result of the synthesis process. Yosys is provided with both the design and its corresponding .lib file, and its task is to generate the netlist. The netlist generated is a depiction of the input design provided to Yosys, contructed using the standard cells available in the .lib file. To validate the synthesis output, the netlist is verified in a manner analogous to how the RTL design is verified. This involves using the same testbench and stimulus set to confirm that the outcomes obtained from the netlist correspond to those acquired when using the RTL design. The block diagram representation of the yosys flow and the netlist verification is shown below:

![yosys_flow](https://github.com/user-attachments/assets/c9b4b3f3-c34d-4726-b7a6-b09b206cc09d)


**Yosys Illustration:**

This section explains the concept of yosys library cells and process of generating netlist using yosys tool. The library contains variety of cells with various operating speeds for different applications and avoid violations.

Following represents various commands used to generate netlist for given design.

```
yosys> read_liberty -lib /PD/sky130RTLDesignAndSynthesisWorkshop/lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
yosys> read_verilog good_mux.v
yosys> synth -top good_mux
yosys> abc -liberty /PD/sky130RTLDesignAndSynthesisWorkshop/lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
yosys> show
yosys> write_verilog good_mux_netlist.v
yosys> write_verilog -noattr good_mux_netlist.v
```

**read_liberty -** Read cells from liberty file as modules into current design. The -lib switch creates empty blackbox modules.

**read_verilog -** Loads modules from verilog file to the current design.

**synth -** command runs the default synthesis script. The -top switch use the specified module as top module.

**abc -** This command uses the ABC tool for technology mapping of yosys's internal gate library to a target architecture. The -lib switch liberty generate netlists for the specified cell library using the liberty file format.

**show -** Creates a graphviz DOT file for the selected part of the design and compile it to a graphics file. It generates a schematic.

**write_verilog -** Writes the current design to a Verilog file. The *-noattr switch skips the attributes from included in the output netlist.


The synthesized design of the mux:

![good_mux_schematic](https://github.com/user-attachments/assets/9745ec9c-54de-4fac-bbb8-bf3739dbcd83)

The netlist generated by yosys tool for given design is shown below:

![good_mux_netlist](https://github.com/user-attachments/assets/5bba7894-98a6-4be8-af19-3769e996f68b)


-----
## Day2- Timing Libs, Hierarchical vs Flat Synthesis, efficient Flop coding styles
This section describes basic understanding of lib technology file and its important aspects. It also explains hierarchy and flat synthesis implementation of multiple modules.

## **Hiererchical Synthesis and Flat Synthesis:**

Hierarchical synthesis is breaking a complex modules into smaller, more manageable sub-modules or blocks. Each of these sub-modules can be synthesized or designed independently before being integrated into the larger system. This approach allows for efficient design, optimization, and verification of individual components while maintaining a structured and organized design process. An illustration of the hierarchical synthesis is shown below :

Consider the verilog file multiple module which is given in the verilog_files directory
```
module sub_module2 (input a, input b, output y);
   assign y = a | b;
endmodule

module sub_module1 (input a, input b, output y);
   assign y = a&b;
endmodule


module multiple_modules (input a, input b, input c , output y);
   wire net1;
   sub_module1 u1(.a(a),.b(b),.y(net1));  //net1 = a&b
   sub_module2 u2(.a(net1),.b(c),.y(y));  //y = net1|c ,ie y = a&b + c;
endmodule
```

In this case the module multiple_modules iinstantiates two sub_modules where the sub_module1 implements the AND gate and sub_module2 implemets the OR gate which are integrated in the multiple_modules. Synthesis the multiple module using the sollowing commands:

```
cd /PD/sky130RTLDesignAndSynthesisWorkshop/verilog_files
yosys
read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
read_verilog 
read_verilog multiple_modules.v 
synth -top multiple_modules
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
show multiple_modules
write_verilog multiple_modules_hier.v
```
----
**Note:**
When using hierarchical design instead of enetering the show command to view the file show <module_name> must be otherwise yosys will generate the following error : "ERROR: For formats different than 'ps' or 'dot' only one module must be selected."

-----
![multiple_modules_yosys_heirarchical](https://github.com/user-attachments/assets/723a2030-7d67-43ad-9f40-2dd20966f772)

Flattening the hierarchy means simplifying the hierarchical structure of a design by collapsing or merging lower-level modules or blocks into a single, unified representation. In yosys the flattening can be done with flat command. Yosys illustration of flattening the hiererchy.

```
 cd /PD/sky130RTLDesignAndSynthesisWorkshop/verilog_files
 yosys
 read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
 read_verilog 
 read_verilog multiple_modules.v 
 synth -top multiple_modules
 abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
 flatten
 show
 write_verilog multiple_modules_flat.v
```

![multiple_module_flatten_yosys](https://github.com/user-attachments/assets/63ffe010-d984-4611-b130-691642eb2d06)

The flatten command breaks the hierarchy and makes the design into a single module by creating AND and OR gates for the logics inferred by the submodule which is shown in the image below.

![netlist_hier_flat](https://github.com/user-attachments/assets/839f4035-b8ab-4704-b71f-0fcfb587fd4a)

## **Synthesising a Submodule :**

Suppose a multiplier design needs to be used in numerous instances. Rather than undergoing synthesis six times independently, the preferred approach is to synthesize it once and then duplicate it within the primary module. Using module-level synthesis becomes advantageous when dealing with multiple occurrences of identical modules. Another reason for synthesizing submodule is to follow the principle of divide and conque for extensive designs that may not be optimized effectively, synthesizing the design module by module ensures that each module is effectively optimized.

**Steps to synthesis submodule :**

```
cd /PD/sky130RTLDesignAndSynthesisWorkshop/verilog_files
yosys
read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
read_verilog multiple_modules.v 
synth -top sub_module
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
show
```

![submodule1_yosys](https://github.com/user-attachments/assets/92e33d83-9c57-4f9e-968f-bbce61ad8921)

![submodule2_yosys](https://github.com/user-attachments/assets/30ba7398-dc3b-48d5-a34e-6881d638a9c5)

We prefer to synthesize submodules separately due to various reasons such as inefficient synthesis carried out if done with entire module, if design contains replica of sub modules, we would like to synthesize once and combine together in main module.

## **Flip-FLops:**

A flip-flop is a fundamental sequential synchronous electronic circuit that is capable of storing information. A single flip-flop can store 1- bit of information and several flip-flops can be grouped together to form registers and memory that can store multiple bits of information. There are several types of flip-flops like JK flip-flop, D flip-flop, T flip-flop and SR flip-flop but D flip-flop is widely and most commanly used since it transmits the input data to the output without performing any modifications. A D flop-flop needs two inputs : data and clock. The flip-flop can be positive-edge triggered or negative-edge triggered i.e, the output makes transition during the rising edge of the clock pulse if it is positive-edge triggered and if the output makes transition during the falling edge of the clock pulse then it is said to be negative- edge triggered.

**Steps to simulate and generate the netlist for the below designs**

Simulation steps :

```
iverilog <rtl_name.v> <tb_name.v>
./a.out
gtkwave <dump_file_name.vcd>
```

Generating netlist steps :
```
yosys
read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib  
read_verilog <module_name.v> 
synth -top <top_module_name>
dfflibmap -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
show
write_verilog -noattr <netlist_name.v>
```
------
Note:
dfflibmap - technology mapping of flip-flops
dfflibmap -liberty - Maps internal flip-flop cells to the flip-flop cells in the technology library specified in the given liberty file.

Generally in the flow there will be a separate .lib file for the flip-flops which needs to be used with the dfflibmap command.

-----
**llustration of Different types of Flip-flop**

1. D flip-flop with Synchronous reset
   
A D flip-flop with synchronous reset combines the functionality of a D flip-flop with the ability to reset its state synchronously. This means that the flip-flop's stored value can be reset to 0 or low state based on a clock signal and a reset input, ensuring that the reset operation occurs when the clock signal transits. The verilog code, simulation and synthesis results are shown below:

Verilog code:
```
module dff_syncres ( input clk , input async_reset , input sync_reset , input d , output reg q );
always @ (posedge clk )
begin
	if (sync_reset)
		q <= 1'b0;
	else	
		q <= d;
end
endmodule
```

Simulation Waveform:

![dff_syncres_gtk](https://github.com/user-attachments/assets/8d8343ec-1768-455e-b784-5dc4b57773fe)

Synthesized Design:

![dff_syncres_yosys](https://github.com/user-attachments/assets/08598eda-7594-4319-8a8b-66186b713726)


2. D flip-flop with Asynchronous reset:
   
A D flip-flop with asynchronous reset combines the functionality of a D flip-flop with the ability to reset its state asynchronously. This means that the flip-flop's stored value can be reset to 0 or low state regardless of the clock signal's state. The verilog code, simulation and synthesis results are shown below:

```
module dff_asyncres ( input clk ,  input async_reset , input d , output reg q );
always @ (posedge clk , posedge async_reset)
begin
	if(async_reset)
		q <= 1'b0;
	else	
		q <= d;
end
endmodule
```

Simulation Waveform:

![dff_asynres_gtkwave](https://github.com/user-attachments/assets/53fd89f5-51b9-4761-85a0-3bb6519c143d)

Synthesized Design:

![dff_asyncres_yosys](https://github.com/user-attachments/assets/1b8bd064-3926-42a4-9954-821a2924e308)


3. D flip-flop with Asynchronous set
   
A D flip-flop with asynchronous set combines the functionality of a D flip-flop with the ability to set its state asynchronously. This means that the flip-flop's stored value can be set to 1 or high state regardless of the clock signal's state. The verilog code, simulation and synthesis results are shown below:

```
module dff_async_set ( input clk ,  input async_set , input d , output reg q );
always @ (posedge clk , posedge async_set)
begin
	if(async_set)
		q <= 1'b1;
	else	
		q <= d;
end
endmodule
```

Simulation Waveform:

![dff_async_set_gtk](https://github.com/user-attachments/assets/d445955d-db62-4e5d-989e-b4f84a7fd444)

Synthesized Design:

![dff_async_set_yosys](https://github.com/user-attachments/assets/f44f1991-ec3a-4b7d-914e-196745fba1ce)


4. D flip-flop with Asynchronous and Synchronous reset
   
A D flip-flop with both asynchronous and synchronous reset that combines the features of a D flip-flop with the ability to reset its state using either an asynchronous reset input or a synchronous reset input. This provides flexibility in resetting the flip-flop's state under different conditions.

```
module dff_asyncres_syncres ( input clk , input async_reset , input sync_reset , input d , output reg q );
always @ (posedge clk , posedge async_reset)
begin
	if(async_reset)
		q <= 1'b0;
	else if (sync_reset)
		q <= 1'b0;
	else	
		q <= d;
end
endmodule
```

Simulation Waveform

![dff_asyncres_syncres_gtk](https://github.com/user-attachments/assets/57cab6d3-f0eb-4ed7-a513-bf017c4b8d6e)

Synthesized Design

![dff_asyncres_syncres_yosys](https://github.com/user-attachments/assets/d339f5e9-05ca-4d8d-8ae1-dc3ca6646845)

## **Optimizations:**

During synthesis yosys will perform optimisations based on the logic that is being designed. An illustration of the yosys optimization is given below:

**1. Example 1**

Consider the verilog design given below:

```
module mul2 (input [2:0] a, output [3:0] y);
	assign y = a * 2;
endmodule
```

This code performs multiplication of the input number by 2. If we see the truth table, the output 3 MSB bits follow the input a and the LSB bit is appended with '0' i.e. y0 is always 0 and the code doesn't need any hardware and it only needs the proper wiring of the input bits to the output and grounding the bit y0. The schematic and netlist of the design is shown below:

![mult2_yosys_pic](https://github.com/user-attachments/assets/0ba724ec-e020-4c9c-84f7-94cc8575722d)


![mult2_netlist](https://github.com/user-attachments/assets/bd9a16b0-9523-4a36-ab77-610292ddd262)


**2. Example 2:**

Consider the verilog design given below:

```
module mult8 (input [2:0] a , output [5:0] y);
	assign y = a * 9;
endmodule

```

In this design the 3-bit input number "a" is multiplied by 9 i.e.,(a*9) which can be re-written as (a*8) + a . The term (a*8) is a left shifting the number a by three bits. Consider that a = a2 a1 a0. (a*8) results in a2 a1 a0 0 0 0. (a*9)=(a*8)+a = a2 a1 a0 a2 a1 a0 = aa(in 6 bit format). Hence in this case no hardware realization is required. The synthesized netlist of this design is shown below:


![mult8_yosys](https://github.com/user-attachments/assets/5448cbcc-856e-460a-94f7-06e514fc9142)


![mult_8_net](https://github.com/user-attachments/assets/e9a782ba-38eb-4b69-8373-571e175f1f01)


------
## **Day3- Combinational and Sequential Optimizations**

**Introduction to optimization**
Optimization plays an important role in designing any hardware. It reduces number of components which inturn reduces size and improves performance. Many times, we come across an expression which by simplification reduces to a either simple variable or a constant value through reduction of unsued variables.

**Combinational Optimisations**

The techniques used for optimising the combinational Circuits are as follows:

    1. Constant Propagation (Direct Optimisation)
    2. Boolean Logic Optimisation (using K-Map or Quine McCluskey method)

**1. Constant Propagation Illustration**

Consider the combinational circuit shown below :

![comb_ckt1](https://github.com/user-attachments/assets/a1221e5f-576b-45f9-be22-6b6473cffcd0)

The boolean logic inferred is Y = ((AB)+C)'. If A is always tied to ground i.e., A = 0, then the expression will always evaluate to C'. In this case instead of having a AND gate and a NOR gate the circuit can be simplified by using a single NOT gate with C as its input. 

**2. Boolean Logic Optimisation Illustration**

Consider the verilog statement below :
```
assign y = a?(b?c:(c?a:0)):(!c);
```
The ternary operator (?:) will realize a mux upon synthesis. This circuit can be optimised by writing the equivalent expression (or function) in boolean variables and minimising the function that will result in more optimised design which is shown below:

![comb_opt2](https://github.com/user-attachments/assets/ef1926bb-68f1-4298-aab3-4c0bf1f7dbc6)

We have considered few examples to demonstrate optimization exhibited by yosys tool with additional step. The command removes unused cells and nets if any.
Steps to generate the netlist for the below designs:

```
yosys
read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib  
read_verilog <module_name.v> 
synth -top <top_module_name>
# flatten # Use if multiple modules are present
opt_clean -purge
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
show
write_verilog -noattr <netlist_name.v>
```
------

**opt_clean -** remove unused cells and wires. The -purge switch removes internal nets if they have a public name. This command identifies wires and cells that are unused and removes them. This command can be used to clean up after the commands that do the actual work.

-------

**Example 1:**

Verilog Code and Optimized Synthesized Design:

![opt_check_yosys](https://github.com/user-attachments/assets/a85535d1-be2d-4cba-a0cd-bfcbee57575a)

**Example 2:**

Verilog Code and Optimized Synthesized Design:

![opt_check2_yosys](https://github.com/user-attachments/assets/a244f6a5-73b2-403f-bd35-7d758fc8f4c9)

**Example 3:**

Verilog Code and Optimized Synthesized Design:

![opt_check3_yosys](https://github.com/user-attachments/assets/4d3ce00b-90aa-4901-a4a2-ba680be794a0)

**Example 4:**

Verilog Code and Optimized Synthesized Design:

![opt_check4_yosys](https://github.com/user-attachments/assets/beef3137-6c80-456b-b3c6-e8b0a5aac384)

**Example 5:**

Verilog Code 
```
module sub_module1(input a , input b , output y);
 assign y = a & b;
endmodule

module sub_module2(input a , input b , output y);
 assign y = a^b;
endmodule

module multiple_module_opt(input a , input b , input c , input d , output y);
wire n1,n2,n3;

sub_module1 U1 (.a(a) , .b(1'b1) , .y(n1));
sub_module2 U2 (.a(n1), .b(1'b0) , .y(n2));
sub_module2 U3 (.a(b), .b(d) , .y(n3));

assign y = c | (b & n1); 
endmodule
```

Optimized Synthesized Design:

![mult_mod_opt](https://github.com/user-attachments/assets/74a9010f-58c5-4388-b07e-bd7bf67565de)


**Example 6:**

Verilog Code 
```
module sub_module(input a , input b , output y);
 assign y = a & b;
endmodule

module multiple_module_opt2(input a , input b , input c , input d , output y);
wire n1,n2,n3;

sub_module U1 (.a(a) , .b(1'b0) , .y(n1));
sub_module U2 (.a(b), .b(c) , .y(n2));
sub_module U3 (.a(n2), .b(d) , .y(n3));
sub_module U4 (.a(n3), .b(n1) , .y(y));

endmodule
```

Optimized Synthesized Design:

![mult_mod_opt2](https://github.com/user-attachments/assets/ecaa7674-341a-42fb-ac93-f39ed5d4ac96)


## Sequential Optimizations

The sequential logic optimisations techniques are broadly classified into two categories :

1. Basic Techniques
   	a. Sequential Constant Propagation
3. Advanced Techniques
   	a. State Optimisation
   	b. Retiming
   	c. Sequential Logic Cloning (Floor aware Synthesis)

**Illustration of Sequential Optimization:**

Steps to simulate and generate the netlist for the below designs

Simulation steps :
```
iverilog <rtl_name.v> <tb_name.v>
./a.out
gtkwave <dump_file_name.vcd>
```

Generating netlist steps :

```
yosys
read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib  
read_verilog <module_name.v> 
synth -top <top_module_name>
# flatten # use if the multiple modules are present
opt_clean -purge
dfflibmap -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
show
write_verilog -noattr <netlist_name.v>
```

**Example 1:**

The verilog code for the example 2 is given below :

```
module dff_const1(input clk, input reset, output reg q);
always @(posedge clk, posedge reset)
begin
	if(reset)
		q <= 1'b0;
	else
		q <= 1'b1;
end

endmodule
```

![dff_const1](https://github.com/user-attachments/assets/83118507-9d96-45a1-aafe-c6711c6f763f)

![dff_const1](https://github.com/user-attachments/assets/8bbf763d-4035-4fb2-9ed4-c045f960a4c5)

Since this code doesn't need optimisation it will infer a D flip-flop with asynchronous reset as shown above. All the standard cells by default have negative logic for reset and since in the code reset is mentioned as positive, an inverter is used for the reset signal.

**Example 2:**

The verilog code for the example 2 is given below :

```
module dff_const2(input clk, input reset, output reg q);
always @(posedge clk, posedge reset)
begin
	if(reset)
		q <= 1'b1;
	else
		q <= 1'b1;
end
endmodule
```

![dff_const2](https://github.com/user-attachments/assets/626aae5c-30bf-4ae6-afad-551cd588540b)

![dff_const2](https://github.com/user-attachments/assets/b0c852a8-9502-4c43-94f1-62aa246f86d8)

The above code infers a D flip-flop with asynchronous set (reset signal is applied to set input) whereas, the optimised design infers a direct connection of VDD (logic 1) to the output q as shown above.

**Example 3:**
The verilog code for the example 3 is given below :
```
module dff_const3(input clk, input reset, output reg q);
reg q1;

always @(posedge clk, posedge reset)
begin
	if(reset)
	begin
		q <= 1'b1;
		q1 <= 1'b0;
	end
	else
	begin
		q1 <= 1'b1;
		q <= q1;
	end
end

endmodule
```
![dff_const3](https://github.com/user-attachments/assets/ee047b21-36e7-48e2-8439-ae716862007a)

![dff_cont3](https://github.com/user-attachments/assets/9c2aa23a-e0c5-40e7-a06d-b936ef45566c)

Since this code doesn't need optimisation it will infer two D flip-flop with asynchronous set and reset as shown above. 


**Example 4:**
The verilog code for the example 4 is given below :

```
module dff_const4(input clk, input reset, output reg q);
reg q1;

always @(posedge clk, posedge reset)
begin
	if(reset)
	begin
		q <= 1'b1;
		q1 <= 1'b1;
	end
	else
	begin
		q1 <= 1'b1;
		q <= q1;
	end
end

endmodule
```

![dff_const4](https://github.com/user-attachments/assets/bde83618-75db-47a7-bd60-811a3d88b3d2)

![dff_const](https://github.com/user-attachments/assets/63f197d2-1f70-4187-a0d8-9d32680ad200)

The above code infers a two D flip-flop with asynchronous set(reset signal is applied to set input ), whereas the optimised design infers a direct connection of VDD (logic 1) to the output q as shown above.

**Example 5:**
The verilog code for the example 5 is given below :
```
module dff_const5(input clk, input reset, output reg q);
reg q1;

always @(posedge clk, posedge reset)
begin
	if(reset)
	begin
		q <= 1'b0;
		q1 <= 1'b0;
	end
	else
	begin
		q1 <= 1'b1;
		q <= q1;
	end
end

endmodule
```
![dff_const5](https://github.com/user-attachments/assets/74c2325b-3d53-4821-b5f8-8a8f52c46761)

![dff_const5](https://github.com/user-attachments/assets/85501551-872d-4ce1-8cfd-b7b07a0093a4)

Since this code doesn't need optimisation it will infer two D flip-flop with asynchronous reset as shown above.

-------

## Optimisation of Unused States

**Steps to simulate and generate the netlist for the below designs**

Simulation steps :

```
iverilog <rtl_name.v> <tb_name.v>
./a.out
gtkwave <dump_file_name.vcd>
```
Generating netlist steps :

```
yosys
read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib  
read_verilog <module_name.v> 
synth -top <top_module_name>
opt_clean -purge
dfflibmap -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
show
write_verilog -noattr <netlist_name.v>
```
**Example 1**
Consider the verilog code shown below :
```
module counter_opt (input clk , input reset , output q);
reg [2:0] count;
assign q = count[0];

always @(posedge clk ,posedge reset)
begin
	if(reset)
		count <= 3'b000;
	else
		count <= count + 1;
end

endmodule
```

Following represents simulation waveform, verilog code and schematic of sample counter_opt design. Though the code contains 3bit register, but still yosys will retain logic only visible in required final output. 

![counter_opt](https://github.com/user-attachments/assets/7b8ed077-e8d1-48f1-99ff-afe06e69322d)

![counter_opt](https://github.com/user-attachments/assets/f62c8faf-1039-4bd4-982c-ab55a6a6e85a)


**Example2**

Consider another verilog code shown below :
```
module counter_opt (input clk , input reset , output q);
reg [2:0] count;
assign q = count==3'b100;

always @(posedge clk ,posedge reset)
begin
	if(reset)
		count <= 3'b000;
	else
		count <= count + 1;
end

endmodule
```

In this case since q is asserted only when count == 3'b100, all the three flip-flops are used. Hence even after optimisation , the code will infer three flops.

The simulation waveform, verilog code and synthesis result are shown below :

![count_opt2](https://github.com/user-attachments/assets/60ec4251-0390-4577-9728-9f63dce7690a)

![counter_opt2](https://github.com/user-attachments/assets/e318f7d9-84aa-4d5f-b014-b2f8c63cd8ae)

------
## **Day4- GLS, Blocking vs Non-Blocking, Synthesis Simulation Mismatch**

**Gate Level Simulation**

Gate Level Simulation helps ensure that the synthesized version of the design matches the specification both in terms of functionality and timing. It helps identify mistakes and differences in the synthesised netlist and ensures that the final design functions as intended. Generally GLS is done to ensure that there is no synthesis-simulation mismatch. To perform the GLS the testbench that is used to verify the RTL is used. The GLS flow is similar to the testbench flow except that gate level verilog models are also used. It is necessary to mention the gatelevel verilog models to iverilog to make the iverilog understand about the standard cell given in the library .GLS requires adding information about timing delays. Gate level Verilog models can be functional and timing aware. If the gate level models are delay annotated then it can used for timing validation.

![Pasted image](https://github.com/user-attachments/assets/256f0609-5481-472a-b4dd-164a4ddafb4a)

**Synthesis-Simulation Mismatch**

Synthesis-simulation mismatch refers to the differences between the behavior of a digital circuit as simulated at the Register Transfer Level (RTL) and its behavior after being synthesized to gate-level netlists. Synthesis-simulation mismatch can occur because of the following reasons:

 1.   Missing Sensitivity List
 2.   Blocking vs Non-blocking assignments
 3.   Non-standard verilog coding

**1. Missing Sensitivity List**
   
Consider the verilog code and its corresponding graph shown below :
```
module mux(
	input i0,i1,s,
	output reg y
)
	always @(sel) begin
		if(sel)
			y = i1;
		else
			y = i0;
	end
endmodule

mux_eg

```
The "always" block is sensitive only to the "sel" signal. Whenever there's a modification in the "sel" output, it triggers a change in the output value. However, as this piece of code implies a multiplexer, the output should also change if the input changes. Since the sensitivity list includes only "sel," the output remains unaffected and it doesn't follow the input i0 when the sel is logic 0. Hence this a circuit behaves like a latch.

In order to solve the problem all the critical signals needed to be mentioned in the sensitivity list. So the corrected code is given below :

```
module mux(
	input i0,i1,s,
	output reg y
)
	always @(*) begin //* - It considers changes in all the input signals. So always is evaluated whenever any signal changes.
		if(sel)
			y = i1;
		else
			y = i0;
	end
endmodule
```
-------

**2. Blocking and Non-Blocking Statements in Verilog**

Blocking assignments are denoted using the "=" operator. When a blocking assignment is executed, it directly assigns the right-hand side value to the left-hand side variable immediately within the current simulation cycle. The subsequent statements in the procedural block will wait for this assignment to complete before proceeding. Blocking assignments are sequentially executed.
Non-blocking assignments are denoted using the "<=" operator. When a non-blocking assignment is encountered, the right-hand side value is scheduled to be assigned to the left-hand side variable at the end of the current simulation cycle. This means that all non-blocking assignments within a procedural block are executed simultaneously, updating variables concurrently. The value changes take effect in the next simulation cycle. Non-Blocking assignments are executed in parallel.

**Example 1:**

Consider the verilog code given below:
```
module code(
	input clk,reset,d,
	output reg q
)
	reg q0;
	always @(posedge clk, posedge reset) begin
		if(reset) begin
			q=1'b0;
			q0=1'b0;
		end
		else begin
			q = q0; //Line 1
			q0=d; // Line 2
		end
	end
endmodule
```
The intent of this code is to create a 2-bit shift register. Since blocking assignmnet is used for Line 1 and Line 2 both the lines will be executed sequentially. First line 1 will be executed creating a flip-flop whose input is q0 and output is q. Then line 2 will be executed which creates a second flip-flop whose input is d and output is q0 thereby connecting two flip-flops and creating a 2-bit shift register.

Now, Consider the verilog code shown below :

```
module code(
	input clk,reset,d,
	output reg q
)
	reg q0;
	always @(posedge clk, posedge reset) begin
		if(reset) begin
			q=1'b0;
			q0=1'b0;
		end
		else begin
			q0 = d; //Line 1
			q=q0; // Line 2
		end
	end
endmodule
```
This code looks similar to the previous one except that line 1 and line 2 are interchanged. Since , blocking assignment is used line 1 and line 2 will be executed sequentially. First line 1 will be executed which creates a D flip-flop with the input d and output q0, then line 2 is executed. Since q0 is already defined assigning q0 to q creates wire . Hence only flip-flop is inferred instead of two. 

**Example 2:**

Consider the verilog code shown below :

```
module(
	input a,b,c,
	output reg y
)
	reg q0;
	always @(*) begin
		y = q0 & c; //Line 1
		q0 = a|b; //Line 2
	end
endmodule
```
In line 1 the output y is assigned with q0&c. But q0 is not mentioned anywhere before. Hence the previous value of the q0 will be taken and this will not infer a combinational circuit as expected instead a latch based circuit will be inferred. The corrected version of the code is shown below:

```
module(
	input a,b,c,
	output reg y
)
	reg q0;
	always @(*) begin
		q0 = a|b; //Line 1
		y = q0 & c; //Line 2
		
	end
endmodule
```
## Illustration of GLS and Synthesis Simulation Mismatch

Steps to simulate, generate the netlist and to perform the GLS for the below designs

Simulation steps :
```
iverilog <rtl_name.v> <tb_name.v>
./a.out
gtkwave <dump_file_name.vcd>
```

Generating netlist steps :
```
yosys
read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib  
read_verilog <module_name.v> 
synth -top <top_module_name>
# opt_clean -purge # If optimisation has to be done
# dfflibmap -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib # if sequential circuit is used 
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
show
write_verilog -noattr <netlist_name.v>
```

Steps to perform GLS:

```
iverilog ../my_lib/verilog_model/primitives.v ../my_lib/verilog_model/sky130_fd_sc_hd.v <netlist_name.v> <tb_name.v>
./a.out
gtkwave <dump_file_name.vcd>
```

**Example 1**

Consider the verilog code shown below :

```
module ternary_operator_mux (input i0 , input i1 , input sel , output y);
	assign y = sel?i1:i0;
endmodule
```

The simulation, synthesis result , the netlist and the GLS are shown below :

![ternary_op_gtk](https://github.com/user-attachments/assets/d0f36eea-5537-49bb-8868-1e29a905aca4)

![ternay_op_mux](https://github.com/user-attachments/assets/fdaf57ac-482b-4cba-951d-44d58d15ac30)

![ternary_gls_gtk](https://github.com/user-attachments/assets/d722bbaa-8bb5-453d-a256-aa2a89a77d09)

In this case there is no synthesis and simulation mismatch.

**Example 2**

Consider the verilog code shown below :

```
module bad_mux (input i0 , input i1 , input sel , output reg y);
always @ (sel)
begin
	if(sel)
		y <= i1;
	else 
		y <= i0;
end
endmodule

```

The simulation, synthesis result , the netlist and the GLS are shown below :

![bad_mux_gtk](https://github.com/user-attachments/assets/4d6edd12-8dca-4db7-88ec-aa484b3a2ac2)

![bad_mux_yosys](https://github.com/user-attachments/assets/48d8dc06-d2ae-40b6-a99a-375331bd87fe)

![bad_mux_gtk](https://github.com/user-attachments/assets/b218d3ed-62ff-4c89-a63f-792178f7cbc1)

In this case there is a synthesis and simulation mismatch. While performing synthesis yosys has corrected the sensitivity list error.

**Example 3**

Consider the verilog code shown below :
```
module blocking_caveat (input a , input b , input  c, output reg d); 
reg x;
always @ (*)
begin
	d = x & c; //Line 1
	x = a | b; //Line 2
end
endmodule
```

The simulation, synthesis result , the netlist and the GLS are shown below :

![blocking_gtk](https://github.com/user-attachments/assets/8daac294-9255-41d3-9855-72fc659bc8a1)

![blocking_yosys](https://github.com/user-attachments/assets/e6fb9170-0365-4e14-bde1-4b209d91f4c8)

![blocking_gls_gtk](https://github.com/user-attachments/assets/d59191f1-bfde-4890-a4fc-41ba2ce962ad)

In this case there is a synthesis and simulation mismatch. While performing synthesis yosys has corrected the latch error.

-----

## Synthesis of RISC-V using yosys and Post synthesis simulation of Babysoc using iverilog GTKwave

First step in the Post synthesis simulation design flow is to synthesize the generated RTL code of RISC-V and after that we will simulate the result. This way we can find more about our code and its bugs. So in this section we are going to synthesize our code then do a post-synthesis simulation to look for any issues. The post and pre (modeling section) synthesis results should be identical.

## Synthesizing RISC-V using Yosys

	* In OpenLANE the RTL synthesis is performed by yosys.
 	* The technology mapping is performed by abc.

  To perform the synthesis process do the following:
  ```
cd ~/VSDBabySoC/src
yosys
read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_liberty -lib ../lib/avsddac.lib
read_liberty -lib ../lib/avsdpll.lib  
read_verilog ../module/vsdbabysoc.v
read_verilog ../module/rvmyth_pri.v
read_verilog ../module/clk_gate.v 
synth -top vsdbabysoc
dfflibmap -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
show
write_verilog -noattr vsdbabysoc.synth.v
```

These commands will generate the vsdbaby soc top level netlist file vsdbabysoc.synth.v which can be used for the post synthesis simulation of the RISC-V processor.
The synthesized module is shown below:

![synth_image](https://github.com/user-attachments/assets/5a53f7b9-1406-4b55-906f-ce33e8775a52)

  ------
The netlist generated in the terminal window is shown below:

![netlist_terminal](https://github.com/user-attachments/assets/0681ac71-daa7-4739-8ae1-c9757f9f30fc)

![netlist2](https://github.com/user-attachments/assets/83a7d12a-1052-4e5c-84b8-9b20608174b7)

-----
## Post-synthesis simulation (GLS)
--------
For Post-synthesis simulation, we use the vsdbabysoc.v as the top module, which includes RISC-V, DAC and PLL as submodules and the testbench which we used for the pre synthsis simulation of the vsdbabysoc.

The commands for simulating the synthesized module of RISC-V are:
```
cd ~/VSDBabySoC

mkdir -p output/post_synth_sim && iverilog -o output/post_synth_sim/post_synth_sim.out -DPOST_SYNTH_SIM -DFUNCTIONAL -DUNIT_DELAY=#1 -I src/module/include -I src/module -I src/gls_model src/module/testbench.v && cd output/post_synth_sim && ./post_synth_sim.out
```

The result of the simulation (i.e. post_synth_sim.vcd) will be stored in the output/post_synth_sim directory and the waveform could be seen by the following command:
```
$ gtkwave output/post_synth_sim/post_synth_sim.vcd
```
![terminal_gtk](https://github.com/user-attachments/assets/3b934499-adc0-43cd-96e0-ff8576eca7ea)

----
The simulation waveforms are:

1. clk_pri and reset signals:
   
   ![clk_reset](https://github.com/user-attachments/assets/b67e1757-5c83-420c-9514-a16399d559e1)
   

2. RISC-v and DAC outputs
   
   ![output2](https://github.com/user-attachments/assets/ebc0874b-bfd1-4d43-96e7-9211a84f17e6)
   

3. Zoomed outputs

   ![output](https://github.com/user-attachments/assets/b68734af-dd38-4246-96e5-aa8e7bf65d6f)

   
4. Standard cells in gtkwave
   
   ![std_cells](https://github.com/user-attachments/assets/92d6904e-6707-417b-a246-65d5efa38d0a)

-----
In the above waveforms, we can see the following signals:

**clk_pri:** This is the input CLOCK signal of the RVMYTH core. This signal comes from the PLL.
    
**reset:** This is the input reset signal of the RVMYTH core. This signal comes from an external source, originally. Here it is generated by the testbench
    
**RV_to_DAC[9:0]:** This is the 10-bit output RV_to_DAC[9:0] port of the RVMYTH core. This port comes from the RVMYTH register.
    
**OUT:** This is a real datatype wire which can simulate analog values. It is the output wire real OUT signal of the DAC module. This signal comes from the DAC.

**The pre synthesis simulation waveforms and the post synthesis simulation waveforms were found to be identical.
The pre synthesis simulation waveforms are shown here for reference:**

**clk and reset:**

![clk](https://github.com/user-attachments/assets/7c213204-0b2a-4fb3-9861-ce3517821dd3)

**output signals:**

![pre_synth_sim_output](https://github.com/user-attachments/assets/99590c42-6bf0-4781-8ddd-32fb96687845)


---------

## Static Timing Analysis (STA) of VSDBabySoC

Static timing analysis (STA) is a method of validating the timing performance of a design by checking all possible paths for timing violations. STA breaks a design down into timing paths, calculates the signal propagation delay along each path, and checks for violations of timing constraints inside the design and at the input/output interface.
When performing timing analysis, STA first breaks down the design into timing paths. Each timing path consists of the following elements:
**1. Startpoint:** The start of a timing path where data is launched by a clock edge or where the data must be available at a specific time. Every startpoint must be either an input port or a register clock pin.
**2. Combinational logic network:** Elements that have no memory or internal state. Combinational logic can contain AND, OR, XOR, and inverter elements, but cannot contain flip-flops, latches, registers, or RAM.
**3. Endpoint:** The end of a timing path where data is captured by a clock edge or where the data must be available at a specific time. Every endpoint must be either a register data input pin or an output port.

The STA for the VSDBabysoc design was done with the below constraints stored in the .sdc file:
```
# Create clock with clock period
create_clock [get_pins pll/CLK] -name clk -period 11.5 -waveform {0 5.75} 

# Set loads
set_load -pin_load 0.5 [get_ports OUT] 
set_load -min -pin_load 0.5 [get_ports OUT] 

# Set clock latency
set_clock_latency 1 [get_clocks clk] 
set_clock_latency -source 2 [get_clocks clk] 

# Set clock uncertainty
set_clock_uncertainty 0.575 [get_clocks clk]  ; # 5% of clock period for setup
set_clock_uncertainty -hold 0.92 [get_clocks clk] ; # 8% of clock period for hold

# Set maximum delay
set_max_delay 11.5 -from [get_pins dac/OUT] -to [get_ports OUT] 

# Set input delay for VCO_IN
set_input_delay -clock clk -max 4 [get_ports VCO_IN] 
set_input_delay -clock clk -min 1 [get_ports VCO_IN] 

# Set input delay for ENb_VCO
set_input_delay -clock clk -max 4 [get_ports ENb_VCO] 
set_input_delay -clock clk -min 1 [get_ports ENb_VCO] 

# Set input delay for ENb_CP
set_input_delay -clock clk -max 4 [get_ports ENb_CP] 
set_input_delay -clock clk -min 1 [get_ports ENb_CP] 

# Set input transition for VCO_IN
set_input_transition -max 0.575 [get_ports VCO_IN] ; # 5% of clock for setup 
set_input_transition -min 0.92 [get_ports VCO_IN] ; #  8% of clock for setup 

# Set input transition for ENb_VCO
set_input_transition -max 0.575 [get_ports ENb_VCO] ; #  5% of clock for setup 
set_input_transition -min 0.92 [get_ports ENb_VCO] ; #   8% of clock for setup 

# Set input transition for ENb_CP
set_input_transition -max 0.575 [get_ports ENb_CP] ; #  5% of clock for setup 
set_input_transition -min 0.92 [get_ports ENb_CP] ; #   8% of clock for setup 
```

The commands for executing the STA through OpenSTA are:
```
~cd VSDBabySoC/src/module/my_riscv_sta
~sta
```
This opens the sta tool in the design folder location. ones the sta tool is invoked below commands were executed to generate the timings for worst case and best case delays i.e. to calculate the setup and hold slacks.

```
read_liberty -min sky130_fd_sc_hd__tt_025C_1v80.lib
read_liberty -max sky130_fd_sc_hd__tt_025C_1v80.lib
read_liberty -min avsdpll.lib
read_liberty -max avsdpll.lib
read_liberty -min avsddac.lib
read_liberty -max avsddac.lib
read_verilog  vsdbabysoc.synth.v
link_design   vsdbabysoc
read_sdc      vsdbabysoc_synthesis.sdc
report_checks -path_delay max -format full #for worst case setup slack
report_checks -path_delay min -format full #for best case hold slack
```
The screenshot of the timing reports for reg2reg delay calculation are given below
**1: worst case setup slack:**

![setup_worst_case](https://github.com/user-attachments/assets/41fd3c9c-15dc-4c7a-bff2-90ad37db71a6)

**2: Best case hold slack:**

![hold_check_bestcase](https://github.com/user-attachments/assets/0f3b3f4b-b7b0-46d6-90f2-60c5a767aba5)

-----
The slacks in both the cases were found to be negative. That means the design needs to be modified to reduce the path delays or the clock frequency under consideration needs to be increased to match the delays.

The slack calculations were also carried out for a random reg2reg data path in the riscv design and the screenshots of the setup and hold slacks for the same are shown below. The data path was chosen from the synthesis output file by following data signal originating from 1 DFF and reaching the second DFF.
The commands for giving startpoint and endpoint as an input for genertaing slack are:
```
# for setup, startpoint and endpoint can be modified based on analysis
report_checks -path_delay max -format full -from [get_pins core_pri/_17105_/CLK] -to [get_pins core_pri/_16578_/D] 

# for hold, startpoint and endpoint can be modified based on analysis
report_checks -path_delay min -format full -from [get_pins core_pri/_17105_/CLK] -to [get_pins core_pri/_16578_/D]
```

**1. setup slack:**
![setup_random](https://github.com/user-attachments/assets/f8ef82ac-e759-4b3b-84e7-74f4641d3573)


**2. hold slack:**
![hold_check_random](https://github.com/user-attachments/assets/6a1bb736-d2ec-4040-8e71-6426eb16dbdd)

-----

## Synthesize VsdBabySoC design using different PVT Corner Library Files
------
In this lab, we will be checking for the worst setup/hold slacks using different PVT Corner library files.

* PVT (Process, Voltage, Temperature) are the three key factors that impact the performance and behavior of integrated circuits in VLSI design. Here is a summary of how each of these factors affects circuit design:

**1. Process (P):**
Process variation refers to deviations in the semiconductor fabrication process, such as variations in impurity concentration, oxide thickness, and transistor dimensions. These process variations can cause changes in transistor parameters like threshold voltage, mobility, and current drive, which in turn impact the circuit delay and performance. Circuits designed with a "fast" process will have lower delays, while "slow" process corners will have higher delays.

**2. Voltage (V):**
The supply voltage of the chip can deviate from the optimal value during operation due to factors like noise, IR drop, and voltage regulator variations. Higher supply voltage leads to increased current and faster charging/discharging of capacitances, resulting in lower delays. Lower voltage has the opposite effect.

**3. Temperature (T):**
The operating temperature of the chip can vary widely depending on the environment and power dissipation within the chip. Higher temperatures generally decrease carrier mobility, leading to increased delays.

We must ensure that our design is functioning properly for all PVT corners. For this, we use STA using the following procedure.
We run the script shown below. This script reads in all the library files one by one from the specified directory and is used on our VSDBabySoC design. The constraints file from the earlier lab is also read(clock-11.50 ns with 5% of clock period for clock uncertainity and data transition delay for setup and 8% of clock period for clock uncertainity and data transition delay for hold).

```
set list_of_lib_files(1) "sky130_fd_sc_hd__tt_025C_1v80.lib"
set list_of_lib_files(2) "sky130_fd_sc_hd__tt_100C_1v80.lib"
set list_of_lib_files(3) "sky130_fd_sc_hd__ff_100C_1v65.lib"
set list_of_lib_files(4) "sky130_fd_sc_hd__ff_100C_1v95.lib"
set list_of_lib_files(5) "sky130_fd_sc_hd__ff_n40C_1v56.lib"
set list_of_lib_files(6) "sky130_fd_sc_hd__ff_n40C_1v65.lib"
set list_of_lib_files(7) "sky130_fd_sc_hd__ff_n40C_1v76.lib"
set list_of_lib_files(8) "sky130_fd_sc_hd__ff_n40C_1v95.lib"
set list_of_lib_files(9) "sky130_fd_sc_hd__ss_100C_1v40.lib"
set list_of_lib_files(10) "sky130_fd_sc_hd__ss_100C_1v60.lib"
set list_of_lib_files(11) "sky130_fd_sc_hd__ss_n40C_1v28.lib"
set list_of_lib_files(12) "sky130_fd_sc_hd__ss_n40C_1v35.lib"
set list_of_lib_files(13) "sky130_fd_sc_hd__ss_n40C_1v40.lib"
set list_of_lib_files(14) "sky130_fd_sc_hd__ss_n40C_1v44.lib"
set list_of_lib_files(15) "sky130_fd_sc_hd__ss_n40C_1v60.lib"
set list_of_lib_files(16) "sky130_fd_sc_hd__ss_n40C_1v76.lib"

for {set i 1} {$i <= [array size list_of_lib_files]} {incr i} {
read_liberty ./timing_libs/$list_of_lib_files($i)
read_liberty -min avsdpll.lib
read_liberty -max avsdpll.lib
read_liberty -min avsddac.lib
read_liberty -max avsddac.lib
read_verilog  vsdbabysoc.synth.v
link_design vsdbabysoc
read_sdc vsdbabysoc_synthesis.sdc
check_setup -verbose
report_checks -path_delay min_max -fields {nets cap slew input_pins fanout} -digits {4} > ./sta_output/min_max_$list_of_lib_files($i).txt

exec echo "$list_of_lib_files($i)" >> ./sta_output/sta_worst_max_slack.txt
report_worst_slack -max -digits {4} >> ./sta_output/sta_worst_max_slack.txt

exec echo "$list_of_lib_files($i)" >> ./sta_output/sta_worst_min_slack.txt
report_worst_slack -min -digits {4} >> ./sta_output/sta_worst_min_slack.txt

exec echo "$list_of_lib_files($i)" >> ./sta_output/sta_tns.txt
report_tns -digits {4} >> ./sta_output/sta_tns.txt

exec echo "$list_of_lib_files($i)" >> ./sta_output/sta_wns.txt
report_wns -digits {4} >> ./sta_output/sta_wns.txt
}
```
The SDC file used for generating clock and data constraints is given below:

![SDC](https://github.com/user-attachments/assets/f3718c3f-9e39-4ee4-bcab-bdeb54793f3a)

The script generates reports for each library file. A table comprising of the worst setup and hold slacks from the reports is shown below: 

![excel_screenshot](https://github.com/user-attachments/assets/daa1aa90-c164-44ad-94ae-d829eae52ef3)

-----
From the table, we have plotted the below graphs:

**1: Worst Setup Slack (WNS):**

![WNS](https://github.com/user-attachments/assets/4e977df4-b704-46c5-8c67-7f6211a477fc)


**2: Worst Hold Slack (WHS):**

![WHS](https://github.com/user-attachments/assets/cd897f30-fcff-4cea-b4b2-d0d5af9b579d)


**From the graphs we can infer:**

* Worst setup slack - sky130_fd_sc_hd__ss_n40C_1v28 PVT Corner library file
* Worst hold slack - sky130_fd_sc_hd__ff_n40C_1v95 PVT Corner library file

-----
## Lab13: Advanced Physical Design Using Openlane/Sky130 Wokshop

## Theory:

**Package**

* In any embedded board we have seen, the part of the board we consider as the chip is only the PACKAGE of the chip which is nothing but a protective layer or packet bound over the actual chip and the actual manufatured chip is usually present at the center of a package wherein, the connections from package is fed to the chip by WIRE BOUND method which is none other than basic wired connection.

  ![image](https://github.com/user-attachments/assets/190b4c19-7a10-4526-a449-c61955ef81e9)

  ![image](https://github.com/user-attachments/assets/140d21ef-072e-44ba-9412-fe6485b6e3cf)

  ![image](https://github.com/user-attachments/assets/8f941ff2-8377-44df-9c29-829f2d656ccd)


**Chip**

* Now, taking a look inside the chip, all the signals from the external world to the chip and vice versa is passed through PADS. The area bound by the pads is CORE where all the digital logic of the chip is placed. Both the core and pads make up the DIE which is the basic manufacturing unit in regards to semiconductor chips.

![image](https://github.com/user-attachments/assets/07531d75-0042-4124-8e5d-e6a1315bdfa1)


**Foundty**

* Foundry is the place where the semiconductor chips are manufactured and FOUNDRY IP's are Intellectual Properties based on a specific foundry and these IP's require a specific level of intelligence to be produced whereas, repeatable digital logic blocks are called MACROS.

![image](https://github.com/user-attachments/assets/b9fd0168-4a71-4e9a-9152-f7bd8a3f9cb6)

**ISA (Intruction Set Architecture)**

* A C program which has to be run on a specific hardware layout which is the interior of a chip in your laptop, there is certain flow to be followed.
* Initially, this particular C program is compiled in it's assembly language program which is nothing but RISC-V ISA (Reduced Instruction Set Compting - V Intruction Set Architecture).
* Following this, the assembly language program is then converted to machine language program which is the binary language logic 0 and 1 which is understood by the hardware of the computer.
* Directly after this, we've to implement this RISC-V specification using some RTL (a Hardware Description Language). Finally, from the RTL to Layout it is a standard PnR or RTL to GDSII flow.

![image](https://github.com/user-attachments/assets/f9f9c0ce-b464-4efc-92f2-3b40a0bff34a)


* For an application software to be run on a hardware there are several processes taking place. To begin with, the apps enters into a block called system software and it converts the application program to binary language. There are various layers in system software in which the major layers or components are OS (Operating System), Compiler and Assembler.
* At first the OS outputs are small function in C, C++, VB or Java language which are taken by the respective compiler and converted into instructions and the syntax of these instructions varies with the hardware architecture on which the system is implemented.
* Then, the job of the assembler is to take these instructions and convert it into it's binary format which is basically called as a machine language program. Finally, this binary language is fed to the hardware and it understands the specific functions it has to perform based on the binary code it receives.

![image](https://github.com/user-attachments/assets/e7d4317a-5dcc-48bf-b20d-d48465951c12)

For example, if we take a stopwatch app on RISC-V core, then the output of the OS could be a small C function which enters into the compiler and we get output RISC-V instructions following this, the output of the assembler will be the binary code which enters into your chip layout.

![image](https://github.com/user-attachments/assets/f56f5088-e623-4030-be95-0dd48c28f275)

* For the above stopwatch the following are the input and output of the compiler and assembler

![image](https://github.com/user-attachments/assets/b3b41fed-fb8c-43eb-af67-3f845f0e1f2d)

* The output of the compiler are instructions and the output of the assembler is the binary pattern. Now, we need some RTL (a Hardware Description Language) which understands and implements the particular instructions. Then, this RTL is synthesised into a netlist in form of gates which is fabricated into the chip through a physical design implementation.

![image](https://github.com/user-attachments/assets/b330eb3e-1e89-4da3-bcaa-e95fe6b118e3)

**Open-source Implementation**

    For open-source ASIC design implemantation, we require the following enablers to be readily available as open-source versions. They are:-

*	RTL Designs
*	EDA Tools
*	PDK Data


* Initially in the early ages, the design and fabrication of IC's were tightly coupled and were only practiced by very few companies like TI, Intel, etc.
* In 1979, Lynn Conway and Carver Mead came up with an idea to saperate the design from the fabrication and to do this they inroduced structured design methodologies based on the λ-based design rules and published the first VLSI book "Introduction to VLSI System" which started the VLSI education.
* This methodology resulted in the emergence of the design only companies or "Fabless Companies" and fabrication only companies that we usually refer to as "Pure Play Fabs". The inteface between the designers and the fab by now became a set of data files and documents, that are reffered to as the "Process Design Kits (PDKs)".
* The PDK include but not limited to Device Models, Technology Information, Design Rules, Digital Standard Cell Libraries, I/O Libraries and many more.
* Since, the PDK contained variety of informations, and so they were distributed only under NDAs (Non-Disclosure Agreements) which made it in-accessible to the public.
* Recently, Google worked out an agreement with skywater to open-source the PDK for the 130nm process by skywater Technology, as a result on 30 June 2020 Google released the first ever open-source PDK.

![image](https://github.com/user-attachments/assets/e9fa7771-ef5d-4755-9f3f-18856e722039)

ASIC design is a complex step that involves tons of steps, various methodologies and respective EDA tools which are all required for successful ASIC implementation which is achieved though an ASIC flow which is nothing but a piece of software that pulls different tools togather to carry out the design process.

![image](https://github.com/user-attachments/assets/7029c60a-251b-4fee-8c9c-1c3dad0abce3)

**OpenLANE Open-source ASIC Design Implementation Flow**

    The main objective of the ASIC Design Flow is to take the design from the RTL (Register Transfer Level) all the way to the GDSII, which is the format used for the final fabrication layout.

![image](https://github.com/user-attachments/assets/288edd23-d1e7-49a7-9dc6-7a93fc019575)

* Synthesis is the process of convertion or translation of design RTL into circuits made out of Standard Cell Libraries (SCL) the resultant circuit is described in HDL and is usually reffered to as the Gate-Level Netlist.
* Gate-Level Netlist is functionally equivalent to the RTL.

![image](https://github.com/user-attachments/assets/6102211f-3af2-491a-a368-3919bb8e45a2)


* The fundemental building blocks which are the standard cells have regular layouts.
* Each cell has different views/models which are utilised by different EDA tools like liberty view with electrical models of the cells, HDL behavioral models, SPICE or CDL views of the cells, Layout view which include GDSII view which is the detailed view and LEF view which is the abstract view.

![image](https://github.com/user-attachments/assets/1fcaa7bf-b7c6-4fc4-a7cd-5747a6045682)

* Chip Floor Planning

![image](https://github.com/user-attachments/assets/ddb33f57-72b5-4dac-a9bf-fde5782b6bae)

* Macro Floor Planning

![image](https://github.com/user-attachments/assets/ab93e598-e4b4-4b61-adee-80f51fb9c4c4)

* Power Planning typically uses upper metal layers for power distribution since thay are thicker than lower metal layers and so have lower resistance and PP is done to avoid electron migration and IR drops.
  
![image](https://github.com/user-attachments/assets/be885ab5-06ca-47f9-ac4c-f2625b63453e)

* Placement
  
![image](https://github.com/user-attachments/assets/4e0c6519-c1a8-4be3-bfe5-9c2b8a70e139)

* Global placement provide approximate locations for all cells based on connectivity but in this stage the cells may be overlapped on each other and in detailed placement the positions obtained from global placements are minimally altered to make it legal (non-overlapping and in site-rows)

![image](https://github.com/user-attachments/assets/01915ce1-6694-4eee-8df3-2b37039b7809)

* Clock Tree Synthesis

![image](https://github.com/user-attachments/assets/060cf6a0-1ef9-4a31-abc2-799487dd8d06)

* Clock skew is the time difference in arrival of clock at different components.
* Routing

![image](https://github.com/user-attachments/assets/fc4baa91-86ec-4568-b847-c17d6e72b3ea)

* skywater PDK has 6 routing layers in which the lowest layer is called the local interconnect layer which is a Titanium Nitride layer the following 5 layers are all Aluminium layers.

![image](https://github.com/user-attachments/assets/2c6125b9-91ff-4aa0-8fa6-c52605fa0ca1)

* Global and Detailed Routing

![image](https://github.com/user-attachments/assets/459f1066-49d8-41b6-97a0-c133c943fb8d)

* Once done with the routing the final layout can be generated which undergoes various Sign-Off checks.
* Design Rules Checking (DRC) which verifies that the final layout honours all design fabrication rules.
* Layout Vs Schematic (LVS) which verifies that the final layout functionality matches the gate-level netlist that we started with.
* Static Timing Analysis (STA) to verify that the design runs at the designated clock frequency.

![image](https://github.com/user-attachments/assets/8ab63b14-c047-488f-adb9-e401c4ce72cc)

----
**Day1:**
## Inception of open-source EDA, OpenLANE and Sky130 PDK :

Tasks:
1. Run 'picorv32a' design synthesis using OpenLANE flow and generate necessary outputs.
2. Calculate the flop ratio.

   The Flop ratio can be calculated as follows:

\[
\text{Flop Ratio} = \frac{\text{Number of D Flip-Flops}}{\text{Total Number of Cells}}
\]

The percentage of Flop Ratio = Flop Ratio * 100

## 1. Run 'picorv32a' design synthesis using OpenLANE flow and generate necessary outputs.
--------
Commands to invoke the OpenLANE flow and perform synthesis
```
# Change directory to openlane flow directory
cd Desktop/work/tools/openlane_working_dir/openlane

# alias docker='docker run -it -v $(pwd):/openLANE_flow -v $PDK_ROOT:$PDK_ROOT -e PDK_ROOT=$PDK_ROOT -u $(id -u $USER):$(id -g $USER) efabless/openlane:v0.21'
# Since we have aliased the long command to 'docker' we can invoke the OpenLANE flow docker sub-system by just running this command
docker
```
```
# Now that we have entered the OpenLANE flow contained docker sub-system we can invoke the OpenLANE flow in the Interactive mode using the following command
./flow.tcl -interactive

# Now that OpenLANE flow is open we have to input the required packages for proper functionality of the OpenLANE flow
package require openlane 0.9

# Now the OpenLANE flow is ready to run any design and initially we have to prep the design creating some necessary files and directories for running a specific design which in our case is 'picorv32a'
prep -design picorv32a

# Now that the design is prepped and ready, we can run synthesis using following command
run_synthesis

# Exit from OpenLANE flow
exit

# Exit from OpenLANE flow docker sub-system
exit
```
Screenshots:
![section1_openlane](https://github.com/user-attachments/assets/d7d1493a-81a5-4e86-a305-486499672b39)

![openlane2](https://github.com/user-attachments/assets/af215c68-4164-4006-bfe0-1599b831d46d)

![synthesis_completed](https://github.com/user-attachments/assets/44a14519-c005-4bf4-ac97-5411543d7c7b)

![syn_report](https://github.com/user-attachments/assets/eafa45ee-1804-46fa-99fe-beda59a98c31)

**2. Calculate the Flop ratio:**

![cell](https://github.com/user-attachments/assets/26886eff-9b16-4ace-8c00-b75d70e17063)

![dff_ratio](https://github.com/user-attachments/assets/83645358-c300-4431-b52c-362891bcf473)

Calculation of Flop Ratio and DFF % from synthesis statistics report file

	Flop Ratio = 1613/14876 = 0.108429685
        Percentage of Flip Flops = 0.108429685 ∗ 100 = 10.84296854%
	
-----
**Day2:**

## Good Floorpan vs Bad Floorplan and Introduction to Library Cell:
-----
Tasks:

1. Run 'picorv32a' design floorplan using OpenLANE flow and generate necessary outputs.
2. Calculate the die area in microns from the values in floorplan def.
3. Load generated floorplan def in magic tool and explore the floorplan.
4. Run 'picorv32a' design congestion aware placement using OpenLANE flow and generate necessary outputs.
5. Load generated placement def in magic tool and explore the placement.
	 Area of Die in microns = Die width in microns ∗ Die height in microns

**1. Run 'picorv32a' design floorplan using OpenLANE flow and generate necessary outputs**

Commands to invoke the OpenLANE flow and perform floorplan
```
# Change directory to openlane flow directory
cd Desktop/work/tools/openlane_working_dir/openlane

# alias docker='docker run -it -v $(pwd):/openLANE_flow -v $PDK_ROOT:$PDK_ROOT -e PDK_ROOT=$PDK_ROOT -u $(id -u $USER):$(id -g $USER) efabless/openlane:v0.21'
# Since we have aliased the long command to 'docker' we can invoke the OpenLANE flow docker sub-system by just running this command
docker
```

```
# Now that we have entered the OpenLANE flow contained docker sub-system we can invoke the OpenLANE flow in the Interactive mode using the following command
./flow.tcl -interactive

# Now that OpenLANE flow is open we have to input the required packages for proper functionality of the OpenLANE flow
package require openlane 0.9

# Now the OpenLANE flow is ready to run any design and initially we have to prep the design creating some necessary files and directories for running a specific design which in our case is 'picorv32a'
prep -design picorv32a

# Now that the design is prepped and ready, we can run synthesis using following command
run_synthesis

# Now we can run floorplan
run_floorplan
```
**Screenshots**

![run_FP1](https://github.com/user-attachments/assets/c600824c-acf1-4df7-8cfb-b640b7f8a3ec)

![FP2](https://github.com/user-attachments/assets/7e7832be-49cf-4e65-87bb-91b41cf4162c)

**2. Calculate the die area in microns from the values in floorplan def.**

![FP_def_file](https://github.com/user-attachments/assets/38248290-fe4b-4436-b30b-6e8874f9493b)

![die_area2](https://github.com/user-attachments/assets/3286db44-dba9-46b6-9c2e-fd451b6cc2a1)

According to floorplan def
	1000   Unit Distance  = 1 micron
	Die width in unit distance = 660685 − 0 = 660685
	Die height in unit distance = 671405 − 0 = 671405
	Distance in microns = Value in unit distance / 1000
	Die width in microns = 660685/1000 = 660.685 microns
	Die height in microns = 671405/1000 = 671.405 microns
	Are os die in microns = 660.685 ∗ 671.405 = 443587.212425 square microns
 
3. Load generated floorplan def in magic tool and explore the floorplan.

   Commands to load floorplan def in magic in another terminal
```
# Change directory to path containing generated floorplan def
cd Desktop/work/tools/openlane_working_dir/openlane/designs/picorv32a/runs/17-03_12-06/results/floorplan/

# Command to load the floorplan def in magic tool
magic -T /home/vsduser/Desktop/work/tools/openlane_working_dir/pdks/sky130A/libs.tech/magic/sky130A.tech lef read ../../tmp/merged.lef def read picorv32a.floorplan.def &
```
**Screenshots:**
![FP_MAGIC1](https://github.com/user-attachments/assets/09a9871d-6767-4ccd-b89f-3348cf944836)

![magic_1](https://github.com/user-attachments/assets/b79f2814-9ed2-4ad8-9d6f-f8252a601103)

Equidistant placement of ports:
![equidistant_ports](https://github.com/user-attachments/assets/a694dcd1-dd95-4ad1-8e0f-3331f4a02240)

Port layer as set through config.tcl
![port_layer](https://github.com/user-attachments/assets/70d193ec-1126-47b4-8f60-3de097ab21d5)

![vertical_port_layer](https://github.com/user-attachments/assets/6095ed2e-e753-403a-98b6-f0b4a25f8a1e)

Decap Cells and Tap Cells

![tap_cell](https://github.com/user-attachments/assets/05478254-8571-41cb-b063-9c6e0b01244a)

Diogonally equidistant Tap cells

![diagonally_equidistant](https://github.com/user-attachments/assets/61ebe138-0047-423e-b373-8edc80007552)

Unplaced standard cells at the origin

![std_cell](https://github.com/user-attachments/assets/4415d510-ffb9-423b-b889-ed032e00be3f)


**4. Run 'picorv32a' design congestion aware placement using OpenLANE flow and generate necessary outputs.**
Command to run placement
```
# Congestion aware placement by default
run_placement
```
![placement_2](https://github.com/user-attachments/assets/2a7f6d9f-d6c1-42b9-912c-9c2cbfa25da5)


**5. Load generated placement def in magic tool and explore the placement.**
Commands to load placement def in magic in another terminal
```
# Change directory to path containing generated placement def
cd Desktop/work/tools/openlane_working_dir/openlane/designs/picorv32a/runs/17-03_12-06/results/placement/

# Command to load the placement def in magic tool
magic -T /home/vsduser/Desktop/work/tools/openlane_working_dir/pdks/sky130A/libs.tech/magic/sky130A.tech lef read ../../tmp/merged.lef def read picorv32a.placement.def &
```
**Screenshots:**

![PL_def_in_magic](https://github.com/user-attachments/assets/eb9d3119-4f7f-4fd7-8b33-8e90bdb3eb07)

Standard cells legally placed
![Uploading std_cell_legally_placed.png.png…]()

Commands to exit from current run
```
# Exit from OpenLANE flow
exit

# Exit from OpenLANE flow docker sub-system
exit
```

-----
## Day3: Design Library Cell Using Magic Layout and Cell characterization :

Tasks:
   1. Clone custom inverter standard cell design from github repository: Standard cell design and characterization using OpenLANE flow.
   2. Load the custom inverter layout in magic and explore.
   3. Spice extraction of inverter in magic.
   4. Editing the spice model file for analysis through simulation.
   5. Post-layout ngspice simulations.
   6. Find problem in the DRC section of the old magic tech file for the skywater process and fix them.

## 1. Clone custom inverter standard cell design from github repository
```
# Change directory to openlane
cd Desktop/work/tools/openlane_working_dir/openlane

# Clone the repository with custom inverter design
git clone https://github.com/nickson-jose/vsdstdcelldesign

# Change into repository directory
cd vsdstdcelldesign

# Copy magic tech file to the repo directory for easy access
cp /home/vsduser/Desktop/work/tools/openlane_working_dir/pdks/sky130A/libs.tech/magic/sky130A.tech .

# Check contents whether everything is present
ls

# Command to open custom inverter layout in magic
magic -T sky130A.tech sky130_inv.mag &
```
![cmnd_screenshot](https://github.com/user-attachments/assets/1e2a4c1e-4db2-4bdc-9b17-49c01f539367)

----
2. Load the custom inverter layout in magic and explore.

Screenshot of custom inverter layout in magic
![inverter](https://github.com/user-attachments/assets/54a491b3-c6f8-4781-8dde-b9d9e74b2940)

NMOS PMOS identified

![nmos_pmos](https://github.com/user-attachments/assets/475f4284-1df2-4625-8622-86cded645ce8)

Output Y connectivity to PMOS and NMOS drain verified
![y](https://github.com/user-attachments/assets/a823a38d-e200-4837-97ff-d693af8d69c7)

PMOS source connectivity to VDD (here VPWR) verified

![pwr](https://github.com/user-attachments/assets/429c56f5-ce31-4b95-b41a-f5d1e91b6e35)

NMOS source connectivity to VSS (here VGND) verified
![gnd](https://github.com/user-attachments/assets/c37f8a0f-ef27-4e4b-b791-34baa26b5ba8)

Deleting necessary layout part to see DRC error

![drc_err](https://github.com/user-attachments/assets/01fb9050-ecaf-4ed1-9551-2abe17c56dc5)

-----
3.Spice extraction of inverter in magic.

Commands for spice extraction of the custom inverter layout to be used in tkcon window of magic
```
# Check current directory
pwd

# Extraction command to extract to .ext format
extract all

# Before converting ext to spice this command enable the parasitic extraction also
ext2spice cthresh 0 rthresh 0

# Converting to ext to spice
ext2spice
```
Screenshot of tkcon window after running above commands

![spice_netlist_cmnds](https://github.com/user-attachments/assets/d39416fa-214f-41ac-84e0-c3faa7bbfda6)

Screenshot of created spice file
![spice_file](https://github.com/user-attachments/assets/5199af94-7b0b-4085-851a-d22ea6c9eaa4)

------
4. Editing the spice model file for analysis through simulation.

Measuring unit distance in layout grid

![reading_grid](https://github.com/user-attachments/assets/d678af19-58f1-4bab-81ce-c0f86b744894)

Final edited spice file ready for ngspice simulation

![edited_netlist](https://github.com/user-attachments/assets/0446061b-3592-45cc-99e8-c6cf18052be2)

----
5. Post-layout ngspice simulations.
   
Commands for ngspice simulation
```
# Command to directly load spice file for simulation to ngspice
ngspice sky130_inv.spice

# Now that we have entered ngspice with the simulation spice file loaded we just have to load the plot
plot y vs time a
```
Screenshots of ngspice run

![ngspice_open](https://github.com/user-attachments/assets/7d46d6f6-ae73-4fc5-b141-00283fb7e85c)

![ngspice_sim2_plot](https://github.com/user-attachments/assets/c46fbba7-de84-42bb-8157-1c7bcb109136)

Screenshot of generated plot
![ngspice_gen_plot1](https://github.com/user-attachments/assets/741d6914-eff8-4bf5-88df-4b2d2486d1bb)

**Rise transition time calculation**
	Rise Transition Time  = Time taken for output to rise to 80% − Time taken for output to rise to 20%
	20% of output (3.3V) = 0.66V
	20% of output (3.3V) = 2.64V

20% Screenshots

![20%_screenshot](https://github.com/user-attachments/assets/3de8a797-9dc4-460e-8780-05d8cc77d205)

80% Screenshot
![80%screenshot](https://github.com/user-attachments/assets/75d75b25-0e20-40c5-8886-d3bc5ea22e9b)

 	Rise Transition Time = 2.24435 - 2.1815 = 0.06285 ns = 62.85 ps

Fall Transition Time  = Time taken for output to fall to 80% − Time taken for output to fall to 20%
	20% of output (3.3V) = 0.66V
	20% of output (3.3V) = 2.64V

20% Screenshots
![output_fall_20%](https://github.com/user-attachments/assets/9bd92b92-8a5f-4eee-80c8-bb10149bb494)


80% Screenshot
![output_fall_80%](https://github.com/user-attachments/assets/c623c8b2-d937-4970-929d-140ef70f5e7e)

 	Fall Transition Time = 4.09488 - 4.05239 = 0.04249 ns = 42.49 ps

Rise Cell Delay Calculation
	Rise cell delay = Time taken by output to rise to 50% − Time taken by input to fall to 50% 
	50 % of 3.3V = 1.65V 

50% Screenshots
![rise_time_50%](https://github.com/user-attachments/assets/a87f7b01-0f02-4d8f-a681-aeb8afbc7494)

	Rise cell delay = 2.21 - 2.14993 = 0.06007 ns = 60.07 ps

Fall Cell Delay Calculation
	Fall cell delay = Time taken by output to fall to 50% − Time taken by input to rise to 50% 
	50 % of 3.3V = 1.65V

50% Screenshots

![fall_time_50%](https://github.com/user-attachments/assets/53f84107-7fd5-427f-a7a3-b2277b03df93)

	Fall cell delay = 4.07713−4.05 = 0.02713 ns = 27.13 ps

-----
6. Find problem in the DRC section of the old magic tech file for the skywater process and fix them.


Link to Sky130 Periphery rules: https://skywater-pdk.readthedocs.io/en/main/rules/periphery.html

Commands to download and view the corrupted skywater process magic tech file and associated files to perform drc corrections
```
# Change to home directory
cd

# Command to download the lab files
wget http://opencircuitdesign.com/open_pdks/archive/drc_tests.tgz

# Since lab file is compressed command to extract it
tar xfz drc_tests.tgz

# Change directory into the lab folder
cd drc_tests

# List all files and directories present in the current directory
ls -al

# Command to view .magicrc file
gvim .magicrc

# Command to open magic tool in better graphics
magic -d XR &
```
Screenshots of commands run
![part6_1](https://github.com/user-attachments/assets/aa1ddf70-1bc8-4103-8af5-5d3daca89e49)


Screenshot of .magicrc file
![part6_1_file](https://github.com/user-attachments/assets/8f4130a2-44b7-4d20-9c6b-550064d5c5b4)

**Incorrectly implemented poly.9 simple rule correction**

Screenshot of poly rules  
![part6_periphery_rules](https://github.com/user-attachments/assets/d981f849-3d57-428d-b18c-21a8d213631f)

Incorrectly implemented poly.9 rule no drc violation even though spacing < 0.48u

![part6_polyDRC_violation](https://github.com/user-attachments/assets/4c870789-2ffb-4074-a345-90d1ce64dc84)

New commands inserted in sky130A.tech file to update drc

![part6_newDRCrule1](https://github.com/user-attachments/assets/3c7592b0-96fe-4423-b25b-939f62725731)

![part6_drc_rule_new2](https://github.com/user-attachments/assets/1fa6271b-1862-4e98-a4b0-b8ef8230ae75)

Commands to run in tkcon window
```
# Loading updated tech file
tech load sky130A.tech

# Must re-run drc check to see updated drc errors
drc check

# Selecting region displaying the new errors and getting the error messages 
drc why
```
Screenshot of magic window with rule implemented

![Uploading part6_drc_rule_check2.png…]()


----
## Day4: Pre-Layout timing analysis and Importance of good clock tree :



-----
## Day5: Final steps for RTL2GDS using tritonRoute and openSTA :




-----
## References

*  https://forgefunder.com/~kunal/riscv_workshop.vdi
*  https://gcc.gnu.org/onlinedocs/gcc/RISC-V-Options.html
*  https://github.com/vinayrayapati/rv32i
*  [https://github.com/stevehoover](https://github.com/stevehoover/RISC-V_MYTH_Workshop)
*  https://makerchip.com/sandbox
*  https://gcc.gnu.org/onlinedocs/gcc/RISC-V-Options.html
*  https://github.com/manili/VSDBabySoC.git
*  https://github.com/kunalg123/sky130RTLDesignAndSynthesisWorkshop.git
*  https://github.com/bhargav-vlsi/ASIC-Design-IIITB.git
*  https://github.com/KanishR1/Introduction-to-ASIC-Flow.git
*  https://github.com/Subhasis-Sahu/SFAL-VSD/blob
*  https://www.udemy.com/course/vlsi-academy-sta-checks/?couponCode=3D425F2B9705E44298A9
*  https://www.udemy.com/course/vlsi-academy-sta-checks-2/?couponCode=952614A18B598B2B0623*  
*  https://github.com/arunkpv/vsd-hdp/blob/main/docs/Day_19.md#day-19---pvt-corner-analysis-post-synthesis-timing-of-the-risc-v-cpu-design
  

------

