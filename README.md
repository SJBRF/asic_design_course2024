
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
14. [Lab13: Advanced Physical Design Using Openlane/Sky130 Wokshop](#Lab13-Advanced-Physical-Design-Using-OpenlaneSky130-Wokshop)
    
    * [Day1: Inception of open-source EDA, OpenLANE and Sky130 PDK](#Day1-Inception-of-open-source-EDA-OpenLANE-and-Sky130-PDK)
    * [Day2: Good Floorpan vs Bad Floorplan and Introduction to Library Cell](#Day2-Good-Floorpan-vs-Bad-Floorplan-and-Introduction-to-Library-Cell)
    * [Day3: Design Library Cell Using Magic Layout and Cell characterization](#Day3-Design-Library-Cell-Using-Magic-Layout-and-Cell-characterization)
    * [Day4: Pre-Layout timing analysis and Importance of good clock tree](#Day4-Pre-Layout-timing-analysis-and-Importance-of-good-clock-tree)
    * [Day5: Final steps for RTL2GDS using tritonRoute and openSTA](#Day5-Final-steps-for-RTL2GDS-using-tritonRoute-and-openSTA)
15. [Lab 14: RTL2GDS of VSDbabysoc using Openroad](#Lab-14-RTL2GDS-of-VSDbabysoc-using-Openroad)        
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
# Lab13: Advanced Physical Design Using Openlane/Sky130 Wokshop:

## Theory:

**Package**

* In any embedded board we have seen, the part of the board we consider as the chip is only the PACKAGE of the chip which is nothing but a protective layer or packet bound over the actual chip and the actual manufatured chip is usually present at the center of a package wherein, the connections from package is fed to the chip by WIRE BOUND method which is none other than basic wired connection.

  ![image](https://github.com/user-attachments/assets/190b4c19-7a10-4526-a449-c61955ef81e9)

  ![image](https://github.com/user-attachments/assets/140d21ef-072e-44ba-9412-fe6485b6e3cf)

  ![image](https://github.com/user-attachments/assets/8f941ff2-8377-44df-9c29-829f2d656ccd)


**Chip**

* Now, taking a look inside the chip, all the signals from the external world to the chip and vice versa is passed through PADS. The area bound by the pads is CORE where all the digital logic of the chip is placed. Both the core and pads make up the DIE which is the basic manufacturing unit in regards to semiconductor chips.

![image](https://github.com/user-attachments/assets/07531d75-0042-4124-8e5d-e6a1315bdfa1)


**Foundry**

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
## Day1: Inception of open-source EDA, OpenLANE and Sky130 PDK:

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
## Day2: Good Floorpan vs Bad Floorplan and Introduction to Library Cell:
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

## Day3: Design Library Cell Using Magic Layout and Cell characterization:

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

## Day4: Pre-Layout timing analysis and Importance of good clock tree:

**Theory**

**Implementation**

## 1. Fix up small DRC errors and verify the design is ready to be inserted into our flow.

Conditions to be verified before moving forward with custom designed cell layout:

*	Condition 1: The input and output ports of the standard cell should lie on the intersection of the vertical and horizontal tracks.
*	Condition 2: Width of the standard cell should be odd multiples of the horizontal track pitch.
*	Condition 3: Height of the standard cell should be even multiples of the vertical track pitch.

Commands to open the custom inverter layout
```
# Change directory to vsdstdcelldesign
cd Desktop/work/tools/openlane_working_dir/openlane/vsdstdcelldesign

# Command to open custom inverter layout in magic
magic -T sky130A.tech sky130_inv.mag &
```
# Change directory to vsdstdcelldesign
cd Desktop/work/tools/openlane_working_dir/openlane/vsdstdcelldesign

# Command to open custom inverter layout in magic
```
magic -T sky130A.tech sky130_inv.mag &
```
Screenshot of tracks.info of sky130_fd_sc_hd

![1](https://github.com/user-attachments/assets/7df1d6b1-dcc2-4623-80f2-2c732894a516)

Commands for tkcon window to set grid as tracks of locali layer

```
# Get syntax for grid command
help grid

# Set grid values accordingly
grid 0.46um 0.34um 0.23um 0.17um
```

Screenshot of commands run in tkcon 

![2](https://github.com/user-attachments/assets/af417f09-6690-42c4-a26d-d7f3e98e45c3)

Condition 1 verified

![3](https://github.com/user-attachments/assets/9baada40-daaa-4a96-b98f-367499a29cdd)

Condition 2 verified

 				Horizontal Track Pitch = 0.46 um 
![4](https://github.com/user-attachments/assets/12a5681b-8639-44cf-b934-b2c694a26af1)

			Width of the standard cell = 0.46 ∗ 3  = 1.38um 

Condition 3 verified

				Vertical track pitch = 0.34um

![5](https://github.com/user-attachments/assets/8ebb6cbc-c595-42a3-9819-f8abf94dcbb7)

			Height of the standard cell = 0.34 ∗ 8 = 2.72um 


**2. Save the finalized layout with custom name and open it.**

Command for tkcon window to save the layout with custom name
```
# Command to save as
save sky_130_priinv.mag
```
![1](https://github.com/user-attachments/assets/01670cd0-150c-4a4e-9f43-c7985671ca06)

Command to open the newly saved layout

```
# Command to open custom inverter layout in magic
magic -T sky130A.tech sky_130_priinv.mag &
```
![1](https://github.com/user-attachments/assets/cd68f26e-29be-45ca-b6d9-00cb19ebf304)


**3. Generate lef from the layout.**

Command for tkcon window to write lef
```
# lef command
lef write
```
![2](https://github.com/user-attachments/assets/b9c5172f-bc3b-4f69-bf99-2472f4e47bc3)

![1](https://github.com/user-attachments/assets/82458630-108c-4147-be38-cfc139eb7669)

**4. Copy the newly generated lef and associated required lib files to 'picorv32a' design 'src' directory.**

Commands to copy necessary files to 'picorv32a' design 'src' directory

```
# Copy lef file
cp sky_130_priinv.lef ~/Desktop/work/tools/openlane_working_dir/openlane/designs/picorv32a/src/

# List and check whether it's copied
ls ~/Desktop/work/tools/openlane_working_dir/openlane/designs/picorv32a/src/

# Copy lib files
cp libs/sky130_fd_sc_hd__* ~/Desktop/work/tools/openlane_working_dir/openlane/designs/picorv32a/src/

# List and check whether it's copied
ls ~/Desktop/work/tools/openlane_working_dir/openlane/designs/picorv32a/src/
```
Screenshot of commands run

![1](https://github.com/user-attachments/assets/a7c6aae6-9f67-4a05-9395-3e8f1e520c58)

**5. Edit 'config.tcl' to change lib file and add the new extra lef into the openlane flow.**

Commands to be added to config.tcl to include our custom cell in the openlane flow
```
set ::env(LIB_SYNTH) "$::env(OPENLANE_ROOT)/designs/picorv32a/src/sky130_fd_sc_hd__typical.lib"
set ::env(LIB_FASTEST) "$::env(OPENLANE_ROOT)/designs/picorv32a/src/sky130_fd_sc_hd__fast.lib"
set ::env(LIB_SLOWEST) "$::env(OPENLANE_ROOT)/designs/picorv32a/src/sky130_fd_sc_hd__slow.lib"
set ::env(LIB_TYPICAL) "$::env(OPENLANE_ROOT)/designs/picorv32a/src/sky130_fd_sc_hd__typical.lib"

set ::env(EXTRA_LEFS) [glob $::env(OPENLANE_ROOT)/designs/$::env(DESIGN_NAME)/src/*.lef]
```

Edited config.tcl to include the added lef and change library to ones we added in src directory

![1](https://github.com/user-attachments/assets/f1590e86-3140-4763-b9b3-805c6c694275)

**6. Run openlane flow synthesis with newly inserted custom inverter cell.**

Commands to invoke the OpenLANE flow include new lef and perform synthesis

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

# Adiitional commands to include newly added lef to openlane flow
set lefs [glob $::env(DESIGN_DIR)/src/*.lef]
add_lefs -src $lefs

# Now that the design is prepped and ready, we can run synthesis using following command
run_synthesis
```
Screenshots of commands run

![1](https://github.com/user-attachments/assets/d41c5263-0f43-49b4-9a60-635ca1a69f45)

![2](https://github.com/user-attachments/assets/b3597dc5-40fb-470d-807e-b797547b3de9)

![3](https://github.com/user-attachments/assets/8820a08b-d960-4ce6-ad8a-93033710f22a)

**7. Remove/reduce the newly introduced violations with the introduction of custom inverter cell by modifying design parameters.**

Noting down current design values generated before modifying parameters to improve timing

Chip area and tns and wns screenshot
![chip_area](https://github.com/user-attachments/assets/40bf32ce-60a0-4a9e-95ce-e3f0cad46b66)

Commands to view and change parameters to improve timing and run synthesis

```
# Now once again we have to prep design so as to update variables
prep -design picorv32a -tag 12-11_17-13 -overwrite

# Addiitional commands to include newly added lef to openlane flow merged.lef
set lefs [glob $::env(DESIGN_DIR)/src/*.lef]
add_lefs -src $lefs

# Command to display current value of variable SYNTH_STRATEGY
echo $::env(SYNTH_STRATEGY)

# Command to set new value for SYNTH_STRATEGY
set ::env(SYNTH_STRATEGY) "DELAY 3"

# Command to display current value of variable SYNTH_BUFFERING to check whether it's enabled
echo $::env(SYNTH_BUFFERING)

# Command to display current value of variable SYNTH_SIZING
echo $::env(SYNTH_SIZING)

# Command to set new value for SYNTH_SIZING
set ::env(SYNTH_SIZING) 1

# Command to display current value of variable SYNTH_DRIVING_CELL to check whether it's the proper cell or not
echo $::env(SYNTH_DRIVING_CELL)

# Now that the design is prepped and ready, we can run synthesis using following command
run_synthesis
```
Screenshot of merged.lef in tmp directory with our custom inverter as macro

![merge_lef](https://github.com/user-attachments/assets/f7659312-dcd7-4e2e-b9ab-7054901ae0c4)

Screenshots of commands run

![overwrite_cmnd](https://github.com/user-attachments/assets/4ea4db18-c7e8-41be-be42-33a8e7036757)

Comparing to previously noted run values area has increased and worst negative slack has become 0

![5](https://github.com/user-attachments/assets/a0b610cf-b631-4334-944c-74bd6c331844)

![6](https://github.com/user-attachments/assets/6749f652-9737-492b-a9f4-eabe316be297)

![term 5](https://github.com/user-attachments/assets/cc23dc1f-59f0-4fb9-ae1c-68da7c8ccb06)


**8. Once synthesis has accepted our custom inverter we can now run floorplan and placement and verify the cell is accepted in PnR flow.**

Now that our custom inverter is properly accepted in synthesis we can now run floorplan using following command

```
# Now we can run floorplan
run_floorplan
```
Screenshots of command run

![1](https://github.com/user-attachments/assets/d6ff997d-087d-4929-b1ee-ff14e3fd0403)


Since we are facing unexpected un-explainable error while using run_floorplan command, we can instead use the following set of commands available based on information from Desktop/work/tools/openlane_working_dir/openlane/scripts/tcl_commands/floorplan.tcl and also based on Floorplan Commands section in Desktop/work/tools/openlane_working_dir/openlane/docs/source/OpenLANE_commands.md

```
# Follwing commands are all together sourced in "run_floorplan" command
init_floorplan
place_io
tap_decap_or
```
Screenshots of commands run

![term 6](https://github.com/user-attachments/assets/33ceef77-8da8-429d-ab53-0885461b1ea6)

![term 7](https://github.com/user-attachments/assets/bc6dfbe8-7624-4ccc-99a9-bd0f89aa880e)

Now that floorplan is done we can do placement using following command

```
# Now we are ready to run placement
run_placement
```
Screenshots of command run
![term 7](https://github.com/user-attachments/assets/53895b2f-de2f-4a77-8a34-d35d3c69769f)

![term 8](https://github.com/user-attachments/assets/9dd3c932-28ec-4396-b85e-5e71b4768c56)


Commands to load placement def in magic in another terminal
```
# Change directory to path containing generated placement def
cd Desktop/work/tools/openlane_working_dir/openlane/designs/picorv32a/runs/13-11_16-53/results/placement/

# Command to load the placement def in magic tool
magic -T /home/vsduser/Desktop/work/tools/openlane_working_dir/pdks/sky130A/libs.tech/magic/sky130A.tech lef read ../../tmp/merged.lef def read picorv32a.placement.def &
```
![term 1](https://github.com/user-attachments/assets/92235e65-9f51-430e-8c61-754adae92336)

Screenshot of placement def in magic

![magic 4](https://github.com/user-attachments/assets/7a78b487-c4bd-41bb-b0b2-7c848a55d8d7)

Command for tkcon window to view internal layers of cells
```
# Command to view internal connectivity layers
expand
```
Abutment of power pins with other cell from library clearly visible

![magic 5](https://github.com/user-attachments/assets/7df68330-3799-4086-86cb-e865ac3788d9)

**9. Do Post-Synthesis timing analysis with OpenSTA tool.**

Since we are having 0 wns after improved timing run we are going to do timing analysis on initial run of synthesis which has lots of violations and no parameters were added to improve timing

Commands to invoke the OpenLANE flow include new lef and perform synthesis
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

# Adiitional commands to include newly added lef to openlane flow
set lefs [glob $::env(DESIGN_DIR)/src/*.lef]
add_lefs -src $lefs

# Command to set new value for SYNTH_SIZING
set ::env(SYNTH_SIZING) 1

# Now that the design is prepped and ready, we can run synthesis using following command
run_synthesis
```
Commands run final screenshot

![1](https://github.com/user-attachments/assets/17e2670c-66c8-424b-9f91-d3d5b4fe04b5)

![2](https://github.com/user-attachments/assets/58356849-22dd-4085-9d25-133bf6ee459c)

Newly created pre_sta.conf for STA analysis in openlane directory

![3](https://github.com/user-attachments/assets/7840a9b0-4925-4df6-8023-eb18c988b922)

Newly created my_base.sdc for STA analysis in openlane/designs/picorv32a/src directory based on the file openlane/scripts/base.sdc

![4](https://github.com/user-attachments/assets/d29a54cd-11ad-4b55-93a2-72f28adec131)

Commands to run STA in another terminal
```
# Change directory to openlane
cd Desktop/work/tools/openlane_working_dir/openlane

# Command to invoke OpenSTA tool with script
sta pre_sta.conf
```
Screenshots of commands run

![6](https://github.com/user-attachments/assets/2a4b25c3-20db-4258-8bd9-7533dc6e7aa9)

![7](https://github.com/user-attachments/assets/f6cb0b54-011e-4791-8d74-504029009ad2)

Since more fanout is causing more delay we can add parameter to reduce fanout and do synthesis again

Commands to include new lef and perform synthesis

```
# Now the OpenLANE flow is ready to run any design and initially we have to prep the design creating some necessary files and directories for running a specific design which in our case is 'picorv32a'
prep -design picorv32a -tag 13-11_16-53 -overwrite

# Adiitional commands to include newly added lef to openlane flow
set lefs [glob $::env(DESIGN_DIR)/src/*.lef]
add_lefs -src $lefs

# Command to set new value for SYNTH_SIZING
set ::env(SYNTH_SIZING) 1

# Command to set new value for SYNTH_MAX_FANOUT
set ::env(SYNTH_MAX_FANOUT) 4

# Command to display current value of variable SYNTH_DRIVING_CELL to check whether it's the proper cell or not
echo $::env(SYNTH_DRIVING_CELL)

# Now that the design is prepped and ready, we can run synthesis using following command
run_synthesis
```
Commands run final screenshot

![1](https://github.com/user-attachments/assets/f6a2f7d1-63d7-4347-8f1a-9bb1a06c684e)

![2](https://github.com/user-attachments/assets/159e5223-4e7e-4d42-a87d-2a93bf8ce739)

**10. Make timing ECO fixes to remove all violations.**

OR gate of drive strength 2 is driving 4 fanouts

![2](https://github.com/user-attachments/assets/8cd69a08-4627-4dee-8f8c-91cfa05cc2e8)

Commands to perform analysis and optimize timing by replacing with OR gate of drive strength 4

```
# Reports all the connections to a net
report_net -connections _11672_

# Checking command syntax
help replace_cell

# Replacing cell
replace_cell _14510_ sky130_fd_sc_hd__or3_4

# Generating custom timing report
report_checks -fields {net cap slew input_pins} -digits 4
```
Result - slack reduced

![1](https://github.com/user-attachments/assets/d483af9e-be3d-4e29-8b0b-cc98d54353fc)

OR gate of drive strength 2 driving OA gate has more delay

![2nd_trial1](https://github.com/user-attachments/assets/4ac97257-f06a-4a98-8325-2a599111d457)

Commands to perform analysis and optimize timing by replacing with OR gate of drive strength 4

```
# Reports all the connections to a net
report_net -connections _10534_

# Replacing cell
replace_cell _14481_ sky130_fd_sc_hd__or4_4

# Generating custom timing report
report_checks -fields {net cap slew input_pins} -digits 4
```
Result - slack reduced

![3](https://github.com/user-attachments/assets/077b8b2d-6c82-4ff2-b626-bf9636ce1d79)

OR gate of drive strength 2 driving OA gate has more delay

![4](https://github.com/user-attachments/assets/7caaca43-9fe5-4181-a4d3-4c607af455e3)

Commands to perform analysis and optimize timing by replacing with OR gate of drive strength 4

```
# Reports all the connections to a net
report_net -connections _11643_

# Replacing cell
replace_cell _14506_ sky130_fd_sc_hd__or4_4

# Generating custom timing report
report_checks -fields {net cap slew input_pins} -digits 4
```
Result - slack reduced

![5](https://github.com/user-attachments/assets/531ef5b8-a248-40ba-a440-2156ebd12731)

OR gate of drive strength 2 driving OA gate has more delay

![6](https://github.com/user-attachments/assets/51b798c9-a78c-482b-8297-1df86a0481b1)

Commands to perform analysis and optimize timing by replacing with OR gate of drive strength 4
```
# Reports all the connections to a net
report_net -connections _11668_

# Replacing cell
replace_cell _14506_ sky130_fd_sc_hd__or4_4

# Generating custom timing report
report_checks -fields {net cap slew input_pins} -digits 4
```
Result - slack reduced

![7](https://github.com/user-attachments/assets/acb25caf-a52d-40a4-90ac-0012ab984b56)

We started ECO fixes at wns -35.45 and now we stand at wns -34.1833 we reduced around 1.2667 ns of violation

**11. Replace the old netlist with the new netlist generated after timing ECO fix and implement the floorplan, placement and cts.**

Now to insert this updated netlist to PnR flow and we can use write_verilog and overwrite the synthesis netlist but before that we are going to make a copy of the old old netlist

Commands to make copy of netlist

```
# Change from home directory to synthesis results directory
cd Desktop/work/tools/openlane_working_dir/openlane/designs/picorv32a/runs/13-11_16-53/results/synthesis/

# List contents of the directory
ls

# Copy and rename the netlist
cp picorv32a.synthesis.v picorv32a.synthesis_old.v

# List contents of the directory
ls
```

Screenshot of commands run

![1](https://github.com/user-attachments/assets/e01c35f5-7ae7-4b3f-9d11-6a869166b1e3)

Commands to write verilog
```
# Check syntax
help write_verilog

# Overwriting current synthesis netlist
write_verilog /home/vsduser/Desktop/work/tools/openlane_working_dir/openlane/designs/picorv32a/runs/13-11_1653/results/synthesis/picorv32a.synthesis.v

# Exit from OpenSTA since timing analysis is done
exit
```
Screenshot of commands run
![2](https://github.com/user-attachments/assets/fe6e99b8-8477-4c6a-aa58-e6d1c6999201)

Verified that the netlist is overwritten by checking that instance _14506_ is replaced with sky130_fd_sc_hd__or4_4

![3](https://github.com/user-attachments/assets/875533b4-d658-4fed-b8ec-bdbc5f50f8a2)

Since we confirmed that netlist is replaced and will be loaded in PnR but since we want to follow up on the earlier 0 violation design we are continuing with the clean design to further stages

Commands load the design and run necessary stages

```
# Now once again we have to prep design so as to update variables
prep -design picorv32a -tag 13-11_16-53 -overwrite

# Addiitional commands to include newly added lef to openlane flow merged.lef
set lefs [glob $::env(DESIGN_DIR)/src/*.lef]
add_lefs -src $lefs

# Command to set new value for SYNTH_STRATEGY
set ::env(SYNTH_STRATEGY) "DELAY 3"

# Command to set new value for SYNTH_SIZING
set ::env(SYNTH_SIZING) 1

# Now that the design is prepped and ready, we can run synthesis using following command
run_synthesis

# Follwing commands are alltogather sourced in "run_floorplan" command
init_floorplan
place_io
tap_decap_or

# Now we are ready to run placement
run_placement

# Incase getting error
unset ::env(LIB_CTS)

# With placement done we are now ready to run CTS
run_cts
```
Screenshots of commands run

![4](https://github.com/user-attachments/assets/4e589a3c-2b77-411a-b5d7-4ef821d4a290)

![5](https://github.com/user-attachments/assets/6985db3c-52f4-4dc4-8ec2-ed574af22ecf)

![6](https://github.com/user-attachments/assets/82b6ace9-e7cb-4b63-8d77-23befcddfde7)

![7](https://github.com/user-attachments/assets/b49b65ab-d122-4ca6-80e4-642202eac317)

**12. Post-CTS OpenROAD timing analysis.**

Commands to be run in OpenLANE flow to do OpenROAD timing analysis with integrated OpenSTA in OpenROAD
```
# Command to run OpenROAD tool
openroad

# Reading lef file
read_lef /openLANE_flow/designs/picorv32a/runs/13-11_16-53/tmp/merged.lef

# Reading def file
read_def /openLANE_flow/designs/picorv32a/runs/13-11_16-53/results/cts/picorv32a.cts.def

# Creating an OpenROAD database to work with
write_db pico_cts.db

# Loading the created database in OpenROAD
read_db pico_cts.db

# Read netlist post CTS
read_verilog /openLANE_flow/designs/picorv32a/runs/12-11_23-00/results/synthesis/picorv32a.synthesis_cts.v

# Read library for design
read_liberty $::env(LIB_SYNTH_COMPLETE)

# Link design and library
link_design picorv32a

# Read in the custom sdc we created
read_sdc /openLANE_flow/designs/picorv32a/src/my_base.sdc

# Setting all cloks as propagated clocks
set_propagated_clock [all_clocks]

# Check syntax of 'report_checks' command
help report_checks

# Generating custom timing report
report_checks -path_delay min_max -fields {slew trans net cap input_pins} -format full_clock_expanded -digits 4

# Exit to OpenLANE flow
exit
```
Screenshots of commands run and timing report generated

![1](https://github.com/user-attachments/assets/9cd9be89-c2d9-42ac-b6e6-884822fceeb3)

![2](https://github.com/user-attachments/assets/9e217bc4-1a89-4fbf-a73e-4e60d07e9175)

![3](https://github.com/user-attachments/assets/65a67330-d9e2-4fdf-bee3-9f49e2bf7a15)


**13. Explore post-CTS OpenROAD timing analysis by removing 'sky130_fd_sc_hd__clkbuf_1' cell from clock buffer list variable 'CTS_CLK_BUFFER_LIST'.**

Commands to be run in OpenLANE flow to do OpenROAD timing analysis after changing CTS_CLK_BUFFER_LIST

```
# Checking current value of 'CTS_CLK_BUFFER_LIST'
echo $::env(CTS_CLK_BUFFER_LIST)

# Removing 'sky130_fd_sc_hd__clkbuf_1' from the list
set ::env(CTS_CLK_BUFFER_LIST) [lreplace $::env(CTS_CLK_BUFFER_LIST) 0 0]

# Checking current value of 'CTS_CLK_BUFFER_LIST'
echo $::env(CTS_CLK_BUFFER_LIST)

# Checking current value of 'CURRENT_DEF'
echo $::env(CURRENT_DEF)

# Setting def as placement def
set ::env(CURRENT_DEF) /openLANE_flow/designs/picorv32a/runs/12-11_23-00/results/placement/picorv32a.placement.def

# Run CTS again
run_cts

# Checking current value of 'CTS_CLK_BUFFER_LIST'
echo $::env(CTS_CLK_BUFFER_LIST)

# Command to run OpenROAD tool
openroad

# Reading lef file
read_lef /openLANE_flow/designs/picorv32a/runs/13-11_16-53/tmp/merged.lef

# Reading def file
read_def /openLANE_flow/designs/picorv32a/runs/13-11_16-53/results/cts/picorv32a.cts.def

# Creating an OpenROAD database to work with
write_db pico_cts1.db

# Loading the created database in OpenROAD
read_db pico_cts.db

# Read netlist post CTS
read_verilog /openLANE_flow/designs/picorv32a/runs/13-11_16-53/results/synthesis/picorv32a.synthesis_cts.v

# Read library for design
read_liberty $::env(LIB_SYNTH_COMPLETE)

# Link design and library
link_design picorv32a

# Read in the custom sdc we created
read_sdc /openLANE_flow/designs/picorv32a/src/my_base.sdc

# Setting all cloks as propagated clocks
set_propagated_clock [all_clocks]

# Generating custom timing report
report_checks -path_delay min_max -fields {slew trans net cap input_pins} -format full_clock_expanded -digits 4

# Report hold skew
report_clock_skew -hold

# Report setup skew
report_clock_skew -setup

# Exit to OpenLANE flow
exit

# Checking current value of 'CTS_CLK_BUFFER_LIST'
echo $::env(CTS_CLK_BUFFER_LIST)

# Inserting 'sky130_fd_sc_hd__clkbuf_1' to first index of list
set ::env(CTS_CLK_BUFFER_LIST) [linsert $::env(CTS_CLK_BUFFER_LIST) 0 sky130_fd_sc_hd__clkbuf_1]

# Checking current value of 'CTS_CLK_BUFFER_LIST'
echo $::env(CTS_CLK_BUFFER_LIST)
```
Screenshots of commands run and timing report generated

![1](https://github.com/user-attachments/assets/2df5ecec-4dc7-4960-b32d-ad5959ed7579)

![2](https://github.com/user-attachments/assets/e3bb44d9-b854-4c57-9732-535d426ce0c3)

![3](https://github.com/user-attachments/assets/c363f862-6f28-470a-bbcf-1cd4ad0fb1bd)

![4](https://github.com/user-attachments/assets/160b75cc-ff6a-481a-b126-a6506f735e78)

![5](https://github.com/user-attachments/assets/82b88944-3371-4f73-829c-549264eae7ec)

![6](https://github.com/user-attachments/assets/d41457b7-04c4-4e6e-a5d4-065bc8812822)

------

## Day5: Final steps for RTL2GDS using tritonRoute and openSTA:

**Maze Routing and Lee's algorithm**
------

Routing is the process of establishing a physical connection between two pins. Algorithms designed for routing take source and target pins and aim to find the most efficient path between them, ensuring a valid connection exists.

The Maze Routing algorithm, such as the Lee algorithm, is one approach for solving routing problems. In this method, a grid similar to the one created during cell customization is utilized for routing purposes. The Lee algorithm starts with two designated points, the source and target, and leverages the routing grid to identify the shortest or optimal route between them.

The algorithm assigns labels to neighboring grid cells around the source, incrementing them from 1 until it reaches the target (for instance, from 1 to 7). Various paths may emerge during this process, including L-shaped and zigzag-shaped routes. The Lee algorithm prioritizes selecting the best path, typically favoring L-shaped routes over zigzags. If no L-shaped paths are available, it may resort to zigzag routes. This approach is particularly valuable for global routing tasks.

However, the Lee algorithm has limitations. It essentially constructs a maze and then numbers its cells from the source to the target. While effective for routing between two pins, it can be time-consuming when dealing with millions of pins. There are alternative algorithms that address similar routing challenges.

![image](https://github.com/user-attachments/assets/43a9610f-12bd-49be-a8f4-2d0632a73dbd)

**Design Rule Check (DRC)**
------

DRC verifies whether a design meets the predefined process technology rules given by the foundry for its manufacturing. DRC checking is an essential part of the physical design flow and ensures the design meets manufacturing requirements and will not result in a chip failure. It defines the Quality of chip. They are so many DRCs, let us see few of them

Design rules for physical wires

Minimum width of the wire, Minimum spacing between the wires, Minimum pitch of the wire To solve signal short violation, we take the metal layer and put it on to upper metal layer. we check via rules, Via width, via spacing.

**Power Distribution Network generation**
-----
Unlike the general ASIC flow, Power Distribution Network generation is not a part of floorplan run in OpenLANE. PDN must be generated after CTS and post-CTS STA analyses:

we can check whether PDN has been created or no by check the current def environment variable:  echo $::env(CURRENT_DEF)
```
prep -design picorv32a -tag Run 13-11_00-51
gen_pdn
```
* Once the command is given, power distribution netwrok is generated.
* The power distribution network has to take the design_cts.def as the input def file.
* Power rings,strapes and rails are created by PDN.
* From VDD and VSS pads, power is drawn to power rings.
* Next, the horizontal and vertical strapes connected to rings draw the power from strapes.
* Stapes are connected to rings and these rings are connected to std cells. So, standard cells get power from rails.
* The standard cells are designed such that it's height is multiples of the vertical tracks /track pitch.Here, the pitch is 2.72. Only if the above conditions are adhered it is possible to power the standard cells.
* There are definitions for the straps and the rails. In this design, straps are at metal layer 4 and 5 and the standard cell rails are at the metal layer 1. Vias connect accross the layers as required.
  
![image](https://github.com/user-attachments/assets/c072d0f5-c931-47f2-85fb-14cced783e3f)

**Routing**
-------
In the realm of routing within Electronic Design Automation (EDA) tools, such as both OpenLANE and commercial EDA tools, the routing process is exceptionally intricate due to the vast design space. To simplify this complexity, the routing procedure is typically divided into two distinct stages: Global Routing and Detailed Routing.

The two routing engines responsible for handling these two stages are as follows:

* **Global Routing:** In this stage, the routing region is subdivided into rectangular grid cells and represented as a coarse 3D routing graph. This task is accomplished by the "FASTE ROUTE" engine.
* **Detailed Routing:** Here, finer grid granularity and routing guides are employed to implement the physical wiring. The "tritonRoute" engine comes into play at this stage. "Fast Route" generates initial routing guides, while "Triton Route" utilizes the Global Route information and further refines the routing, employing various strategies and optimizations to determine the most optimal path for connecting the pins.

**Key Features of TritonRoute**
-------

*	Initial Detail Routing: TritonRoute initiates the detailed routing process, providing the foundation for the subsequent routing steps.
*	Adherence to Pre-Processed Route Guides: TritonRoute places significant emphasis on following pre-processed route guides. This involves several actions:
  	*	Initial Route Guide Analysis: TritonRoute analyzes the directions specified in the preferred route guides. If any non-directional routing guides are identified, it breaks them down into unit widths.
   *	Guide Splitting: In cases where non-directional routing guides are encountered, TritonRoute divides them into unit widths to facilitate routing
   *	Guide Merging: TritonRoute merges guides that are orthogonal (touching guides) to the preferred guides, streamlining the routing process.

        Guide Bridging: When it encounters guides that run parallel to the preferred routing guides, TritonRoute employs an additional layer to bridge them, ensuring efficient routing within the preprocessed guides.
    	Assumes route guide for each net satisfy inter guide connectivity Same metal layer with touching guides or neighbouring metal layers with nonzero vertically overlapped area( via are placed ).each unconnected termial i.e., pin of a standard cell instance should have its pin shape overlapped by a routing guide( a black dot(pin) with purple box(metal1 layer)).

In summary, TritonRoute is a sophisticated tool that not only performs initial detail routing but also places a strong emphasis on optimizing routing within pre-processed route guides by breaking down, merging, and bridging them as needed to achieve efficient and effective routing results.

Works on MILP(Mixed Integer linear programming) based panel routing scheme with Intra-layer parallel and Inter-layer sequential routing framework

**TritonRoute problem statement**
---------
```
Inputs : LEF, DEF, Preprocessed route guides
Output : Detailed routing solution with optimized wire length and via count
Constraints : Route guide honoring, connectivity constraints and design rules.
```
The space where the detailed route takes place has been defined. Now TritonRoute handles the connectivity in two ways.

Access Point(AP) : An on-grid point on the metal of the route guide, and is used to connect to lower-layer segments, pins or IO ports,upper-layer segments. Access Point Cluster(APC) : A union of all the Aps derived from same lower-layer segment, a pin or an IO port, upper-layer guide.

**TritonRoute run for routing**
Make sure the CURRENT_DEF is set to pdn.def

Start routing by using
```
run_routing
```
The options for routing can be set in the config.tcl file. The optimisations in routing can also be done by specifying the routing strategy to use different version of TritonRoute Engine. There is a trade0ff between the optimised route and the runtime for routing.

-------

**1. Perform generation of Power Distribution Network (PDN) and explore the PDN layout.**
Commands to perform all necessary stages up until now
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

# Addiitional commands to include newly added lef to openlane flow merged.lef
set lefs [glob $::env(DESIGN_DIR)/src/*.lef]
add_lefs -src $lefs

# Command to set new value for SYNTH_STRATEGY
set ::env(SYNTH_STRATEGY) "DELAY 3"

# Command to set new value for SYNTH_SIZING
set ::env(SYNTH_SIZING) 1

# Now that the design is prepped and ready, we can run synthesis using following command
run_synthesis

# Following commands are alltogather sourced in "run_floorplan" command
init_floorplan
place_io
tap_decap_or

# Now we are ready to run placement
run_placement

# Incase getting error
unset ::env(LIB_CTS)

# With placement done we are now ready to run CTS
run_cts

# Now that CTS is done we can do power distribution network
gen_pdn
```
Screenshots of power distribution network run 
![1_cmnd](https://github.com/user-attachments/assets/cc284e5d-5cc2-4ebe-83c1-309c6d27deca)

![2_pdn1](https://github.com/user-attachments/assets/d58bdcbd-c70e-44d7-b550-5222b3dfbc21)

![3_pdn2](https://github.com/user-attachments/assets/f1e9a2b2-8e72-4717-ad0f-efe1aa0a53d4)

Commands to load PDN def in magic in another terminal
```
# Change directory to path containing generated PDN def
cd Desktop/work/tools/openlane_working_dir/openlane/designs/picorv32a/runs/14-11_10-43/tmp/floorplan/

# Command to load the PDN def in magic tool
magic -T /home/vsduser/Desktop/work/tools/openlane_working_dir/pdks/sky130A/libs.tech/magic/sky130A.tech lef read ../../tmp/merged.lef def read 14-pdn.def &
```
Screenshots of PDN def

![4_magic](https://github.com/user-attachments/assets/374d5d32-1e29-4c26-b5b5-da7d7f32606e)

![5_magic2](https://github.com/user-attachments/assets/71c49995-c9b8-468e-9d46-de16cf573b3e)

![6_magic3](https://github.com/user-attachments/assets/3ca60a92-61a4-48b4-a105-af112765fbaa)

**2. Perfrom detailed routing using TritonRoute and explore the routed layout.**
Command to perform routing
```
# Check value of 'CURRENT_DEF'
echo $::env(CURRENT_DEF)

# Check value of 'ROUTING_STRATEGY'
echo $::env(ROUTING_STRATEGY)

# Command for detailed route using TritonRoute
run_routing
````
Screenshots of routing run

![8_routing1](https://github.com/user-attachments/assets/e25bdd85-5b13-443d-abe4-823fe8826248)


Commands to load routed def in magic in another terminal
```
# Change directory to path containing routed def
cd Desktop/work/tools/openlane_working_dir/openlane/designs/picorv32a/runs/14-11_10-43/results/routing/

# Command to load the routed def in magic tool
magic -T /home/vsduser/Desktop/work/tools/openlane_working_dir/pdks/sky130A/libs.tech/magic/sky130A.tech lef read ../../tmp/merged.lef def read picorv32a.def &
```
Screenshots of routed def

![9_routing_magic1](https://github.com/user-attachments/assets/7667f695-592c-4f46-9f9d-4190b3a0da14)

![10_magic2](https://github.com/user-attachments/assets/00a7606b-6378-455f-b747-a7c6f268b578)

![11_magic3](https://github.com/user-attachments/assets/0c4d1925-b777-45ea-a351-4ab41b636533)

Screenshot of fast route guide present in openlane/designs/picorv32a/runs/14-11_10-43/tmp/routing directory

![fast_route_guide](https://github.com/user-attachments/assets/16921d84-a981-45b8-b60b-2850ef93560c)

**3. Post-Route OpenSTA timing analysis with the extracted parasitics of the route.**

Commands to be run in OpenLANE flow to do OpenROAD timing analysis with integrated OpenSTA in OpenROAD
```
# Command to run OpenROAD tool
openroad

# Reading lef file
read_lef /openLANE_flow/designs/picorv32a/runs/14-11_10-43/tmp/merged.lef

# Reading def file
read_def /openLANE_flow/designs/picorv32a/runs/14-11_10-43/results/routing/picorv32a.def

# Creating an OpenROAD database to work with
write_db pico_route.db

# Loading the created database in OpenROAD
read_db pico_route.db

# Read netlist post CTS
read_verilog /openLANE_flow/designs/picorv32a/runs/14-11_10-43/results/synthesis/picorv32a.synthesis_preroute.v

# Read library for design
read_liberty $::env(LIB_SYNTH_COMPLETE)

# Link design and library
link_design picorv32a

# Read in the custom sdc we created
read_sdc /openLANE_flow/designs/picorv32a/src/my_base.sdc

# Setting all cloks as propagated clocks
set_propagated_clock [all_clocks]

# Read SPEF
read_spef /openLANE_flow/designs/picorv32a/runs/14-11_10-43/results/routing/picorv32a.spef

# Generating custom timing report
report_checks -path_delay min_max -fields {slew trans net cap input_pins} -format full_clock_expanded -digits 4

# Exit to OpenLANE flow
exit
```
Screenshots of commands run and timing report generated

![open_sta_timing_analysis](https://github.com/user-attachments/assets/7e8e15b9-9366-4839-ac18-d7ee50b4d4b4)

![opensta_timing2](https://github.com/user-attachments/assets/0546796b-23ab-40d8-bc4d-9b164542f185)

![opensta_timing3](https://github.com/user-attachments/assets/f6113b69-8222-4a4f-b8c3-c802f948a3cc)

**Note:-**

*	To open the inverter in magic tool, which is created by you name just click on the magic and go to the cell manager their under picorv32a, you can find your inverter name their when you click on zoom you are able to see that block.
*	Press 'z' for zoom-in, 'v' for zoom-out.

-----
## Lab 14: RTL2GDS of VSDbabysoc using Openroad

### OpenRoad Physical Design:

**1. FinFET Basics:**
Path to Zetta-Scale Computing

Introduction:

* **Bombe:** The Bombe was an electro-mechanical machine designed during World War II to decrypt German Enigma-encrypted messages. It was refined and built by Alan Turing and Gordon Welchman at Bletchley Park, UK. The Bombe systematically tested possible rotor settings of the Enigma machine by exploiting known plaintext patterns. Its logical operations helped narrow down the vast number of possible keys, significantly accelerating the decryption process. The Bombe played a critical role in the Allied war effort.

* **ENIAC (Electronic Numerical Integrator and Computer):** It was developed during World War II by John Presper Eckert and John Mauchly at the University of Pennsylvania, was the first general-purpose, fully electronic digital computer. Completed in 1945, it was designed to compute artillery firing tables for the U.S. Army. ENIAC used vacuum tubes instead of mechanical or electromechanical components. However, it lacked a stored-program capability, requiring manual reconfiguration for each new task. ENIAC demonstrated the immense potential of electronic computing for large-scale numerical problems.

* **EDVAC (Electronic Discrete Variable Automatic Computer):** EDVAC, also developed by Eckert and Mauchly with conceptual input from John von Neumann, was one of the first computers to implement the stored-program concept. Completed in 1949, EDVAC represented a significant improvement over ENIAC by using binary representation instead of decimal and storing both data and instructions in memory. This innovation simplified programming and laid the groundwork for the modern von Neumann architecture.

**50 Years of Microprocessor Trend Data:**

![image](https://github.com/user-attachments/assets/663e8079-4932-4856-ae71-222a6a40527a)

**The Key metrics are:**

*   **Transistors (Orange Triangles):** The number of transistors on a microprocessor chip (in thousands) has increased exponentially, following Moore's Law, which predicts a doubling approximately every two years. This growth enabled more complex and capable processors, reaching the range of billions of transistors by the 2020s.

*   **Single-Thread Performance (Blue Circles):** It is measured using SpecINT. It indicates the computational ability of a single processor core. Performance grew steadily due to improvements in architecture, instruction-level parallelism, and clock speeds, but the growth rate slowed post-2005 due to physical limitations like power and heat.

*   **Frequency (Green Diamonds):** Processor clock speed (in MHz) rose steadily until the early 2000s but then stagnated as increasing clock speeds became inefficient due to heat dissipation issues.

*   **Typical Power (Red Triangles):** Power consumption increased with transistor density and frequency, becoming a critical design challenge around the mid-2000s.

*   **Number of Logical Cores (Black Dots): The transition to multi-core processors gained momentum in the mid-2000s as a response to the stagnation in single-thread performance. By increasing the number of cores, processors enabled more efficient parallel processing, leading to significant improvements in overall performance

**Key Milestones**

    iPhone Release (~2007): Signals the emergence of mobile computing, where power efficiency became as crucial as performance. This catalyzed innovations in low-power processor designs.
    Datacenter-Scale Computing (Post-2010): Marks the rise of cloud computing and large-scale data centers, where energy efficiency, scalability, and parallelism became central concerns.

**Path to zetta-scale computing**

![image](https://github.com/user-attachments/assets/e56e21c0-e51f-4a81-988b-d055e6c6647f)image

The path to zetta-scale computing, tracing the evolution of computing performance (measured in FLOPS—floating-point operations per second) from the gigascale era in 1984 to the projected zettascale by 2035.

**Key Performance Levels**

1. Gigascale (10⁹ FLOPS): The starting point in 1984, marking the capability of early supercomputers.
2. Terascale (10¹² FLOPS): Achieved around 1997, a significant milestone where systems like Jaguar (Cray XT5) delivered teraflop performance with power consumption of 7 MW.
3. Petascale (10¹⁵ FLOPS): Achieved in 2008 with systems like Titan (Cray XK6) at 27 petaflops, consuming 9 MW. This milestone represents the era of petascale high-performance computing (HPC).
4. Exascale (10¹⁸ FLOPS): Reached by systems like Frontier (Cray Shasta) in 2021, delivering 1.5 exaflops using 4 AMD GPUs and 1 AMD CPU, consuming 29 MW of power. Exascale computing enables highly detailed simulations and large-scale AI workloads.
5. Zettascale (10²¹ FLOPS): Projected to be achieved by around 2035. At this scale, systems will handle unprecedented computational workloads, such as advanced climate modeling, AI, and large-scale simulations. Power consumption is estimated to range between 50-100 MW for a single zettascale machine.

**CMOS Evolution and Next-Gen Candidates**

![image](https://github.com/user-attachments/assets/b138fedc-ecdd-4207-8ee5-faf1ce11e4e7)


This diagram illustrates the evolving landscape of CMOS (Complementary Metal-Oxide-Semiconductor) technology and highlights emerging materials, structures, and processes being explored for next-generation semiconductor devices. These innovations aim to address the challenges of scaling CMOS technology down to the 1nm node and beyond.

**Channel Material**

*	Current Trends:
            Silicon (Si) is the primary material used for the channel in traditional CMOS transistors, with strained SiGe (Silicon-Germanium) being used in some high-performance applications to enhance carrier mobility.

*	Future Materials:
            2D materials such as MoS₂ (Molybdenum Disulfide) are being explored due to their potential for better electrical characteristics at smaller scales.
            Germanium (Ge) is gaining interest as it offers higher electron mobility, which could significantly boost transistor performance at small nodes.

**Patterning**

*	Current Techniques:
            Deep Ultraviolet (DUV) lithography is the most commonly used technique for defining transistor features, with ArF (Argon Fluoride) and KrF (Krypton Fluoride) lasers operating at different wavelengths.

*	Next-Gen:
            Extreme Ultraviolet (EUV) lithography is expected to be a key technology for sub-7nm nodes. High-NA (Numerical Aperture) EUV will further improve the resolution for even smaller transistor nodes, pushing the boundaries of Moore's Law.

**Gate Stack Material**

*	Current Materials:
            High-K metal gates (HKMG) are used in the gate stack of modern FETs to reduce gate leakage current and improve switching performance.

*	Next-Gen Candidates:
            NC-FET (Negative Capacitance FET): This is a promising transistor design that leverages ferroelectric materials to reduce power consumption by enabling lower voltage operation.
            TFET (Tunnel FET): TFETs use quantum tunneling to switch on and off, offering a significant reduction in power consumption compared to conventional FETs, especially for low-power applications.

**Interconnection Material**

*	Current Materials:
            Copper (Cu) is the primary material used for interconnects due to its low resistivity, which helps in minimizing power loss and delays in transistor connections.

*	Next-Gen Materials:
            Ruthenium (Ru) and Compound metals are being investigated for their potential to reduce resistance and improve performance in ultra-small transistors.
            Topological semi-metals may offer unique properties, such as lower resistivity and increased performance at the atomic scale.

**Device Structure**

*	Current Architectures:
            FinFET and planar transistors are used to maintain performance at smaller nodes. FinFETs, in particular, help improve control over short-channel effects by using a 3D structure.

*	Next-Gen Architectures:
            3DS-FET (3D Stacked FET): These are three-dimensional transistors where multiple layers of devices are stacked vertically, reducing footprint and improving performance.
            MBC-FET (Multi-Bridge Channel FET): This structure aims to enhance drive current by creating multiple channels within the same device.
            VFET (Vertical FET): VFETs utilize vertical channels to improve density and reduce power consumption.

**Design Co-Optimization**

*	DTCO (Design-Technology Co-Optimization):
            DTCO focuses on integrating new design techniques with advanced process technologies to maximize chip performance, often involving backside interconnects (BSI), where interconnections are made at the back of the wafer for improved signal integrity and reduced latency.

*	STCO (System-Technology Co-Optimization):
            This approach involves optimizing both the system architecture and the underlying technology. One example is the use of chiplets, which allow for modular, customized designs by integrating multiple smaller chips into one package, offering flexibility and reducing the complexity of scaling single-chip designs.

**FinFETs**

![image](https://github.com/user-attachments/assets/4b50ff18-aab0-4ac0-bb92-a5a52712fb43)


This diagram illustrates the evolution of transistor technology from planar to more advanced architectures like FinFET and Gate-All-Around (GAA):

*	Planar Transistor (Traditional):
        Early transistor design with a flat channel and gate structure.
        The gate controls the channel from one side only, leading to limited performance as scaling continues.

*	FinFET (2011):
        The channel is shaped like a vertical fin, allowing the gate to wrap around three sides of the channel.
        Provides better control over the channel, reducing leakage and improving performance at smaller sizes.

*	Gate-All-Around (GAA) Transistor (2025?):
        The gate completely surrounds the channel, typically implemented using stacked nanosheets or nanowires.
        Offers even better control over the channel compared to FinFET, allowing higher performance and efficiency with continued scaling.

Each step improves drive current capability and enhances control over the transistor's on/off states, critical for power efficiency and miniaturization in modern electronics.

Why FinFETs and Gate-All-Around Transistors?

![image](https://github.com/user-attachments/assets/febc2fa2-2898-430d-867b-4f7e8d79355d)


This diagram explains the advantages of FinFETs and Gate-All-Around (GAA) transistors compared to traditional planar structures:

**Planar Transistors:**

*	Challenges:
        Sub-channel leakage occurs where current leaks underneath the gate.
        Results in reduced efficiency.
        Increases power consumption.

*	FinFET Transistors:
        The gate wraps around the channel (fin) on three sides, providing better control over the channel.
        **Benefits:**
           - 	Reduces sub-threshold leakage.
           - 	Enhances drive current ((I_{ON})).
           - 	Allows a smaller transistor area while maintaining high performance.

*	Gate-All-Around (GAA) Transistors:
        The gate completely surrounds the channel, offering superior electrostatic control.
        **Advantages:**
            -	Improves short-channel performance by reducing drain capacitance and enhancing gate capacitance.
            -	Improves scaling efficiency as indicated by the formula (S \propto (1 + C_d / C_{ox})).
            -	Provides reduced sub-threshold slope and better performance at smaller scales.

*	Graph Comparison:
            -	Illustrates the performance advantages of FinFETs and GAA over planar transistors.
  	    -	Shows better efficiency and reduced sub-threshold slope as dimensions shrink.

![image](https://github.com/user-attachments/assets/2598f386-9ccf-455a-8744-987de8245c99)


**Reduced Leakage:** Tri-Gate transistors exhibit significantly lower leakage current compared to planar transistors at the same gate voltage. Lower leakage results in both reduced off-current at the same on-current and lower power dissipation.

**Higher Drive Current:** Tri-Gate transistors provide higher drive current compared to planar transistors at the same off-current. This results in improved circuit performance and greater efficiency in modern electronic applications.

**FEOL Innovations:**

FEOL refers to the initial stages of semiconductor manufacturing where the active devices (e.g., transistors) are built on the silicon wafer. It involves creating components such as transistors, capacitors, and isolation structures before metal interconnects are added. FEOL Innovations help drive Moore's Law forward by enabling smaller, more efficient, and more powerful transistors.

**CMOS Technology Inflection Points**

![image](https://github.com/user-attachments/assets/fb763b75-19f1-4dfd-9d52-4a7ec1bb0779)


**1. Dennard Scaling:**
-	States that power density remains constant as transistors shrink.
-	Initially allowed voltage scaling with smaller gate lengths, shown in the bottom-left graph.

**2. Technology Nodes and Innovations:**
       *	~1 µm ("End of Scaling"): Start of CMOS miniaturization.
       *	180 nm (Voltage Scaling): Start of drive voltage reduction.
       *	130 nm (Cu BEOL): Introduction of copper interconnects for better conductivity.
       *	90 nm (Uniaxial Strained Si NMOS): Strained silicon enhances electron mobility.
       *	65 nm (eSiGe CVD ULK): Embedded SiGe improves PMOS performance.
       *	45 nm (HK-first MG-last): High-k dielectrics and metal gates reduce leakage and improve gate control.
       *	32 nm (HKMG with Raised S/D NMOS): Advanced HKMG implementation and raised source/drain regions.

**2. SEM Images**

*	**Left Image:** Shows the cross-sectional view of a transistor structure with High-k materials and embedded SiGe (Silicon-Germanium).It has high-k dielectric and metal gates are used to improve performance. SiGe regions enhance PMOS performance by applying strain to the silicon channel.

*	**Right Image:** Demonstrates the raised source/drain (S/D) regions and gate channel in PMOS transistors at smaller nodes.

**3. Drive Voltage Scaling Graph (Bottom-left):** The graph shows the relationship between gate length (x-axis, logarithmic scale) and drive voltage (y-axis, logarithmic scale). The Ideal scaling behavior indicates that the voltage decreases linearly with shrinking gate length. Red and green markers show practical trends for low-power and high-performance devices, which deviate from ideal scaling due to challenges like leakage currents and increased power density.

![image](https://github.com/user-attachments/assets/2e8b56c7-cb3d-4eb4-977d-64bc6701d124)


**Key Technology Nodes and Innovations**

**1. 22 nm:**
        Introduction of FinFET (Tri-Gate) transistors, which reduce leakage and improve gate control.
        Use of self-aligned contacts (SAC) and copper interconnects (Co+Cu BEOL).

**2. 14 nm:**
        Transition to unidirectional metal routing for better density.
        Implementation of SADP (Self-Aligned Double Patterning) and SDB (Single Diffusion Break) for precise layout.

**3. 10 nm:**
        Adoption of advanced patterning techniques such as:
        -	SA-SDB (Self-Aligned SDB)
        -	LELELE (Litho-Etch-Litho-Etch-Litho-Etch)
        -	SAQP (Self-Aligned Quadruple Patterning) for tighter geometries.

**4. 7 nm:**
        -	Introduction of Extreme Ultraviolet Lithography (EUV) to simplify the patterning process and reduce overlay errors.

**5. 5 nm:**
        -	Integration of SiGe (Silicon-Germanium) channels for PMOS to enhance hole mobility.
        -	Use of EUV SA-LELE (Self-Aligned Litho-Etch-Litho-Etch).

**6. 3 nm / 2 nm / 1.4 nm:**
        -	Transition to Gate-All-Around (GAA) nanosheet transistors for improved electrostatic control.
        -	GAA stacks nanosheets or nanowires horizontally to maximize current drive.

**7. Sub-1 nm:**
        -	Development of CFET (Complementary FET), which vertically stacks NMOS over PMOS to save area.
        -	Use of 2D materials, such as MoS₂, for atomic-scale channel thickness in 2D FETs.

![image](https://github.com/user-attachments/assets/b0955ae3-73fe-441e-aa85-5e64bbbea3ce)


The image illustrates how Samsung has scaled down the size of transistors in their successive generations of nodes (10nm, 8nm, 7nm, and 5nm) using a technique called Fin Depopulation. In FinFET transistors, the "fin" is the vertical channel that carries the current. Fin Depopulation involves reducing the number of fins per transistor while keeping the fin width constant. This allows for smaller transistors without compromising performance.

    *	10nm (HD): The transistor has a fin height of 420nm and uses 10 fins.
    *	8nm (UHD): The fin height is reduced to 378nm, and the number of fins is decreased to 9.
    *	7nm (HD): The fin height remains at 27nm, but the number of fins is further reduced to 8.
    *	5nm (UHD): The fin height is maintained at 27nm, and the number of fins is decreased to 7.

![image](https://github.com/user-attachments/assets/06809cea-45b6-47c9-867c-4802faedf13e)


*	**Double Diffusion Break (DDB):** Double Diffusion Break (DDB) involves creating a gap between the source and drain regions of a transistor. This gap is filled with an insulating material, which reduces the effective width of the transistor. By doing so, DDB enables the design of smaller cell sizes, allowing for higher transistor density and improved scalability. A cross-sectional view of a transistor with DDB highlights the insulating gap between the source and drain regions.

*	**Single Diffusion Break (SDB):** Single Diffusion Break (SDB) is similar to DDB but less aggressive. It involves introducing a gap on only one side of the transistor. This approach provides a balanced trade-off between size reduction and maintaining transistor performance. A cross-section of a transistor with SDB highlights the gap on one side, showcasing its simplicity compared to DDB.

*	**Contact Over Field Gate (COFG):** Contact Over Field Gate (COFG) places the gate contact directly over the field oxide region of a transistor. This design reduces lateral spacing between adjacent transistors, enabling smaller cell sizes without significant performance loss. A cross-sectional representation of a transistor with COFG illustrates the positioning of the gate contact over the field oxide.

*	**Contact Over Active Gate (COAG):** Contact Over Active Gate (COAG) is a more aggressive technique than COFG. Here, the gate contact is placed directly over the active gate region of the transistor. This approach enables even smaller cell sizes and higher transistor density, which are critical for advanced semiconductor nodes. A cross-sectional image of a transistor with COAG highlights the gate contact placement over the active gate.

*	**Back-Side Power Delivery Network (BS-PDN):** The Back-Side Power Delivery Network (BS-PDN) is an innovative approach where power supply rails are routed on the backside of the chip. This method reduces the height of the standard cell, creating space for more transistors and improving overall transistor density. Additionally, it enhances power delivery efficiency and reduces resistance, which is crucial for high-performance applications. A schematic of a standard cell with BS-PDN illustrates the positioning of power rails on the backside of the chip.

![image](https://github.com/user-attachments/assets/b7a3fff3-158c-45ee-9f8d-cbc8638ae0d1)


*	**Planar Technology:** In early planar technology nodes (100nm and above), the Vt variability is significantly high, around 130mV. This is due to various factors like process variations, temperature fluctuations, and line-edge roughness.

*	**FinFET Technology:** With the advent of FinFET technology (around 22nm), the Vt variability reduces significantly to around 14mV. This improvement is attributed to the better control over the channel length and width in FinFETs compared to planar transistors.

*	**NW Technology (Nanowire):** In the latest nanowire technology (14nm and below), the Vt variability is even lower, around 7mV. This further reduction is due to the precise control over the nanowire dimensions and the reduced impact of process variations.

![image](https://github.com/user-attachments/assets/d52ffa2a-7dd3-4ed7-8486-8cf73fe02282)


**Planar MOSFETs**

Planar MOSFETs, the traditional architecture, have a simple structure where the gate sits above the channel. In this design, the contact width ((W_C)) and gate width ((W_G)) are nearly equal, resulting in a ratio of (W_C / W_G \approx 1). This leads to a low parasitic resistance, with (R_{EXT}) being much smaller than (R_{ch}) ((R_{EXT} / R_{ch} < 1)). As a result, planar MOSFETs suffer minimal performance degradation due to parasitic resistance.

**FinFETs**

FinFETs, a 3D transistor design, introduce vertical fins with the gate wrapping around them for improved control. However, the effective contact width decreases relative to the gate width, leading to (W_C / W_G \approx 1/3). Consequently, the parasitic resistance becomes comparable to the channel resistance ((R_{EXT} / R_{ch} \approx 1)), which begins to impact the performance of the device as it scales.

**Gate-All-Around (GAA) FETs**

Gate-All-Around (GAA) FETs, which use nanosheets or nanowires, offer even better electrostatic control by fully surrounding the channel with the gate. However, the contact width further decreases compared to the gate width, resulting in (W_C / W_G \approx 1/6). This causes a significant increase in parasitic resistance, with (R_{EXT}) being approximately three times the channel resistance ((R_{EXT} / R_{ch} \approx 3)). While GAA FETs improve transistor density, the higher parasitic resistance becomes a challenge for maintaining performance.

**Complementary FETs (CFETs)**

Complementary FETs (CFETs) take transistor stacking to the next level by vertically integrating NMOS and PMOS transistors. This approach maximizes space efficiency in advanced nodes but inherits the high parasitic resistance of GAA FETs. With (W_C / W_G) remaining small, the (R_{EXT} / R_{ch}) ratio is around 3, posing similar challenges to those faced by GAA FETs.

**Explanation of Parasitic Resistance**

![image](https://github.com/user-attachments/assets/f2d602b0-07b8-4a13-a55d-eb5fdd378ede)

The image highlights the breakdown of parasitic resistance ((R_{EXT})) and approaches for reducing it in transistors. Here is a detailed explanation:

Components of Parasitic Resistance ((R_{EXT})) The leftmost diagram illustrates the various contributors to (R_{EXT}) in a transistor:

    *	(R_{CA-BEOL}): Resistance from the contact in the Back-End-Of-Line (BEOL).
    *	(R_{CA}): Resistance at the contact area.
    *	(R_{CA-TS}): Resistance at the contact to the transition structure.
    *	(R_{TS}): Resistance in the transition structure.
    *	(R_{MOL}): Middle-Of-Line resistance (includes lateral and vertical contributions).
    *	(R_C): Contact resistance at the metal-semiconductor interface.
    *	(R_{EPI}): Epitaxial layer resistance (contributes to current spreading).
    *	(R_{FEOL}): Front-End-Of-Line resistance from the source/drain extensions.

Initial vs. Improved (R_{EXT}) Breakdown The two pie charts in the center show the contributions of different resistance components for NFETs and PFETs before and after improvements:

**NFET:**
        -	Initial: Majority of (R_{EXT}) comes from (R_C) (63%) and (R_{CA-BEOL}) (31%).
        -	Improved: Significant reduction in (R_C) (48%) and (R_{CA-BEOL}) (12%).
**PFET:**
        -	Initial: (R_{FEOL}) (50%) and (R_C) (45%) dominate.
        -	Improved: Major reduction in (R_{FEOL}) (78%) and (R_C) (16%).

Improving Ohmic/Tunneling Contacts The right section discusses methods to improve the metal-semiconductor interface:

**Key Objectives:**
        -	Low Schottky Barrier Height (SBH) ((\phi_b)): Reduces the energy barrier for carrier injection, enabling better contact conductivity.
        -	High Doping Concentration ((N_d)): Increases carrier density at the interface, reducing contact resistance.

Equation for Specific Contact Resistivity ((\rho_c)): [ \rho_c \propto \exp\left(\frac{2\phi_b}{\hbar} \sqrt{\frac{\epsilon_s m_x}{N_d}}\right) ] This equation shows how lowering (\phi_b) and increasing (N_d) can reduce (\rho_c).

**Metal-Semiconductor Energy Diagram:**
	The energy diagram shows how a reduction in (\phi_b) (Schottky Barrier Height) facilitates easier carrier injection from the metal to the semiconductor.

![image](https://github.com/user-attachments/assets/ba2911e6-0be6-4643-84b8-33745a16fbe7)


The bar chart on the left shows how the composition of (C_{eff}) evolves from 22nm to 7nm technology nodes:

*	At 22nm, the dominant contributor to (C_{eff}) is (C_{fr}) (56%), while parasitic capacitances (C_{pc-ca}) (25%) and (C_{g}) (19%) contribute less.
*	At 14nm and 10nm, parasitic capacitances ((C_{pc-ca}) and (C_{fr})) start dominating, with (C_{fr}) decreasing to 38% and 25%, respectively, while (C_{pc-ca}) increases.
*	At 7nm, (C_{g}) becomes the most significant contributor (45%), with (C_{pc-ca}) and (C_{fr}) still present but reduced. This highlights the increasing impact of parasitic capacitance as node sizes shrink.

**Plot Descriptions:**

*	The first scatter plot shows a reduction in normalized delay for a ring oscillator when using SiBCN spacers instead of SiN spacers, indicating improved performance.
*	The second scatter plot demonstrates an 8% reduction in (C_{eff}) with SiBCN spacers, which corresponds to the delay improvement observed in the first plot.
*	The rightmost figure shows the evolution of spacer materials from SiOCN to SiCO. This material transition aims to significantly reduce the gate-contact capacitance across nodes. At 14nm and beyond, low-(k) spacers improve performance by decoupling parasitic effects and maintaining capacitance at manageable levels.
*	The bottom middle image shows a cross-sectional TEM view of a transistor with air spacers around the gate: i) Air, with its extremely low dielectric constant ((k \approx 1)), significantly reduces parasitic capacitance. The adjacent plot quantifies this improvement, showing a 15% reduction in (C_{eff}) when using air spacers compared to solid spacers.

![image](https://github.com/user-attachments/assets/bb4fa79b-3767-40ca-a895-8ea4494ad8d9)


**Key Properties of 2D Layered Materials (Compared to Silicon):**

-	Uniform Atomic Scale Thickness: A single layer of MoS₂ is approximately 0.65 nm thick, offering an ideal thickness for scaling compared to silicon.
-	Higher Effective Mass (( m^ )):* MoS₂ has an effective mass of about 0.55 times the mass of a free electron (( m_0 )), whereas silicon’s effective mass is around 0.22 ( m_0 ).
-	Bandgap: Additionally, 2D materials like MoS₂ possess favorable bandgaps for electronic devices, with a monolayer bandgap of ~1.85 eV, which reduces to ~1.5 eV for a bilayer.

![image](https://github.com/user-attachments/assets/fd6b3e48-1998-461f-b54b-81b1a16aa0b4)

**Transistor Scaling:**
        To achieve smaller gate lengths, devices must address various physical and material constraints to ensure reliable operation.

**Challenges for Scaling:**
-	Direct Source-to-Drain Tunneling: As the gate length decreases, electrons can tunnel directly from the source to the drain, bypassing the gate control. To mitigate this, materials with a high effective mass (( m^* )) are needed.
-	Surface Roughness and Thickness Variations: Variability at atomic scales can cause performance issues. Uniform, atomically thin materials are essential for minimizing such variations.
-	Capacitance Ratios (( C_D ) and ( C_{ox} )): The capacitance of the depletion region (( C_D )) must remain low relative to the gate oxide capacitance (( C_{ox} )) to improve gate control. Materials with a low in-plane dielectric constant (( \epsilon )) are necessary for this.

**Diagrams:**
-	The left shows the transistor structure with key components like the source, drain, gate, oxide, and silicon substrate.
-	The right illustrates two scenarios:
        	a. Thermionic Emission: Electrons cross the energy barrier as intended.
        	b. Direct Tunneling: At extremely small gate lengths, electrons tunnel directly from source to drain, leading to leakage.

**Key Takeaway:**
        New channel materials, such as 2D materials, are required to overcome these challenges while maintaining high performance and scalability.

![image](https://github.com/user-attachments/assets/04001199-bb59-4efe-bf62-854e9ab07692)


Concept of Direct Source-to-Drain Tunneling: As the gate length ((L_G)) in MOSFETs decreases, direct tunneling of electrons from the source to the drain becomes significant, leading to increased leakage currents. This leakage is influenced by material properties, such as the effective mass ((m^*)) and the bandgap ((E_G)).

A higher (m^) in MoS₂ suppresses tunneling leakage compared to silicon. The graph shows the leakage current ((I_{SD, \text{leak}})) as a function of gate length ((L_G)) for various channel thicknesses ((T_{CH})). MoS₂ exhibits lower leakage at smaller gate lengths compared to silicon, achieving up to 100x reduction in leakage due to its higher (m^), larger (E_G), and lower dielectric constant ((\epsilon)).

The superior performance of MoS₂ in minimizing leakage currents results in significant energy savings, making it a promising material for future transistor scaling.

![image](https://github.com/user-attachments/assets/217727ce-441a-4aff-8af1-215451b3889d)


The MoS₂ transistor with a 1 nm gate length represents a breakthrough in miniaturization, featuring a thin MoS₂ channel for its excellent electronic properties. A single-walled carbon nanotube (SWCNT) serves as the ultra-small gate electrode, while Zirconium Dioxide (ZrO₂) acts as a high-k dielectric, reducing leakage and ensuring precise control. Built on a SiO₂ substrate with an n⁺ silicon back gate, the transistor uses the CNT gate to deplete a small region of the MoS₂ channel, enabling efficient modulation. This innovative design showcases the potential of 2D materials and nanoscale gates in advancing transistor technology.

![image](https://github.com/user-attachments/assets/4a685f55-49a0-4a9f-9fe1-68751dae440d)


The slide illustrates the structure and fabrication of an All-2D MOSFET (Metal-Oxide-Semiconductor Field-Effect Transistor), where all key components, including the channel, gate, and contacts, are made using two-dimensional materials. This device leverages the exceptional properties of 2D materials to improve performance and scalability. Below is a breakdown of the key components and the fabrication process:
*	Graphene Contacts (S, D, G): Graphene is used as the source, drain, and gate electrodes. Its high conductivity and 2D nature make it ideal for ensuring low-resistance electrical contacts. MoS₂ Channel:

*	Molybdenum Disulfide (MoS₂) serves as the semiconductor channel. MoS₂ is widely used in 2D MOSFETs due to its excellent on/off current ratio and atomic-scale thickness. h-BN Dielectric:

*	Hexagonal Boron Nitride (h-BN) acts as the insulating dielectric layer. It is a 2D material with excellent insulating properties and high thermal stability, making it suitable for separating the graphene gate from the MoS₂ channel. Si/SiO₂ Substrate:

The device is fabricated on a silicon dioxide (SiO₂) layer on top of a silicon substrate, which provides mechanical support and a global back gate. Fabrication Process:

*	A layer of graphene is deposited on the SiO₂ substrate, which will later serve as the gate electrode.
*	Graphene is patterned to define the source and drain regions, leaving gaps for the channel.
*	A monolayer of MoS₂ is transferred onto the patterned graphene, forming the channel region.
*	An h-BN layer is added on top of the MoS₂ as the gate dielectric.
*	A top layer of graphene is deposited and aligned as the gate electrode.
*	The completed device is contacted using metallic electrodes (Ni/Au) for testing.

![image](https://github.com/user-attachments/assets/2fc69f53-adba-4d11-99b1-2906b2745946)


**The All-2D MOSFET exhibits excellent electrical performance:**

*	Transfer Characteristics (I(_D) vs V(_G)): Achieves a high on/off current ratio (>10⁵), demonstrating strong gate control for effective switching.
*	Output Characteristics (I(D) vs V({DS})): Smooth current modulation with increasing V(G) and V({DS}), indicating good output performance.
*	Mobility: Field-effect mobility remains constant with increasing gate electric field, showing minimal scattering and high-quality interfaces in the 2D materials stack.

These results highlight the potential of 2D materials like MoS₂, graphene, and h-BN for scalable, high-performance transistor applications.

![image](https://github.com/user-attachments/assets/5e645878-5fc1-4e39-bbed-e7287002c676)


**The diagram on the top left shows a non-planar transistor with key components:**

*	Gate: Controls the flow of current through the channel.
*	Channel: Region where current flows between the source (S) and drain (D).
*	Body: Underlying region connected to the substrate.
*	STI (Shallow Trench Isolation): Insulates neighboring devices.

The biggest challenge is to form a single-crystalline semiconductors on a non-planar surface is difficult using conventional semiconductor fabrication techniques.

![image](https://github.com/user-attachments/assets/6299f7de-dcd6-4d0a-9996-5b389c879e9f)


**Single-Layer CMOS (a):**
	This is the traditional CMOS design where NMOS and PMOS transistors are fabricated on a single silicon layer. Each transistor operates in the same planar layer, with devices connected laterally.

**Monolithic 3D CMOS (b):**
	In this design, NMOS and PMOS transistors are stacked in two separate layers, enabling higher density. The P-Channel (PMOS) is placed on top of the N-Channel (NMOS), separated by an oxide layer. This approach reduces the footprint and allows better performance due to shorter interconnects.

**Single-Layer CMOS Logic (c):**	
	Shows logic gates (inverter, 2-input NAND, and 2-input NOR) built using traditional single-layer CMOS. Transistors are laid out horizontally, with interconnections taking more space.

**Monolithic 3D CMOS Logic (d):**
	Logic gates are constructed with two transistor layers (Layer 1 and Layer 2), reducing the area required for interconnections. Vertical integration improves performance and reduces delay by shortening signal paths.

![image](https://github.com/user-attachments/assets/8bd054cb-4827-4d0a-b0cc-b8a03d2ca775)



**2. Tool Installation:**

**Commands to install openroad:**
```
git clone --recursive https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts
cd OpenROAD-flow-scripts
sudo ./setup.sh
```

![installation1](https://github.com/user-attachments/assets/dbb7440f-df87-4a57-9f56-ba04f94f5b24)

![installation2](https://github.com/user-attachments/assets/0a3e3bdb-f7fc-42da-906e-25437231121c)


**Build tool on local machine command:**
```
./build_openroad.sh --local
```

![installation3](https://github.com/user-attachments/assets/7142c8a3-8511-424d-a90c-95ac97b1e6f7)


![installation4](https://github.com/user-attachments/assets/402d92ea-1375-44cb-aae6-db20fcbb11c3)

**Verify Installation**:
```
source ./env.sh
yosys -help
openroad -help
cd flow
make
```
![install_verify1](https://github.com/user-attachments/assets/3fa2e1ce-a061-434b-8482-881d1652f4ad)

![install_verify2](https://github.com/user-attachments/assets/146a2380-a145-460b-b1e5-3452132ed2c8)

![install_verify_make_cmnd](https://github.com/user-attachments/assets/11a42460-65aa-43f5-aeff-50225e819a29)

![install_verify_make_cmnd_complete](https://github.com/user-attachments/assets/ef2e0057-ed70-4546-bc64-3d7444f3a6d5)


**3. Flow Structure:**

Physical Design Flow :

![image](https://github.com/user-attachments/assets/d56698f9-2dbb-4589-affa-468219542cc3)

Physical Design is the process of translating the gate level netlist into a physical layout. This physical layout consists of various metal shapes and sizes which can be drawn onto masks and manufactured on the silicon wafer.

The Physical Design process can be broken down into multiple stages as illustrated below. It is often an iterative process where a number of optimizations are performed at each step to meet the design performance, area & power requirements.

**Floorplanning :**
	Floorplanning is the first step of physical design. The design is first partitioned into various smaller subsystems based on the system architecture and design requirements. Floorplanning determines the aspect ratio and area of the layout. Here we create the placement rows for standard cells and fix the placement of I/Os around the boundary. Any macros in the design are also placed during the floorplan stage.

Power planning is also typically done during floorplanning. The power grid network is created to distribute power to all the std cells rows, macros and all other components of the design. If there are any special IPs being used in the design then all the IP integration guidelines are also considered in floorplanning.

A good floorplan is very critical to the overall quality of your design.

![image](https://github.com/user-attachments/assets/e3eee512-1d5c-45cd-91f3-3e7d75994ccb)

**Logic Placement :**
	In this stage all the standard cells in the design are placed and assigned a legal location. After the placement EDA tools performs a number of optimizations to improve placement and congestion. A bad placement might lead to larger area utilization and timing issues.

EDA tools also use timing driven placement algorithms to optimize the placement while considering the timing requirements of the design.

**Clock Tree Synthesis :**
	During the Floorplanning & placement stage, the clock is considered as an ideal network. The optimizations in the placement stage are performed based on the assumption of an ideal clock reaching to all flops at the same time. In CTS, a clock network is created to distribute the clock to all flops. This clock tree is built using buffers or inverters along the clock paths of design in order to achieve zero/minimum skew based on design requirement. A good quality clock network is very crucial to meet the timing requirements of the design.

 **Routing :**
 	Once all the standard cells are legally placed and the clock network is synthesized, all the connecting data nets need to be laid out on the metal layers. This is done during the routing stage. After routing all the nets, a number of optimizations are performed based on the design timing requirements and analysis.

**Timing Analysis & Signoff :**
	After the design Routing, static timing analysis is performed on the design. This step is critical to analyze the performance of the design. During STA, we break down the design into timing paths and calculate the signal propagation delay along each path. Then each path is checked for violations of timing constraints. If any path is violated then these violations need to be addressed before signing off on the design.

The timing signoff ensures that all the design elements are meeting the specified timing requirements and the design is working at the desired frequency.

**Physical Verification & Signoff :**
After the routing is completed, the layout must be completely verified to ensure its correct electrical and logical functionality. The physical verification signoff ensures that the design meets all the fabrication specified rules and can be easily manufactured. Various checks that are performed at this stage includes :

    *	DRC (Design Rule Check)
    *	LVS (Layout Vs Schematic)
    *	ERC (Electrical Rule Check)
    *	Antenna check
    *	EM (Electromigration Analysis)

Once the physical verification is done, the layout is streamed out in the form of a GDSII or OASIS file for fabrication which is called design tapeout.
  
The ORFS Directory Structure and File formats:

```
├── OpenROAD-flow-scripts             
│   ├── docker           -> It has Docker based installation, run scripts and all saved here
│   ├── docs             -> Documentation for OpenROAD or its flow scripts.  
│   ├── flow             -> Files related to run RTL to GDS flow  
|   ├── jenkins          -> It contains the regression test designed for each build update
│   ├── tools            -> It contains all the required tools to run RTL to GDS flow
│   ├── etc              -> Has the dependency installer script and other things
│   ├── setup_env.sh     -> Its the source file to source all our OpenROAD rules to run the RTL to GDS flow
```
Now, go to flow directory

```
├── flow           
│   ├── design           -> It has built-in examples from RTL to GDS flow across different technology nodes
│   ├── makefile         -> The automated flow runs through makefile setup
│   ├── platform         -> It has different technology note libraries, lef files, GDS etc 
|   ├── tutorials        
│   ├── util            
│   ├── scripts             
```

**4. Automated RTL2GDS for for GCD example:**

In this section, we run the physical design and explore the gui file of gcd design of nangate45 platform. The commands are:-

```
# Assuming you should be inside the OpenROad directory inside flow folder then run below commands.
make # by default makefile will have the gcd as the default design
# or
make DESIGN_CONFIG=./designs/nangate45/gcd/config.mk
make gui_floorplan
make gui_place
make gui_cts
make gui_route
make gui_final
# or we can open the gui file and their we select the .odb file going through the results folder of nangate45 platform
source ./env.sh # go to the OpenROAD directory then run this command then below command
openroad -gui
make metadata
gedit designs/nangate45/gcd/metadata-base-ok.json
```

**Command Screenshot:**

![synth](https://github.com/user-attachments/assets/26e73bf9-750e-4187-b767-84fb0fcfadad)

**Floorplan:**

![floorplan](https://github.com/user-attachments/assets/ae566118-b201-4be3-ad27-09b7f5bbf6e4)

![floorplan_gui1](https://github.com/user-attachments/assets/92695e6d-8224-40fd-b359-761764afa027)


![fplan](https://github.com/user-attachments/assets/22451f5c-5980-4885-bf4f-f49f7aed3ebd)

**Place:**

![place](https://github.com/user-attachments/assets/53ec457b-3073-4341-984d-5fefa509e485)

**CTS:**

![cts](https://github.com/user-attachments/assets/3d1abfeb-404a-4d45-bce3-45165e3af115)

**Route:**

![route](https://github.com/user-attachments/assets/44a494cc-4ef0-4d7e-9770-5e6d96df815a)

**Final GUI:**

![final_gui](https://github.com/user-attachments/assets/7ab4aac4-cb36-4c5d-a3ee-bebb8eb065e2)


## **Using above flow and commands we ran automated RTL2GDS flow for physical design of VSDbabysoc:**

Initial Steps:

*	We need to create a directory vsdbabysoc inside OpenROAD-flow-scripts/flow/designs/sky130hd
*	Now copy the folders gds, include, lef and lib from the VSDBabySoC folder in your system into this directory.
        -	The gds folder would contain the files avsddac.gds and avsdpll.gds
        -	The include folder would contain the files sandpiper.vh, sandpiper_gen.vh, sp_default.vh and sp_verilog.vh
        -	The gds folder would contain the files avsddac.lef and avsdpll.lef
        -	The lib folder would contain the files avsddac.lib and avsdpll.lib
*	Copy the constraints file(vsdbabysoc_synthesis.sdc) from the VSDBabySoC folder in your system into this directory.
*	Copy the files(macro.cfg and pin_order.cfg) from the VSDBabySoC folder in your system into this directory.
*	Create a macro.cfg file whose contents are shown below:
```
avsdpll 200 1200 N
avsddac 300 -100 N
```

**Config.mk File used for PD:**

```
export DESIGN_NICKNAME = VSDbabysoc_pri
export DESIGN_NAME = vsdbabysoc
export PLATFORM    = sky130hd


export VSDbabysoc_pri_DIR = $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)

export VERILOG_FILES =  $(sort $(wildcard $(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/*.v \
	 $(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/vsdbabysoc.v \
	 ))
	 
export VERILOG_INCLUDE_DIRS = $(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/include
export SDC_FILE      = $(wildcard $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/constraints.sdc)
export ADDITIONAL_LEFS = $(wildcard $(VSDbabysoc_pri_DIR)/avsddac.lef) \
			$(wildcard $(VSDbabysoc_pri_DIR)/avsdpll.lef)
export ADDITIONAL_LIBS = $(wildcard $(VSDbabysoc_pri_DIR)/lib/*.lib)
export ADDITIONAL_GDS  = $(wildcard $(VSDbabysoc_pri_DIR)/gds)


export PLACE_OPT_CONGESTION_DRIVEN = 1

export FP_PIN_ORDER_CFG = $(wildcard $ (VSDbabysoc_pri_DIR)/pin_order.cfg)
export FP_SIZING = absolute
export DIE_AREA = 0 0 3000 3000
export CORE_AREA = 50 50 2900 2900

export global_pins_spacing = 5

export MACRO_PLACEMENT = $(VSDbabysoc_pri_DIR)/macro.cfg

export RTLMP_BOUNDARY_WT = 0
export MACRO_PLACE_HALO = 200 200
export MACRO_PLACE_CHANNEL = 250 250

export PLACE_DENSITY_LB_ADDON = 0.3

export REMOVE_ABC_BUFFERS = 1
```

**Macro.cfg file contents:**
```
avsdpll 200 1200 N
avsddac 200 0 N
```

**Step1: Synthesis and Floorplanning:**

	In VLSI design, Floorplanning is a crucial step in physical design that involves placing blocks and macros in the chip or core area.

The primary objectives of floorplanning are to minimize area, timing, wire length, and power consumption while ensuring easy routing and reliability.

Here are the key aspects of floorplanning:

**Inputs for Floorplanning :**

    -	Gate level netlist (.v)
    -	Physical & Logical Libraries. (.lefs & .libs for all standard cell,macros,IO Pads etc.)
    -	Synopsys design constraints (.sdc).
    -	RC Tech File (TLU+ file) - to determine RC values of interconnect layers/metal layers of technology node used in our design, and hence provide RC values for computation of wire delays.
    -	Technology File (.tf).
    -	Physical Partitioning information of the design.
    -	Floorplanning Parameters like height,width,aspect ratio etc.

**Outputs of Floorplanning:**

    -	Die/Core Area: The physical description of the ASIC design.
    -	IO Pad Information: The placement of I/O pins.
    -	Placed Macros Information: The placement of macros.
    -	Standard Cell Placement Areas: The areas where standard cells are placed.
    -	Power Grid Design: The power distribution plan.
    -	Blockages: The defined regions where cells cannot be placed.

**Floorplan Control Parameters:**

    -	Aspect Ratio: The ratio of the height to the width of the chip, which affects routing resources and congestion.
    -	Core Utilization: The percentage of the core area occupied by standard cells, macros, and blockages.

**Floorplan Steps:**

    -	Define Width and Height: Determine the size of the core and die.
    -	IO Pin Placement: Place I/O pins at the boundary of the chip.
    -	Power Planning: Plan the power grid and power distribution.
    -	Macro Placement: Place macros manually using flylines.
    -	Standard Cell Row Creation: Create areas for standard cell placement.
    -	Blockages: Define blockages to ensure proper placement and routing.

**Key Terms:**

    -	Standard Cell Row: The area where standard cells are placed, divided into rows with varying heights.
    -	Flylines: Virtual connections between macros and IO pads, helping in logical placement and reducing routing resources.
    -	Halo (Keep Out Margin): The region around fixed macros where other macros and standard cells cannot be placed.

**Issues with Bad Floorplanning:**

    -	Area and Power Consumption: A bad floorplan can increase the area and power consumption of the chip.
    -	Reliability: It can affect the reliability of the chip.
    -	Timing Closure: A bad floorplan can make timing closure difficult.

**Qualifying a Good Floorplan:**

    -	Meet Timing and Congestion Constraints: Ensure that the floorplan meets timing and congestion constraints.
    -	Optimize Area and Power: Optimize the area and power consumption of the chip.
    -	Ensure Routing and Placement: Ensure that the floorplan allows for easy routing and placement.

**Automatic Floorplan Options:**

    -	Automatic Macro Placement: Most PnR tools provide automatic floorplan options, but these may not always produce optimal results.

**Macro Placement Tips:**

    -	Understand Pins and Orientation: Understand the pin requirements and orientation of macros.
    -	Follow Data Flow: Place macros following the data flow and hierarchy.
    -	Ensure Proper Orientation: Ensure that all macro pins point towards the core logic.
    -	Channel Size: Ensure that channels between macros are large enough for routing and power grids.

**Blockages:	88

    -	Soft Blockages: Partial blockages that can be removed during placement.
    -	Hard Blockages: Permanent blockages that cannot be removed.
    -	Partial Blockages: Blockages that can be removed during placement but are used to prevent congestion.

**Lab - Synthesis and Floorplanning of VSDBabySoC :**

Go to terminal and run the following commands:

```
cd OpenROAD-flow-scripts
source env.sh
cd flow
```

**1. Commands to run synthesis of VSDbabysoc:**
```
make DESIGN_CONFIG=./designs/sky130hd/VSDbabysoc_pri/config.mk synth
```

![synth_cmnd](https://github.com/user-attachments/assets/8bbfed8f-8cc6-4e59-ad09-5c518bc5f272)


![synth_cmplt](https://github.com/user-attachments/assets/06bb6244-2996-4ffd-a6cc-a46c2ace1538)

**Synthesis reports:**

![synth_report1](https://github.com/user-attachments/assets/a4dfdb2b-469c-4a7a-b0bb-f166e7740448)


![synth_report2](https://github.com/user-attachments/assets/b45d7faa-871a-4e14-a762-b67f9cd03d47)


![synth_report3](https://github.com/user-attachments/assets/2fece6b0-b929-4549-98b5-c8105eacd86e)

**2. Commands to run floorplanning of VSDbabysoc:**

```
make DESIGN_CONFIG=./designs/sky130hd/VSDbabysoc_pri/config.mk floorplan
```

![floorplan_cmnd1](https://github.com/user-attachments/assets/74b429af-04d6-4850-a3f0-1a4d0e72d4e7)


![floorplan_cmnd2](https://github.com/user-attachments/assets/c93dceea-45fa-4386-87c3-d9e738f35896)

**Floorplan Timing reoprt:**


![floorplan_rprt1](https://github.com/user-attachments/assets/9c0e1f18-1de6-419f-a4c0-1a253fd8cc58)


![floorplan_rprt2](https://github.com/user-attachments/assets/021739f8-9271-4646-9e3d-1232b5e89ca1)


![floorplan_rprt3](https://github.com/user-attachments/assets/c6d8756e-a812-4794-bdd3-ef09d92a85af)


**Floorplan openroad GUI output:**

![floorplan_gui1](https://github.com/user-attachments/assets/13808dfa-044d-4084-b7f3-0345bebda9eb)


**Step2: Placement:**

Placement occurs after logic synthesis and before routing in the VLSI design flow. The primary goals of placement include:

*	Timing Optimization: Ensuring that the placement minimizes delays in signal propagation.

*	Power Optimization: Reducing power consumption by minimizing capacitive loads and optimizing wire lengths.

*	Area Optimization: Efficiently utilizing the chip area to avoid congestion and ensure routability.

**Steps in Placement:**

Placement can be divided into several key stages:

*	**Pre-Placement:** This initial stage involves checks and the placement of physical-only cells (e.g., end-cap cells, well-tap cells) to ensure a clean design environment before standard cell placement begins.

*	**Global Placement:** During this phase, the tool determines approximate locations for each standard cell based on various constraints such as timing, congestion, and power. This step does not enforce design rule checks (DRCs), allowing for overlaps.

*	**Legalization:** After global placement, the tool adjusts the positions of cells to eliminate overlaps and ensure that all cells are in legal locations according to the design rules. This process may involve flipping cells to match power pin requirements.

*	**High Fanout Net Synthesis (HFNS):** This step addresses nets with high fanout by distributing the load across multiple drivers and adding buffers as necessary to meet timing constraints[1][2].

*	**Post-Placement Optimization:** After initial placement, further iterations are conducted to refine the design, focusing on timing, congestion, and power optimizations. This may include techniques like scan-chain reordering and tie cell insertion.


**Techniques Used in Placement:**

Placement can be driven by various priorities, including:

*	Timing-Driven Placement: Prioritizes minimizing signal delays.

*	Congestion-Driven Placement: Focuses on reducing routing congestion.

*	Power-Driven Placement: Aims to minimize power consumption during operation.

**Importance of Placement:**

	Effective placement is crucial for ensuring that the design meets performance specifications. It influences:

*	Interconnect Delay: As feature sizes shrink, the delay introduced by interconnects can dominate overall circuit performance. Proper placement can significantly reduce this delay.

*	Routability: A well-planned placement reduces the total wire length and evenly distributes routing demand, preventing hotspots and ensuring efficient routing paths.

*	Thermal Management: Placement affects heat distribution across the chip, which is vital for maintaining reliability and performance.

In summary, placement is a multi-step process that plays a vital role in the VLSI design flow, impacting timing, power, area optimization, and overall circuit performance.

**Lab - Placement of VSDBabySoC :**

Commands to run VSDbabysoc placement

```
make DESIGN_CONFIG=./designs/sky130hd/VSDbabysoc_pri/config.mk place
```

**Synthesis Report:**

```

==========================================================================
detailed place report_tns
--------------------------------------------------------------------------
tns 0.00

==========================================================================
detailed place report_wns
--------------------------------------------------------------------------
wns 0.00

==========================================================================
detailed place report_worst_slack
--------------------------------------------------------------------------
worst slack 6.71

==========================================================================
detailed place report_checks -path_delay min
--------------------------------------------------------------------------
Startpoint: core_pri.CPU_is_slt_a2$_DFF_P_
            (rising edge-triggered flip-flop clocked by clk)
Endpoint: core_pri.CPU_is_slt_a3$_DFF_P_
          (rising edge-triggered flip-flop clocked by clk)
Path Group: clk
Path Type: min

Fanout     Cap    Slew   Delay    Time   Description
-----------------------------------------------------------------------------
                  0.00    0.00    0.00   clock clk (rise edge)
                          3.00    3.00   clock network delay (ideal)
                  0.00    0.00    3.00 ^ core_pri.CPU_is_slt_a2$_DFF_P_/CLK (sky130_fd_sc_hd__dfxtp_1)
     1    0.00    0.04    0.28    3.28 ^ core_pri.CPU_is_slt_a2$_DFF_P_/Q (sky130_fd_sc_hd__dfxtp_1)
                                         core_pri.CPU_is_slt_a2 (net)
                  0.04    0.00    3.28 ^ core_pri.CPU_is_slt_a3$_DFF_P_/D (sky130_fd_sc_hd__dfxtp_1)
                                  3.28   data arrival time

                  0.00    0.00    0.00   clock clk (rise edge)
                          3.00    3.00   clock network delay (ideal)
                          0.92    3.92   clock uncertainty
                          0.00    3.92   clock reconvergence pessimism
                                  3.92 ^ core_pri.CPU_is_slt_a3$_DFF_P_/CLK (sky130_fd_sc_hd__dfxtp_1)
                         -0.04    3.88   library hold time
                                  3.88   data required time
-----------------------------------------------------------------------------
                                  3.88   data required time
                                 -3.28   data arrival time
-----------------------------------------------------------------------------
                                 -0.61   slack (VIOLATED)



==========================================================================
detailed place report_checks -path_delay max
--------------------------------------------------------------------------
Startpoint: core_pri.CPU_imm_a3[30]$_DFF_P_
            (rising edge-triggered flip-flop clocked by clk)
Endpoint: core_pri.CPU_Xreg_value_a4[9][29]$_SDFFE_PP0P_
          (rising edge-triggered flip-flop clocked by clk)
Path Group: clk
Path Type: max

Fanout     Cap    Slew   Delay    Time   Description
-----------------------------------------------------------------------------
                  0.00    0.00    0.00   clock clk (rise edge)
                          3.00    3.00   clock network delay (ideal)
                  0.00    0.00    3.00 ^ core_pri.CPU_imm_a3[30]$_DFF_P_/CLK (sky130_fd_sc_hd__dfxtp_4)
    51    0.28    0.76    0.83    3.83 ^ core_pri.CPU_imm_a3[30]$_DFF_P_/Q (sky130_fd_sc_hd__dfxtp_4)
                                         core_pri.CPU_imm_a3[10] (net)
                  0.76    0.00    3.83 ^ _11540_/B (sky130_fd_sc_hd__ha_2)
     6    0.03    0.10    0.49    4.33 v _11540_/SUM (sky130_fd_sc_hd__ha_2)
                                         _05659_ (net)
                  0.10    0.00    4.33 v _08036_/A_N (sky130_fd_sc_hd__nand2b_1)
     1    0.01    0.07    0.18    4.51 v _08036_/Y (sky130_fd_sc_hd__nand2b_1)
                                         _02663_ (net)
                  0.07    0.00    4.51 v _08038_/B1 (sky130_fd_sc_hd__a221oi_2)
     2    0.01    0.27    0.29    4.80 ^ _08038_/Y (sky130_fd_sc_hd__a221oi_2)
                                         _02665_ (net)
                  0.27    0.00    4.80 ^ _08089_/A3 (sky130_fd_sc_hd__o31a_1)
     1    0.01    0.11    0.20    5.00 ^ _08089_/X (sky130_fd_sc_hd__o31a_1)
                                         _02714_ (net)
                  0.11    0.00    5.00 ^ _08090_/B1 (sky130_fd_sc_hd__a311oi_4)
     5    0.03    0.18    0.09    5.09 v _08090_/Y (sky130_fd_sc_hd__a311oi_4)
                                         _02715_ (net)
                  0.18    0.00    5.09 v _08283_/A2 (sky130_fd_sc_hd__o31a_2)
     4    0.02    0.09    0.43    5.53 v _08283_/X (sky130_fd_sc_hd__o31a_2)
                                         _02899_ (net)
                  0.09    0.00    5.53 v _08499_/A2 (sky130_fd_sc_hd__o2111ai_2)
     1    0.01    0.21    0.22    5.75 ^ _08499_/Y (sky130_fd_sc_hd__o2111ai_2)
                                         _03107_ (net)
                  0.21    0.00    5.75 ^ _08500_/C1 (sky130_fd_sc_hd__o311ai_4)
     1    0.01    0.14    0.14    5.89 v _08500_/Y (sky130_fd_sc_hd__o311ai_4)
                                         _03108_ (net)
                  0.14    0.00    5.89 v _08505_/B1 (sky130_fd_sc_hd__a211oi_4)
    17    0.10    1.06    0.90    6.79 ^ _08505_/Y (sky130_fd_sc_hd__a211oi_4)
                                         _03113_ (net)
                  1.06    0.01    6.80 ^ _09971_/A1 (sky130_fd_sc_hd__o21ai_0)
     1    0.00    0.18    0.23    7.03 v _09971_/Y (sky130_fd_sc_hd__o21ai_0)
                                         _01013_ (net)
                  0.18    0.00    7.03 v core_pri.CPU_Xreg_value_a4[9][29]$_SDFFE_PP0P_/D (sky130_fd_sc_hd__dfxtp_1)
                                  7.03   data arrival time

                  0.00   11.50   11.50   clock clk (rise edge)
                          3.00   14.50   clock network delay (ideal)
                         -0.57   13.93   clock uncertainty
                          0.00   13.93   clock reconvergence pessimism
                                 13.93 ^ core_pri.CPU_Xreg_value_a4[9][29]$_SDFFE_PP0P_/CLK (sky130_fd_sc_hd__dfxtp_1)
                         -0.18   13.75   library setup time
                                 13.75   data required time
-----------------------------------------------------------------------------
                                 13.75   data required time
                                 -7.03   data arrival time
-----------------------------------------------------------------------------
                                  6.71   slack (MET)



==========================================================================
detailed place report_checks -unconstrained
--------------------------------------------------------------------------
Startpoint: core_pri.CPU_imm_a3[30]$_DFF_P_
            (rising edge-triggered flip-flop clocked by clk)
Endpoint: core_pri.CPU_Xreg_value_a4[9][29]$_SDFFE_PP0P_
          (rising edge-triggered flip-flop clocked by clk)
Path Group: clk
Path Type: max

Fanout     Cap    Slew   Delay    Time   Description
-----------------------------------------------------------------------------
                  0.00    0.00    0.00   clock clk (rise edge)
                          3.00    3.00   clock network delay (ideal)
                  0.00    0.00    3.00 ^ core_pri.CPU_imm_a3[30]$_DFF_P_/CLK (sky130_fd_sc_hd__dfxtp_4)
    51    0.28    0.76    0.83    3.83 ^ core_pri.CPU_imm_a3[30]$_DFF_P_/Q (sky130_fd_sc_hd__dfxtp_4)
                                         core_pri.CPU_imm_a3[10] (net)
                  0.76    0.00    3.83 ^ _11540_/B (sky130_fd_sc_hd__ha_2)
     6    0.03    0.10    0.49    4.33 v _11540_/SUM (sky130_fd_sc_hd__ha_2)
                                         _05659_ (net)
                  0.10    0.00    4.33 v _08036_/A_N (sky130_fd_sc_hd__nand2b_1)
     1    0.01    0.07    0.18    4.51 v _08036_/Y (sky130_fd_sc_hd__nand2b_1)
                                         _02663_ (net)
                  0.07    0.00    4.51 v _08038_/B1 (sky130_fd_sc_hd__a221oi_2)
     2    0.01    0.27    0.29    4.80 ^ _08038_/Y (sky130_fd_sc_hd__a221oi_2)
                                         _02665_ (net)
                  0.27    0.00    4.80 ^ _08089_/A3 (sky130_fd_sc_hd__o31a_1)
     1    0.01    0.11    0.20    5.00 ^ _08089_/X (sky130_fd_sc_hd__o31a_1)
                                         _02714_ (net)
                  0.11    0.00    5.00 ^ _08090_/B1 (sky130_fd_sc_hd__a311oi_4)
     5    0.03    0.18    0.09    5.09 v _08090_/Y (sky130_fd_sc_hd__a311oi_4)
                                         _02715_ (net)
                  0.18    0.00    5.09 v _08283_/A2 (sky130_fd_sc_hd__o31a_2)
     4    0.02    0.09    0.43    5.53 v _08283_/X (sky130_fd_sc_hd__o31a_2)
                                         _02899_ (net)
                  0.09    0.00    5.53 v _08499_/A2 (sky130_fd_sc_hd__o2111ai_2)
     1    0.01    0.21    0.22    5.75 ^ _08499_/Y (sky130_fd_sc_hd__o2111ai_2)
                                         _03107_ (net)
                  0.21    0.00    5.75 ^ _08500_/C1 (sky130_fd_sc_hd__o311ai_4)
     1    0.01    0.14    0.14    5.89 v _08500_/Y (sky130_fd_sc_hd__o311ai_4)
                                         _03108_ (net)
                  0.14    0.00    5.89 v _08505_/B1 (sky130_fd_sc_hd__a211oi_4)
    17    0.10    1.06    0.90    6.79 ^ _08505_/Y (sky130_fd_sc_hd__a211oi_4)
                                         _03113_ (net)
                  1.06    0.01    6.80 ^ _09971_/A1 (sky130_fd_sc_hd__o21ai_0)
     1    0.00    0.18    0.23    7.03 v _09971_/Y (sky130_fd_sc_hd__o21ai_0)
                                         _01013_ (net)
                  0.18    0.00    7.03 v core_pri.CPU_Xreg_value_a4[9][29]$_SDFFE_PP0P_/D (sky130_fd_sc_hd__dfxtp_1)
                                  7.03   data arrival time

                  0.00   11.50   11.50   clock clk (rise edge)
                          3.00   14.50   clock network delay (ideal)
                         -0.57   13.93   clock uncertainty
                          0.00   13.93   clock reconvergence pessimism
                                 13.93 ^ core_pri.CPU_Xreg_value_a4[9][29]$_SDFFE_PP0P_/CLK (sky130_fd_sc_hd__dfxtp_1)
                         -0.18   13.75   library setup time
                                 13.75   data required time
-----------------------------------------------------------------------------
                                 13.75   data required time
                                 -7.03   data arrival time
-----------------------------------------------------------------------------
                                  6.71   slack (MET)



==========================================================================
detailed place report_check_types -max_slew -max_cap -max_fanout -violators
--------------------------------------------------------------------------

==========================================================================
detailed place max_slew_check_slack
--------------------------------------------------------------------------
0.23974600434303284

==========================================================================
detailed place max_slew_check_limit
--------------------------------------------------------------------------
1.5

==========================================================================
detailed place max_slew_check_slack_limit
--------------------------------------------------------------------------
0.1598

==========================================================================
detailed place max_fanout_check_slack
--------------------------------------------------------------------------
1.0000000150474662e+30

==========================================================================
detailed place max_fanout_check_limit
--------------------------------------------------------------------------
1.0000000150474662e+30

==========================================================================
detailed place max_capacitance_check_slack
--------------------------------------------------------------------------
0.018143348395824432

==========================================================================
detailed place max_capacitance_check_limit
--------------------------------------------------------------------------
0.021067000925540924

==========================================================================
detailed place max_capacitance_check_slack_limit
--------------------------------------------------------------------------
0.8612

==========================================================================
detailed place max_slew_violation_count
--------------------------------------------------------------------------
max slew violation count 0

==========================================================================
detailed place max_fanout_violation_count
--------------------------------------------------------------------------
max fanout violation count 0

==========================================================================
detailed place max_cap_violation_count
--------------------------------------------------------------------------
max cap violation count 0

==========================================================================
detailed place setup_violation_count
--------------------------------------------------------------------------
setup violation count 0

==========================================================================
detailed place hold_violation_count
--------------------------------------------------------------------------
hold violation count 1263

==========================================================================
detailed place report_checks -path_delay max reg to reg
--------------------------------------------------------------------------
Startpoint: core_pri.CPU_imm_a3[30]$_DFF_P_
            (rising edge-triggered flip-flop clocked by clk)
Endpoint: core_pri.CPU_Xreg_value_a4[9][29]$_SDFFE_PP0P_
          (rising edge-triggered flip-flop clocked by clk)
Path Group: clk
Path Type: max

  Delay    Time   Description
---------------------------------------------------------
   0.00    0.00   clock clk (rise edge)
   3.00    3.00   clock network delay (ideal)
   0.00    3.00 ^ core_pri.CPU_imm_a3[30]$_DFF_P_/CLK (sky130_fd_sc_hd__dfxtp_4)
   0.83    3.83 ^ core_pri.CPU_imm_a3[30]$_DFF_P_/Q (sky130_fd_sc_hd__dfxtp_4)
   0.50    4.33 v _11540_/SUM (sky130_fd_sc_hd__ha_2)
   0.18    4.51 v _08036_/Y (sky130_fd_sc_hd__nand2b_1)
   0.29    4.80 ^ _08038_/Y (sky130_fd_sc_hd__a221oi_2)
   0.20    5.00 ^ _08089_/X (sky130_fd_sc_hd__o31a_1)
   0.09    5.09 v _08090_/Y (sky130_fd_sc_hd__a311oi_4)
   0.43    5.53 v _08283_/X (sky130_fd_sc_hd__o31a_2)
   0.22    5.75 ^ _08499_/Y (sky130_fd_sc_hd__o2111ai_2)
   0.14    5.89 v _08500_/Y (sky130_fd_sc_hd__o311ai_4)
   0.90    6.79 ^ _08505_/Y (sky130_fd_sc_hd__a211oi_4)
   0.25    7.03 v _09971_/Y (sky130_fd_sc_hd__o21ai_0)
   0.00    7.03 v core_pri.CPU_Xreg_value_a4[9][29]$_SDFFE_PP0P_/D (sky130_fd_sc_hd__dfxtp_1)
           7.03   data arrival time

  11.50   11.50   clock clk (rise edge)
   3.00   14.50   clock network delay (ideal)
  -0.57   13.93   clock uncertainty
   0.00   13.93   clock reconvergence pessimism
          13.93 ^ core_pri.CPU_Xreg_value_a4[9][29]$_SDFFE_PP0P_/CLK (sky130_fd_sc_hd__dfxtp_1)
  -0.18   13.75   library setup time
          13.75   data required time
---------------------------------------------------------
          13.75   data required time
          -7.03   data arrival time
---------------------------------------------------------
           6.71   slack (MET)



==========================================================================
detailed place report_checks -path_delay min reg to reg
--------------------------------------------------------------------------
Startpoint: core_pri.CPU_is_slt_a2$_DFF_P_
            (rising edge-triggered flip-flop clocked by clk)
Endpoint: core_pri.CPU_is_slt_a3$_DFF_P_
          (rising edge-triggered flip-flop clocked by clk)
Path Group: clk
Path Type: min

  Delay    Time   Description
---------------------------------------------------------
   0.00    0.00   clock clk (rise edge)
   3.00    3.00   clock network delay (ideal)
   0.00    3.00 ^ core_pri.CPU_is_slt_a2$_DFF_P_/CLK (sky130_fd_sc_hd__dfxtp_1)
   0.28    3.28 ^ core_pri.CPU_is_slt_a2$_DFF_P_/Q (sky130_fd_sc_hd__dfxtp_1)
   0.00    3.28 ^ core_pri.CPU_is_slt_a3$_DFF_P_/D (sky130_fd_sc_hd__dfxtp_1)
           3.28   data arrival time

   0.00    0.00   clock clk (rise edge)
   3.00    3.00   clock network delay (ideal)
   0.92    3.92   clock uncertainty
   0.00    3.92   clock reconvergence pessimism
           3.92 ^ core_pri.CPU_is_slt_a3$_DFF_P_/CLK (sky130_fd_sc_hd__dfxtp_1)
  -0.04    3.88   library hold time
           3.88   data required time
---------------------------------------------------------
           3.88   data required time
          -3.28   data arrival time
---------------------------------------------------------
          -0.61   slack (VIOLATED)



==========================================================================
detailed place critical path target clock latency max path
--------------------------------------------------------------------------
0

==========================================================================
detailed place critical path target clock latency min path
--------------------------------------------------------------------------
0

==========================================================================
detailed place critical path source clock latency min path
--------------------------------------------------------------------------
0

==========================================================================
detailed place critical path delay
--------------------------------------------------------------------------
7.0342

==========================================================================
detailed place critical path slack
--------------------------------------------------------------------------
6.7119

==========================================================================
detailed place slack div critical path delay
--------------------------------------------------------------------------
95.418100

==========================================================================
detailed place report_power
--------------------------------------------------------------------------
Group                  Internal  Switching    Leakage      Total
                          Power      Power      Power      Power (Watts)
----------------------------------------------------------------
Sequential             4.93e-03   7.48e-04   1.04e-08   5.68e-03  55.0%
Combinational          1.41e-03   3.23e-03   1.10e-08   4.64e-03  45.0%
Clock                  0.00e+00   0.00e+00   0.00e+00   0.00e+00   0.0%
Macro                  0.00e+00   0.00e+00   0.00e+00   0.00e+00   0.0%
Pad                    0.00e+00   0.00e+00   0.00e+00   0.00e+00   0.0%
----------------------------------------------------------------
Total                  6.35e-03   3.98e-03   2.14e-08   1.03e-02 100.0%
                          61.5%      38.5%       0.0%
```

**Screenshots of VSDbabysoc placed macros:**

![place_gui](https://github.com/user-attachments/assets/e9976afc-0a7c-4b9b-a25d-0b563b3320ba)

![pll_place](https://github.com/user-attachments/assets/66158f03-74ee-4588-8acb-2241996fbaa5)

![riscv_place](https://github.com/user-attachments/assets/52fc0858-a73f-48a2-ab05-3d86520f3018)


**Step3: Clock Tree Synthesis:**

CTS involves connecting the clock signal from the clock port to the clock pins of sequential cells while minimizing insertion delay and balancing skew. The clock network is typically categorized as a high fanout net, which requires special handling due to its significant power consumption—often accounting for 30-40% of total chip power—and its susceptibility to electromigration (EM) effects.
Key Objectives of CTS

*	Minimize Insertion Delay: This is crucial for ensuring that the clock signal reaches all components in a timely manner, thus maintaining the overall performance of the design.

*	Balance Skew: Skew refers to the difference in arrival times of the clock signal at different sequential elements. Balancing skew is vital to ensure synchronous operation of the circuit.

*	Power Optimization: Since the clock network consumes a substantial amount of power, optimizing its design can lead to significant energy savings.

**Steps in Clock Tree Synthesis:**

The CTS process typically includes the following steps:

*	Preparation: This involves checking the legality of the design, ensuring power connections are correct, and verifying that the timing quality of results (QoR) is acceptable.

*	Clustering: Grouping sink pins based on their geometric locations to facilitate better skew management.

*	Buffer Insertion: Automatically inserting buffers and inverters along the clock paths to manage load and reduce insertion delay.

*	Balancing: Using clock buffers and inverters to achieve a balanced clock distribution across the design.

*	Post-Conditioning: Final adjustments to ensure that all design rules are met and that the clock tree operates within specified parameters for skew and insertion delay.

**Types of Clock Tree Structures:**
--------

Several structures can be utilized for building the clock tree, including:

*	H-Tree Structure: A balanced tree structure that minimizes skew.
*	X-Tree Structure: Similar to the H-tree but optimized for different geometries.
*	Geometric Matching Algorithm (GMA): A method for optimizing the layout of the clock tree.
*	Pi Tree Structure: A structure that balances loads effectively.
*	Fishbone Structure: A more complex design that can handle varying loads and distances.

**Inputs and Outputs of CTS:**
-------
**Inputs Required for CTS:**

*	Placement Database (DB): Contains the netlist after placement, including various technology files and specifications.
*	Clock Tree Specification File: Defines the requirements and constraints for the clock tree.
*	Library Files: Include information on clock buffers and inverters used in the design.

**Outputs of CTS:**

After the CTS process, the outputs typically include:

*	A netlist that reflects the clock tree configuration.
*	Timing reports detailing setup and hold times.
*	Skew and latency reports to assess clock performance.

**Quality Checks Post-CTS:**

After completing the CTS, several checks are necessary to ensure the clock tree meets design goals:

*	Insertion Delay: Must meet target values.
*	Skew Balancing: Should be within acceptable limits.
*	Signal Integrity: Ensuring minimal crosstalk and other noise effects.
*	Power Consumption: Evaluating the clock tree's power usage to ensure it aligns with design specifications.

In summary, Clock Tree Synthesis is a fundamental aspect of VLSI design that directly impacts the performance, power efficiency, and reliability of integrated circuits. Proper execution of CTS ensures that the clock signal is effectively distributed, enabling synchronous operation of all components within the design.

**Lab - CTS of VSDBabySoC :**

**Command to run Clock Tree Synthesis (CTS):**

```
make DESIGN_CONFIG=./designs/sky130hd/VSDbabysoc_pri/config.mk cts
```

![cts_cmnd](https://github.com/user-attachments/assets/2f42184c-89dd-4152-8050-03db3e69468f)


![cts_cmnd2](https://github.com/user-attachments/assets/150feb33-7b11-4073-8813-00625a8a781a)

**CTS Report:**

```

==========================================================================
cts final report_tns
--------------------------------------------------------------------------
tns 0.00

==========================================================================
cts final report_wns
--------------------------------------------------------------------------
wns 0.00

==========================================================================
cts final report_worst_slack
--------------------------------------------------------------------------
worst slack 6.33

==========================================================================
cts final report_clock_skew
--------------------------------------------------------------------------
Clock clk
   2.94 source latency core_pri.CPU_is_addi_a3$_DFF_P_/CLK ^
  -2.85 target latency core_pri.CPU_Xreg_value_a4[4][2]$_SDFFE_PP1P_/CLK ^
   0.57 clock uncertainty
   0.00 CRPR
--------------
   0.67 setup skew


==========================================================================
cts final report_checks -path_delay min
--------------------------------------------------------------------------
Startpoint: core_pri.CPU_dmem_rd_data_a5[22]$_DFF_P_
            (rising edge-triggered flip-flop clocked by clk)
Endpoint: core_pri.CPU_Xreg_value_a4[11][22]$_SDFFE_PP0P_
          (rising edge-triggered flip-flop clocked by clk)
Path Group: clk
Path Type: min

Fanout     Cap    Slew   Delay    Time   Description
-----------------------------------------------------------------------------
                          0.00    0.00   clock clk (rise edge)
                          2.00    2.00   clock source latency
     1    0.22    0.00    0.00    2.00 ^ avsdpll/CLK (avsdpll)
                                         clk_pri (net)
                  0.03    0.01    2.01 ^ clkbuf_0_clk_pri/A (sky130_fd_sc_hd__clkbuf_16)
     8    0.23    0.24    0.27    2.28 ^ clkbuf_0_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_0_clk_pri (net)
                  0.24    0.00    2.28 ^ clkbuf_3_4_0_clk_pri/A (sky130_fd_sc_hd__clkbuf_16)
     2    0.04    0.07    0.21    2.49 ^ clkbuf_3_4_0_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_3_4_0_clk_pri (net)
                  0.07    0.00    2.49 ^ clkbuf_4_8__f_clk_pri/A (sky130_fd_sc_hd__clkbuf_16)
     9    0.16    0.17    0.23    2.72 ^ clkbuf_4_8__f_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_4_8__leaf_clk_pri (net)
                  0.17    0.00    2.72 ^ clkbuf_leaf_9_clk_pri/A (sky130_fd_sc_hd__clkbuf_16)
     9    0.03    0.06    0.18    2.90 ^ clkbuf_leaf_9_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_leaf_9_clk_pri (net)
                  0.06    0.00    2.90 ^ core_pri.CPU_dmem_rd_data_a5[22]$_DFF_P_/CLK (sky130_fd_sc_hd__dfxtp_1)
     1    0.02    0.11    0.37    3.27 v core_pri.CPU_dmem_rd_data_a5[22]$_DFF_P_/Q (sky130_fd_sc_hd__dfxtp_1)
                                         core_pri.CPU_dmem_rd_data_a5[22] (net)
                  0.11    0.00    3.27 v _08321_/A_N (sky130_fd_sc_hd__nand2b_4)
    15    0.06    0.14    0.26    3.53 v _08321_/Y (sky130_fd_sc_hd__nand2b_4)
                                         _02936_ (net)
                  0.14    0.00    3.53 v _08714_/A (sky130_fd_sc_hd__nor2_1)
     1    0.00    0.08    0.13    3.66 ^ _08714_/Y (sky130_fd_sc_hd__nor2_1)
                                         _03293_ (net)
                  0.08    0.00    3.66 ^ _08715_/C1 (sky130_fd_sc_hd__a2111oi_0)
     1    0.00    0.05    0.06    3.72 v _08715_/Y (sky130_fd_sc_hd__a2111oi_0)
                                         _00590_ (net)
                  0.05    0.00    3.72 v core_pri.CPU_Xreg_value_a4[11][22]$_SDFFE_PP0P_/D (sky130_fd_sc_hd__dfxtp_1)
                                  3.72   data arrival time

                          0.00    0.00   clock clk (rise edge)
                          2.00    2.00   clock source latency
     1    0.22    0.00    0.00    2.00 ^ avsdpll/CLK (avsdpll)
                                         clk_pri (net)
                  0.03    0.01    2.01 ^ clkbuf_0_clk_pri/A (sky130_fd_sc_hd__clkbuf_16)
     8    0.23    0.24    0.27    2.28 ^ clkbuf_0_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_0_clk_pri (net)
                  0.24    0.00    2.28 ^ clkbuf_3_1_0_clk_pri/A (sky130_fd_sc_hd__clkbuf_16)
     2    0.04    0.06    0.21    2.49 ^ clkbuf_3_1_0_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_3_1_0_clk_pri (net)
                  0.06    0.00    2.49 ^ clkbuf_4_2__f_clk_pri/A (sky130_fd_sc_hd__clkbuf_16)
     7    0.10    0.12    0.20    2.69 ^ clkbuf_4_2__f_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_4_2__leaf_clk_pri (net)
                  0.12    0.00    2.69 ^ clkbuf_leaf_3_clk_pri/A (sky130_fd_sc_hd__clkbuf_16)
    11    0.04    0.06    0.17    2.85 ^ clkbuf_leaf_3_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_leaf_3_clk_pri (net)
                  0.06    0.00    2.85 ^ core_pri.CPU_Xreg_value_a4[11][22]$_SDFFE_PP0P_/CLK (sky130_fd_sc_hd__dfxtp_1)
                          0.92    3.77   clock uncertainty
                          0.00    3.77   clock reconvergence pessimism
                         -0.05    3.72   library hold time
                                  3.72   data required time
-----------------------------------------------------------------------------
                                  3.72   data required time
                                 -3.72   data arrival time
-----------------------------------------------------------------------------
                                  0.00   slack (MET)



==========================================================================
cts final report_checks -path_delay max
--------------------------------------------------------------------------
Startpoint: core_pri.CPU_imm_a3[30]$_DFF_P_
            (rising edge-triggered flip-flop clocked by clk)
Endpoint: core_pri.CPU_Xreg_value_a4[5][30]$_SDFFE_PP0P_
          (rising edge-triggered flip-flop clocked by clk)
Path Group: clk
Path Type: max

Fanout     Cap    Slew   Delay    Time   Description
-----------------------------------------------------------------------------
                          0.00    0.00   clock clk (rise edge)
                          2.00    2.00   clock source latency
     1    0.22    0.00    0.00    2.00 ^ avsdpll/CLK (avsdpll)
                                         clk_pri (net)
                  0.03    0.01    2.01 ^ clkbuf_0_clk_pri/A (sky130_fd_sc_hd__clkbuf_16)
     8    0.23    0.24    0.27    2.28 ^ clkbuf_0_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_0_clk_pri (net)
                  0.24    0.00    2.28 ^ clkbuf_3_6_0_clk_pri/A (sky130_fd_sc_hd__clkbuf_16)
     2    0.04    0.06    0.21    2.49 ^ clkbuf_3_6_0_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_3_6_0_clk_pri (net)
                  0.06    0.00    2.49 ^ clkbuf_4_13__f_clk_pri/A (sky130_fd_sc_hd__clkbuf_16)
    13    0.19    0.20    0.26    2.75 ^ clkbuf_4_13__f_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_4_13__leaf_clk_pri (net)
                  0.20    0.00    2.75 ^ clkbuf_leaf_73_clk_pri/A (sky130_fd_sc_hd__clkbuf_16)
    10    0.04    0.06    0.19    2.94 ^ clkbuf_leaf_73_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_leaf_73_clk_pri (net)
                  0.06    0.00    2.94 ^ core_pri.CPU_imm_a3[30]$_DFF_P_/CLK (sky130_fd_sc_hd__dfxtp_4)
    51    0.28    0.77    0.85    3.80 ^ core_pri.CPU_imm_a3[30]$_DFF_P_/Q (sky130_fd_sc_hd__dfxtp_4)
                                         core_pri.CPU_imm_a3[10] (net)
                  0.77    0.01    3.80 ^ _11532_/B (sky130_fd_sc_hd__ha_2)
     6    0.02    0.09    0.49    4.29 v _11532_/SUM (sky130_fd_sc_hd__ha_2)
                                         _05641_ (net)
                  0.09    0.00    4.29 v _07986_/C (sky130_fd_sc_hd__nor3_2)
     3    0.02    0.31    0.26    4.55 ^ _07986_/Y (sky130_fd_sc_hd__nor3_2)
                                         _02614_ (net)
                  0.31    0.00    4.55 ^ _07988_/A (sky130_fd_sc_hd__nand2_1)
     2    0.01    0.14    0.18    4.73 v _07988_/Y (sky130_fd_sc_hd__nand2_1)
                                         _02616_ (net)
                  0.14    0.00    4.73 v _07992_/A2 (sky130_fd_sc_hd__a21oi_2)
     2    0.02    0.22    0.27    4.99 ^ _07992_/Y (sky130_fd_sc_hd__a21oi_2)
                                         _02620_ (net)
                  0.22    0.00    4.99 ^ _08110_/A1 (sky130_fd_sc_hd__o21ai_4)
     4    0.03    0.14    0.13    5.12 v _08110_/Y (sky130_fd_sc_hd__o21ai_4)
                                         _02734_ (net)
                  0.14    0.00    5.12 v _08312_/A1 (sky130_fd_sc_hd__a21oi_2)
     3    0.02    0.24    0.28    5.40 ^ _08312_/Y (sky130_fd_sc_hd__a21oi_2)
                                         _02927_ (net)
                  0.24    0.00    5.40 ^ _08525_/A1 (sky130_fd_sc_hd__o211ai_2)
     2    0.01    0.12    0.14    5.54 v _08525_/Y (sky130_fd_sc_hd__o211ai_2)
                                         _03130_ (net)
                  0.12    0.00    5.54 v _08529_/B (sky130_fd_sc_hd__and3_1)
     1    0.01    0.06    0.22    5.77 v _08529_/X (sky130_fd_sc_hd__and3_1)
                                         _03134_ (net)
                  0.06    0.00    5.77 v _08544_/B (sky130_fd_sc_hd__nor3_4)
    17    0.10    0.94    0.76    6.53 ^ _08544_/Y (sky130_fd_sc_hd__nor3_4)
                                         _03149_ (net)
                  0.94    0.01    6.54 ^ _09607_/B2 (sky130_fd_sc_hd__o221ai_1)
     1    0.00    0.16    0.19    6.73 v _09607_/Y (sky130_fd_sc_hd__o221ai_1)
                                         _00887_ (net)
                  0.16    0.00    6.73 v hold1511/A (sky130_fd_sc_hd__dlygate4sd3_1)
     1    0.00    0.05    0.60    7.33 v hold1511/X (sky130_fd_sc_hd__dlygate4sd3_1)
                                         net1643 (net)
                  0.05    0.00    7.33 v core_pri.CPU_Xreg_value_a4[5][30]$_SDFFE_PP0P_/D (sky130_fd_sc_hd__dfxtp_1)
                                  7.33   data arrival time

                         11.50   11.50   clock clk (rise edge)
                          2.00   13.50   clock source latency
     1    0.22    0.00    0.00   13.50 ^ avsdpll/CLK (avsdpll)
                                         clk_pri (net)
                  0.03    0.01   13.51 ^ clkbuf_0_clk_pri/A (sky130_fd_sc_hd__clkbuf_16)
     8    0.23    0.24    0.27   13.78 ^ clkbuf_0_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_0_clk_pri (net)
                  0.24    0.00   13.78 ^ clkbuf_3_0_0_clk_pri/A (sky130_fd_sc_hd__clkbuf_16)
     2    0.04    0.06    0.21   13.99 ^ clkbuf_3_0_0_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_3_0_0_clk_pri (net)
                  0.06    0.00   13.99 ^ clkbuf_4_1__f_clk_pri/A (sky130_fd_sc_hd__clkbuf_16)
     7    0.10    0.12    0.20   14.19 ^ clkbuf_4_1__f_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_4_1__leaf_clk_pri (net)
                  0.12    0.00   14.19 ^ clkbuf_leaf_124_clk_pri/A (sky130_fd_sc_hd__clkbuf_16)
    11    0.04    0.06    0.17   14.35 ^ clkbuf_leaf_124_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_leaf_124_clk_pri (net)
                  0.06    0.00   14.35 ^ core_pri.CPU_Xreg_value_a4[5][30]$_SDFFE_PP0P_/CLK (sky130_fd_sc_hd__dfxtp_1)
                         -0.57   13.78   clock uncertainty
                          0.00   13.78   clock reconvergence pessimism
                         -0.11   13.67   library setup time
                                 13.67   data required time
-----------------------------------------------------------------------------
                                 13.67   data required time
                                 -7.33   data arrival time
-----------------------------------------------------------------------------
                                  6.33   slack (MET)



==========================================================================
cts final report_checks -unconstrained
--------------------------------------------------------------------------
Startpoint: core_pri.CPU_imm_a3[30]$_DFF_P_
            (rising edge-triggered flip-flop clocked by clk)
Endpoint: core_pri.CPU_Xreg_value_a4[5][30]$_SDFFE_PP0P_
          (rising edge-triggered flip-flop clocked by clk)
Path Group: clk
Path Type: max

Fanout     Cap    Slew   Delay    Time   Description
-----------------------------------------------------------------------------
                          0.00    0.00   clock clk (rise edge)
                          2.00    2.00   clock source latency
     1    0.22    0.00    0.00    2.00 ^ avsdpll/CLK (avsdpll)
                                         clk_pri (net)
                  0.03    0.01    2.01 ^ clkbuf_0_clk_pri/A (sky130_fd_sc_hd__clkbuf_16)
     8    0.23    0.24    0.27    2.28 ^ clkbuf_0_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_0_clk_pri (net)
                  0.24    0.00    2.28 ^ clkbuf_3_6_0_clk_pri/A (sky130_fd_sc_hd__clkbuf_16)
     2    0.04    0.06    0.21    2.49 ^ clkbuf_3_6_0_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_3_6_0_clk_pri (net)
                  0.06    0.00    2.49 ^ clkbuf_4_13__f_clk_pri/A (sky130_fd_sc_hd__clkbuf_16)
    13    0.19    0.20    0.26    2.75 ^ clkbuf_4_13__f_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_4_13__leaf_clk_pri (net)
                  0.20    0.00    2.75 ^ clkbuf_leaf_73_clk_pri/A (sky130_fd_sc_hd__clkbuf_16)
    10    0.04    0.06    0.19    2.94 ^ clkbuf_leaf_73_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_leaf_73_clk_pri (net)
                  0.06    0.00    2.94 ^ core_pri.CPU_imm_a3[30]$_DFF_P_/CLK (sky130_fd_sc_hd__dfxtp_4)
    51    0.28    0.77    0.85    3.80 ^ core_pri.CPU_imm_a3[30]$_DFF_P_/Q (sky130_fd_sc_hd__dfxtp_4)
                                         core_pri.CPU_imm_a3[10] (net)
                  0.77    0.01    3.80 ^ _11532_/B (sky130_fd_sc_hd__ha_2)
     6    0.02    0.09    0.49    4.29 v _11532_/SUM (sky130_fd_sc_hd__ha_2)
                                         _05641_ (net)
                  0.09    0.00    4.29 v _07986_/C (sky130_fd_sc_hd__nor3_2)
     3    0.02    0.31    0.26    4.55 ^ _07986_/Y (sky130_fd_sc_hd__nor3_2)
                                         _02614_ (net)
                  0.31    0.00    4.55 ^ _07988_/A (sky130_fd_sc_hd__nand2_1)
     2    0.01    0.14    0.18    4.73 v _07988_/Y (sky130_fd_sc_hd__nand2_1)
                                         _02616_ (net)
                  0.14    0.00    4.73 v _07992_/A2 (sky130_fd_sc_hd__a21oi_2)
     2    0.02    0.22    0.27    4.99 ^ _07992_/Y (sky130_fd_sc_hd__a21oi_2)
                                         _02620_ (net)
                  0.22    0.00    4.99 ^ _08110_/A1 (sky130_fd_sc_hd__o21ai_4)
     4    0.03    0.14    0.13    5.12 v _08110_/Y (sky130_fd_sc_hd__o21ai_4)
                                         _02734_ (net)
                  0.14    0.00    5.12 v _08312_/A1 (sky130_fd_sc_hd__a21oi_2)
     3    0.02    0.24    0.28    5.40 ^ _08312_/Y (sky130_fd_sc_hd__a21oi_2)
                                         _02927_ (net)
                  0.24    0.00    5.40 ^ _08525_/A1 (sky130_fd_sc_hd__o211ai_2)
     2    0.01    0.12    0.14    5.54 v _08525_/Y (sky130_fd_sc_hd__o211ai_2)
                                         _03130_ (net)
                  0.12    0.00    5.54 v _08529_/B (sky130_fd_sc_hd__and3_1)
     1    0.01    0.06    0.22    5.77 v _08529_/X (sky130_fd_sc_hd__and3_1)
                                         _03134_ (net)
                  0.06    0.00    5.77 v _08544_/B (sky130_fd_sc_hd__nor3_4)
    17    0.10    0.94    0.76    6.53 ^ _08544_/Y (sky130_fd_sc_hd__nor3_4)
                                         _03149_ (net)
                  0.94    0.01    6.54 ^ _09607_/B2 (sky130_fd_sc_hd__o221ai_1)
     1    0.00    0.16    0.19    6.73 v _09607_/Y (sky130_fd_sc_hd__o221ai_1)
                                         _00887_ (net)
                  0.16    0.00    6.73 v hold1511/A (sky130_fd_sc_hd__dlygate4sd3_1)
     1    0.00    0.05    0.60    7.33 v hold1511/X (sky130_fd_sc_hd__dlygate4sd3_1)
                                         net1643 (net)
                  0.05    0.00    7.33 v core_pri.CPU_Xreg_value_a4[5][30]$_SDFFE_PP0P_/D (sky130_fd_sc_hd__dfxtp_1)
                                  7.33   data arrival time

                         11.50   11.50   clock clk (rise edge)
                          2.00   13.50   clock source latency
     1    0.22    0.00    0.00   13.50 ^ avsdpll/CLK (avsdpll)
                                         clk_pri (net)
                  0.03    0.01   13.51 ^ clkbuf_0_clk_pri/A (sky130_fd_sc_hd__clkbuf_16)
     8    0.23    0.24    0.27   13.78 ^ clkbuf_0_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_0_clk_pri (net)
                  0.24    0.00   13.78 ^ clkbuf_3_0_0_clk_pri/A (sky130_fd_sc_hd__clkbuf_16)
     2    0.04    0.06    0.21   13.99 ^ clkbuf_3_0_0_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_3_0_0_clk_pri (net)
                  0.06    0.00   13.99 ^ clkbuf_4_1__f_clk_pri/A (sky130_fd_sc_hd__clkbuf_16)
     7    0.10    0.12    0.20   14.19 ^ clkbuf_4_1__f_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_4_1__leaf_clk_pri (net)
                  0.12    0.00   14.19 ^ clkbuf_leaf_124_clk_pri/A (sky130_fd_sc_hd__clkbuf_16)
    11    0.04    0.06    0.17   14.35 ^ clkbuf_leaf_124_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_leaf_124_clk_pri (net)
                  0.06    0.00   14.35 ^ core_pri.CPU_Xreg_value_a4[5][30]$_SDFFE_PP0P_/CLK (sky130_fd_sc_hd__dfxtp_1)
                         -0.57   13.78   clock uncertainty
                          0.00   13.78   clock reconvergence pessimism
                         -0.11   13.67   library setup time
                                 13.67   data required time
-----------------------------------------------------------------------------
                                 13.67   data required time
                                 -7.33   data arrival time
-----------------------------------------------------------------------------
                                  6.33   slack (MET)



==========================================================================
cts final report_check_types -max_slew -max_cap -max_fanout -violators
--------------------------------------------------------------------------

==========================================================================
cts final max_slew_check_slack
--------------------------------------------------------------------------
0.23587177693843842

==========================================================================
cts final max_slew_check_limit
--------------------------------------------------------------------------
1.5

==========================================================================
cts final max_slew_check_slack_limit
--------------------------------------------------------------------------
0.1572

==========================================================================
cts final max_fanout_check_slack
--------------------------------------------------------------------------
1.0000000150474662e+30

==========================================================================
cts final max_fanout_check_limit
--------------------------------------------------------------------------
1.0000000150474662e+30

==========================================================================
cts final max_capacitance_check_slack
--------------------------------------------------------------------------
0.01796080358326435

==========================================================================
cts final max_capacitance_check_limit
--------------------------------------------------------------------------
0.021067000925540924

==========================================================================
cts final max_capacitance_check_slack_limit
--------------------------------------------------------------------------
0.8526

==========================================================================
cts final max_slew_violation_count
--------------------------------------------------------------------------
max slew violation count 0

==========================================================================
cts final max_fanout_violation_count
--------------------------------------------------------------------------
max fanout violation count 0

==========================================================================
cts final max_cap_violation_count
--------------------------------------------------------------------------
max cap violation count 0

==========================================================================
cts final setup_violation_count
--------------------------------------------------------------------------
setup violation count 0

==========================================================================
cts final hold_violation_count
--------------------------------------------------------------------------
hold violation count 0

==========================================================================
cts final report_checks -path_delay max reg to reg
--------------------------------------------------------------------------
Startpoint: core_pri.CPU_imm_a3[30]$_DFF_P_
            (rising edge-triggered flip-flop clocked by clk)
Endpoint: core_pri.CPU_Xreg_value_a4[5][30]$_SDFFE_PP0P_
          (rising edge-triggered flip-flop clocked by clk)
Path Group: clk
Path Type: max

  Delay    Time   Description
---------------------------------------------------------
   0.00    0.00   clock clk (rise edge)
   2.00    2.00   clock source latency
   0.00    2.00 ^ avsdpll/CLK (avsdpll)
   0.28    2.28 ^ clkbuf_0_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
   0.21    2.49 ^ clkbuf_3_6_0_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
   0.26    2.75 ^ clkbuf_4_13__f_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
   0.20    2.94 ^ clkbuf_leaf_73_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
   0.00    2.94 ^ core_pri.CPU_imm_a3[30]$_DFF_P_/CLK (sky130_fd_sc_hd__dfxtp_4)
   0.85    3.80 ^ core_pri.CPU_imm_a3[30]$_DFF_P_/Q (sky130_fd_sc_hd__dfxtp_4)
   0.49    4.29 v _11532_/SUM (sky130_fd_sc_hd__ha_2)
   0.26    4.55 ^ _07986_/Y (sky130_fd_sc_hd__nor3_2)
   0.18    4.73 v _07988_/Y (sky130_fd_sc_hd__nand2_1)
   0.27    4.99 ^ _07992_/Y (sky130_fd_sc_hd__a21oi_2)
   0.13    5.12 v _08110_/Y (sky130_fd_sc_hd__o21ai_4)
   0.28    5.40 ^ _08312_/Y (sky130_fd_sc_hd__a21oi_2)
   0.14    5.54 v _08525_/Y (sky130_fd_sc_hd__o211ai_2)
   0.22    5.77 v _08529_/X (sky130_fd_sc_hd__and3_1)
   0.76    6.53 ^ _08544_/Y (sky130_fd_sc_hd__nor3_4)
   0.20    6.73 v _09607_/Y (sky130_fd_sc_hd__o221ai_1)
   0.60    7.33 v hold1511/X (sky130_fd_sc_hd__dlygate4sd3_1)
   0.00    7.33 v core_pri.CPU_Xreg_value_a4[5][30]$_SDFFE_PP0P_/D (sky130_fd_sc_hd__dfxtp_1)
           7.33   data arrival time

  11.50   11.50   clock clk (rise edge)
   2.00   13.50   clock source latency
   0.00   13.50 ^ avsdpll/CLK (avsdpll)
   0.28   13.78 ^ clkbuf_0_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
   0.21   13.99 ^ clkbuf_3_0_0_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
   0.20   14.19 ^ clkbuf_4_1__f_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
   0.17   14.35 ^ clkbuf_leaf_124_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
   0.00   14.35 ^ core_pri.CPU_Xreg_value_a4[5][30]$_SDFFE_PP0P_/CLK (sky130_fd_sc_hd__dfxtp_1)
  -0.57   13.78   clock uncertainty
   0.00   13.78   clock reconvergence pessimism
  -0.11   13.67   library setup time
          13.67   data required time
---------------------------------------------------------
          13.67   data required time
          -7.33   data arrival time
---------------------------------------------------------
           6.33   slack (MET)



==========================================================================
cts final report_checks -path_delay min reg to reg
--------------------------------------------------------------------------
Startpoint: core_pri.CPU_dmem_rd_data_a5[22]$_DFF_P_
            (rising edge-triggered flip-flop clocked by clk)
Endpoint: core_pri.CPU_Xreg_value_a4[11][22]$_SDFFE_PP0P_
          (rising edge-triggered flip-flop clocked by clk)
Path Group: clk
Path Type: min

  Delay    Time   Description
---------------------------------------------------------
   0.00    0.00   clock clk (rise edge)
   2.00    2.00   clock source latency
   0.00    2.00 ^ avsdpll/CLK (avsdpll)
   0.28    2.28 ^ clkbuf_0_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
   0.21    2.49 ^ clkbuf_3_4_0_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
   0.23    2.72 ^ clkbuf_4_8__f_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
   0.18    2.90 ^ clkbuf_leaf_9_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
   0.00    2.90 ^ core_pri.CPU_dmem_rd_data_a5[22]$_DFF_P_/CLK (sky130_fd_sc_hd__dfxtp_1)
   0.37    3.27 v core_pri.CPU_dmem_rd_data_a5[22]$_DFF_P_/Q (sky130_fd_sc_hd__dfxtp_1)
   0.26    3.53 v _08321_/Y (sky130_fd_sc_hd__nand2b_4)
   0.13    3.66 ^ _08714_/Y (sky130_fd_sc_hd__nor2_1)
   0.06    3.72 v _08715_/Y (sky130_fd_sc_hd__a2111oi_0)
   0.00    3.72 v core_pri.CPU_Xreg_value_a4[11][22]$_SDFFE_PP0P_/D (sky130_fd_sc_hd__dfxtp_1)
           3.72   data arrival time

   0.00    0.00   clock clk (rise edge)
   2.00    2.00   clock source latency
   0.00    2.00 ^ avsdpll/CLK (avsdpll)
   0.28    2.28 ^ clkbuf_0_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
   0.21    2.49 ^ clkbuf_3_1_0_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
   0.20    2.69 ^ clkbuf_4_2__f_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
   0.17    2.85 ^ clkbuf_leaf_3_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
   0.00    2.85 ^ core_pri.CPU_Xreg_value_a4[11][22]$_SDFFE_PP0P_/CLK (sky130_fd_sc_hd__dfxtp_1)
   0.92    3.77   clock uncertainty
   0.00    3.77   clock reconvergence pessimism
  -0.05    3.72   library hold time
           3.72   data required time
---------------------------------------------------------
           3.72   data required time
          -3.72   data arrival time
---------------------------------------------------------
           0.00   slack (MET)



==========================================================================
cts final critical path target clock latency max path
--------------------------------------------------------------------------
0

==========================================================================
cts final critical path target clock latency min path
--------------------------------------------------------------------------
0

==========================================================================
cts final critical path source clock latency min path
--------------------------------------------------------------------------
0

==========================================================================
cts final critical path delay
--------------------------------------------------------------------------
7.3347

==========================================================================
cts final critical path slack
--------------------------------------------------------------------------
6.3315

==========================================================================
cts final slack div critical path delay
--------------------------------------------------------------------------
86.322549

==========================================================================
cts final report_power
--------------------------------------------------------------------------
Group                  Internal  Switching    Leakage      Total
                          Power      Power      Power      Power (Watts)
----------------------------------------------------------------
Sequential             4.83e-03   6.58e-04   1.04e-08   5.49e-03  34.5%
Combinational          1.77e-03   3.41e-03   2.31e-08   5.18e-03  32.6%
Clock                  3.01e-03   2.22e-03   2.55e-09   5.23e-03  32.9%
Macro                  0.00e+00   0.00e+00   0.00e+00   0.00e+00   0.0%
Pad                    0.00e+00   0.00e+00   0.00e+00   0.00e+00   0.0%
----------------------------------------------------------------
Total                  9.61e-03   6.28e-03   3.60e-08   1.59e-02 100.0%
                          60.5%      39.5%       0.0%
```

![cts_gui](https://github.com/user-attachments/assets/2f0c9ff6-55b0-4e88-bbf9-51573cd5d188)

**Heat Map:**

![heatmap](https://github.com/user-attachments/assets/3a217f42-4ad6-4636-9b39-72e7df5186da)

**Routing Congestion and IO nets:**
![routing_congestion](https://github.com/user-attachments/assets/acf09520-8a68-4d44-9f0e-b88b763b19bf)

**Step4: Routing:**
-------
There are three main types of routing:

*	Pre-routing (also known as power routing) which is done during power planning.
*	Clock routing performed while building the clock tree in the clock tree synthesis (CTS) stage.
*	Signal routing done after CTS to connect all signal pins.

**Routing Flow**

The routing flow consists of four main stages:

*	Global Routing: Divides the core area into global cells (gcells) and finds the shortest path for each net using algorithms like maze routing and Steiner tree. It assigns nets to specific gcells but does not define actual tracks.

*	Track Assignment: Assigns actual metal layers to global routes while fixing some design rule violations. However, many DRC, signal integrity, and timing violations still remain.

*	Detailed Routing: Completes the actual metal and via connections between pins. It fixes all remaining violations through multiple iterations. The block is divided into switch boxes (Sboxes) for routing.

*	Search and Repair: Performed after the first detailed routing iteration to locate and fix any remaining shorts or spacing violations[2][3].

**Routing Constraints:**

Key routing constraints include:

*	Design rule constraints related to manufacturing
*	Performance constraints to meet timing
*	Routing density constraints to avoid congestion
*	Constraints on off-grid routing
*	Blocked routing regions

**Routing Outputs:**

The main outputs of routing are:

*	Geometric layout of all nets in GDS format
*	SPEF file for parasitics
*	Updated SDC file with routed timing

In summary, routing is a critical step that completes the physical connections in the design while meeting various constraints. Efficient routing is essential for manufacturability and performance closure in modern VLSI designs.

**Lab - Routing of VSDBabySoC :**

Command to run routing for the design file:
```
make DESIGN_CONFIG=./designs/sky130hd/VSDbabysoc_pri/config.mk route
```
![routing_done](https://github.com/user-attachments/assets/f72f3505-6db3-44c6-b002-76ed19a65d55)


Screenshot of GUI of routed design:
**all macro cells:**

![route_with_cts](https://github.com/user-attachments/assets/f7d5e82a-604f-49da-9551-42224f5aa658)

**riscv_pri macro:**

![route_riscv](https://github.com/user-attachments/assets/eb7d0fde-ed28-4a2d-a57b-5f3c244bf27f)

**Heat map for routing congestion:**

![heat_map_gui](https://github.com/user-attachments/assets/93680564-cf33-4d65-a898-e26c54cf1f41)

**Heat map for placement congestion:**

![Heat_map_placement](https://github.com/user-attachments/assets/b82f8003-4796-44d7-b295-86dfe4aa2c36)

**Routing reports:**

```

==========================================================================
global route report_tns
--------------------------------------------------------------------------
tns 0.00

==========================================================================
global route report_wns
--------------------------------------------------------------------------
wns 0.00

==========================================================================
global route report_worst_slack
--------------------------------------------------------------------------
worst slack 5.67

==========================================================================
global route report_clock_skew
--------------------------------------------------------------------------
Clock clk
   3.09 source latency riscv_pri.CPU_Dmem_value_a5[11][22]$_SDFFE_PP0P_/CLK ^
  -3.01 target latency riscv_pri.CPU_dmem_rd_data_a5[22]$_DFF_P_/CLK ^
   0.57 clock uncertainty
   0.00 CRPR
--------------
   0.66 setup skew


==========================================================================
global route report_checks -path_delay min
--------------------------------------------------------------------------
Startpoint: riscv_pri.CPU_Xreg_value_a4[9][8]$_SDFFE_PP0P_
            (rising edge-triggered flip-flop clocked by clk)
Endpoint: riscv_pri.CPU_src1_value_a3[8]$_DFF_P_
          (rising edge-triggered flip-flop clocked by clk)
Path Group: clk
Path Type: min

Fanout     Cap    Slew   Delay    Time   Description
-----------------------------------------------------------------------------
                          0.00    0.00   clock clk (rise edge)
                          2.00    2.00   clock source latency
     2    0.23    0.00    0.00    2.00 ^ avsdpll/CLK (avsdpll)
                                         clk_pri (net)
                  0.04    0.02    2.02 ^ clkbuf_0_clk_pri/A (sky130_fd_sc_hd__clkbuf_16)
     4    0.20    0.21    0.25    2.27 ^ clkbuf_0_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_0_clk_pri (net)
                  0.21    0.01    2.27 ^ clkbuf_2_1_0_clk_pri/A (sky130_fd_sc_hd__clkbuf_16)
     4    0.15    0.16    0.27    2.55 ^ clkbuf_2_1_0_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_2_1_0_clk_pri (net)
                  0.16    0.01    2.55 ^ clkbuf_4_4__f_clk_pri/A (sky130_fd_sc_hd__clkbuf_16)
    12    0.21    0.22    0.30    2.85 ^ clkbuf_4_4__f_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_4_4__leaf_clk_pri (net)
                  0.22    0.00    2.86 ^ clkbuf_leaf_143_clk_pri/A (sky130_fd_sc_hd__clkbuf_16)
     8    0.04    0.06    0.20    3.06 ^ clkbuf_leaf_143_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_leaf_143_clk_pri (net)
                  0.06    0.00    3.06 ^ riscv_pri.CPU_Xreg_value_a4[9][8]$_SDFFE_PP0P_/CLK (sky130_fd_sc_hd__dfxtp_1)
     2    0.01    0.06    0.32    3.38 ^ riscv_pri.CPU_Xreg_value_a4[9][8]$_SDFFE_PP0P_/Q (sky130_fd_sc_hd__dfxtp_1)
                                         riscv_pri.CPU_Xreg_value_a4[9][8] (net)
                  0.06    0.00    3.38 ^ _10554_/B2 (sky130_fd_sc_hd__a221oi_1)
     1    0.01    0.05    0.09    3.47 v _10554_/Y (sky130_fd_sc_hd__a221oi_1)
                                         _04641_ (net)
                  0.05    0.00    3.47 v _10557_/A (sky130_fd_sc_hd__nand3_1)
     1    0.01    0.14    0.13    3.60 ^ _10557_/Y (sky130_fd_sc_hd__nand3_1)
                                         _04644_ (net)
                  0.14    0.00    3.60 ^ _10558_/B2 (sky130_fd_sc_hd__o22ai_4)
     1    0.04    0.11    0.14    3.74 v _10558_/Y (sky130_fd_sc_hd__o22ai_4)
                                         _04645_ (net)
                  0.11    0.01    3.75 v _10560_/A2 (sky130_fd_sc_hd__o21ai_0)
     1    0.00    0.09    0.20    3.95 ^ _10560_/Y (sky130_fd_sc_hd__o21ai_0)
                                         riscv_pri.CPU_src1_value_a2[8] (net)
                  0.09    0.00    3.95 ^ riscv_pri.CPU_src1_value_a3[8]$_DFF_P_/D (sky130_fd_sc_hd__dfxtp_1)
                                  3.95   data arrival time

                          0.00    0.00   clock clk (rise edge)
                          2.00    2.00   clock source latency
     2    0.23    0.00    0.00    2.00 ^ avsdpll/CLK (avsdpll)
                                         clk_pri (net)
                  0.04    0.02    2.02 ^ clkbuf_0_clk_pri/A (sky130_fd_sc_hd__clkbuf_16)
     4    0.20    0.21    0.25    2.27 ^ clkbuf_0_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_0_clk_pri (net)
                  0.21    0.01    2.27 ^ clkbuf_2_1_0_clk_pri/A (sky130_fd_sc_hd__clkbuf_16)
     4    0.15    0.16    0.27    2.55 ^ clkbuf_2_1_0_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_2_1_0_clk_pri (net)
                  0.16    0.00    2.55 ^ clkbuf_4_6__f_clk_pri/A (sky130_fd_sc_hd__clkbuf_16)
    12    0.20    0.21    0.30    2.85 ^ clkbuf_4_6__f_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_4_6__leaf_clk_pri (net)
                  0.21    0.00    2.85 ^ clkbuf_leaf_99_clk_pri/A (sky130_fd_sc_hd__clkbuf_16)
     8    0.05    0.07    0.20    3.05 ^ clkbuf_leaf_99_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_leaf_99_clk_pri (net)
                  0.07    0.00    3.06 ^ riscv_pri.CPU_src1_value_a3[8]$_DFF_P_/CLK (sky130_fd_sc_hd__dfxtp_1)
                          0.92    3.98   clock uncertainty
                          0.00    3.98   clock reconvergence pessimism
                         -0.04    3.94   library hold time
                                  3.94   data required time
-----------------------------------------------------------------------------
                                  3.94   data required time
                                 -3.95   data arrival time
-----------------------------------------------------------------------------
                                  0.01   slack (MET)



==========================================================================
global route report_checks -path_delay max
--------------------------------------------------------------------------
Startpoint: riscv_pri.CPU_imm_a3[30]$_DFF_P_
            (rising edge-triggered flip-flop clocked by clk)
Endpoint: riscv_pri.CPU_Xreg_value_a4[11][30]$_SDFFE_PP0P_
          (rising edge-triggered flip-flop clocked by clk)
Path Group: clk
Path Type: max

Fanout     Cap    Slew   Delay    Time   Description
-----------------------------------------------------------------------------
                          0.00    0.00   clock clk (rise edge)
                          2.00    2.00   clock source latency
     2    0.23    0.00    0.00    2.00 ^ avsdpll/CLK (avsdpll)
                                         clk_pri (net)
                  0.04    0.02    2.02 ^ clkbuf_0_clk_pri/A (sky130_fd_sc_hd__clkbuf_16)
     4    0.20    0.21    0.25    2.27 ^ clkbuf_0_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_0_clk_pri (net)
                  0.21    0.01    2.27 ^ clkbuf_2_2_0_clk_pri/A (sky130_fd_sc_hd__clkbuf_16)
     4    0.14    0.16    0.27    2.54 ^ clkbuf_2_2_0_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_2_2_0_clk_pri (net)
                  0.16    0.00    2.54 ^ clkbuf_4_9__f_clk_pri/A (sky130_fd_sc_hd__clkbuf_16)
     9    0.18    0.19    0.28    2.82 ^ clkbuf_4_9__f_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_4_9__leaf_clk_pri (net)
                  0.19    0.00    2.83 ^ clkbuf_leaf_40_clk_pri/A (sky130_fd_sc_hd__clkbuf_16)
     8    0.04    0.06    0.19    3.01 ^ clkbuf_leaf_40_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_leaf_40_clk_pri (net)
                  0.06    0.00    3.01 ^ riscv_pri.CPU_imm_a3[30]$_DFF_P_/CLK (sky130_fd_sc_hd__dfxtp_4)
    51    0.43    1.18    1.12    4.13 ^ riscv_pri.CPU_imm_a3[30]$_DFF_P_/Q (sky130_fd_sc_hd__dfxtp_4)
                                         riscv_pri.CPU_imm_a3[10] (net)
                  1.18    0.03    4.16 ^ _11532_/B (sky130_fd_sc_hd__ha_2)
     6    0.03    0.11    0.55    4.71 v _11532_/SUM (sky130_fd_sc_hd__ha_2)
                                         _05641_ (net)
                  0.11    0.00    4.71 v _07986_/C (sky130_fd_sc_hd__nor3_2)
     3    0.02    0.36    0.31    5.02 ^ _07986_/Y (sky130_fd_sc_hd__nor3_2)
                                         _02614_ (net)
                  0.36    0.00    5.02 ^ _07988_/A (sky130_fd_sc_hd__nand2_2)
     2    0.02    0.15    0.17    5.19 v _07988_/Y (sky130_fd_sc_hd__nand2_2)
                                         _02616_ (net)
                  0.15    0.00    5.19 v _07992_/A2 (sky130_fd_sc_hd__a21oi_4)
     2    0.03    0.22    0.27    5.46 ^ _07992_/Y (sky130_fd_sc_hd__a21oi_4)
                                         _02620_ (net)
                  0.22    0.00    5.47 ^ _08110_/A1 (sky130_fd_sc_hd__o21ai_2)
     4    0.02    0.15    0.16    5.62 v _08110_/Y (sky130_fd_sc_hd__o21ai_2)
                                         _02734_ (net)
                  0.15    0.00    5.62 v _08312_/A1 (sky130_fd_sc_hd__a21oi_4)
     3    0.02    0.20    0.24    5.86 ^ _08312_/Y (sky130_fd_sc_hd__a21oi_4)
                                         _02927_ (net)
                  0.20    0.00    5.86 ^ _08525_/A1 (sky130_fd_sc_hd__o211ai_1)
     2    0.01    0.15    0.17    6.03 v _08525_/Y (sky130_fd_sc_hd__o211ai_1)
                                         _03130_ (net)
                  0.15    0.00    6.03 v _08529_/B (sky130_fd_sc_hd__and3_1)
     1    0.01    0.08    0.25    6.28 v _08529_/X (sky130_fd_sc_hd__and3_1)
                                         _03134_ (net)
                  0.08    0.00    6.28 v _08544_/B (sky130_fd_sc_hd__nor3_4)
    17    0.13    1.24    0.97    7.26 ^ _08544_/Y (sky130_fd_sc_hd__nor3_4)
                                         _03149_ (net)
                  1.24    0.04    7.29 ^ _08748_/B2 (sky130_fd_sc_hd__o221ai_1)
     1    0.01    0.23    0.26    7.55 v _08748_/Y (sky130_fd_sc_hd__o221ai_1)
                                         _00599_ (net)
                  0.23    0.00    7.55 v hold1504/A (sky130_fd_sc_hd__dlygate4sd3_1)
     1    0.00    0.06    0.65    8.20 v hold1504/X (sky130_fd_sc_hd__dlygate4sd3_1)
                                         net1755 (net)
                  0.06    0.00    8.20 v riscv_pri.CPU_Xreg_value_a4[11][30]$_SDFFE_PP0P_/D (sky130_fd_sc_hd__dfxtp_1)
                                  8.20   data arrival time

                         11.50   11.50   clock clk (rise edge)
                          2.00   13.50   clock source latency
     2    0.23    0.00    0.00   13.50 ^ avsdpll/CLK (avsdpll)
                                         clk_pri (net)
                  0.04    0.02   13.52 ^ clkbuf_0_clk_pri/A (sky130_fd_sc_hd__clkbuf_16)
     4    0.20    0.21    0.25   13.77 ^ clkbuf_0_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_0_clk_pri (net)
                  0.21    0.01   13.77 ^ clkbuf_2_1_0_clk_pri/A (sky130_fd_sc_hd__clkbuf_16)
     4    0.15    0.16    0.27   14.05 ^ clkbuf_2_1_0_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_2_1_0_clk_pri (net)
                  0.16    0.00   14.05 ^ clkbuf_4_6__f_clk_pri/A (sky130_fd_sc_hd__clkbuf_16)
    12    0.20    0.21    0.30   14.35 ^ clkbuf_4_6__f_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_4_6__leaf_clk_pri (net)
                  0.21    0.00   14.35 ^ clkbuf_leaf_146_clk_pri/A (sky130_fd_sc_hd__clkbuf_16)
     9    0.04    0.06    0.20   14.55 ^ clkbuf_leaf_146_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_leaf_146_clk_pri (net)
                  0.06    0.00   14.55 ^ riscv_pri.CPU_Xreg_value_a4[11][30]$_SDFFE_PP0P_/CLK (sky130_fd_sc_hd__dfxtp_1)
                         -0.57   13.98   clock uncertainty
                          0.00   13.98   clock reconvergence pessimism
                         -0.11   13.86   library setup time
                                 13.86   data required time
-----------------------------------------------------------------------------
                                 13.86   data required time
                                 -8.20   data arrival time
-----------------------------------------------------------------------------
                                  5.67   slack (MET)



==========================================================================
global route report_checks -unconstrained
--------------------------------------------------------------------------
Startpoint: riscv_pri.CPU_imm_a3[30]$_DFF_P_
            (rising edge-triggered flip-flop clocked by clk)
Endpoint: riscv_pri.CPU_Xreg_value_a4[11][30]$_SDFFE_PP0P_
          (rising edge-triggered flip-flop clocked by clk)
Path Group: clk
Path Type: max

Fanout     Cap    Slew   Delay    Time   Description
-----------------------------------------------------------------------------
                          0.00    0.00   clock clk (rise edge)
                          2.00    2.00   clock source latency
     2    0.23    0.00    0.00    2.00 ^ avsdpll/CLK (avsdpll)
                                         clk_pri (net)
                  0.04    0.02    2.02 ^ clkbuf_0_clk_pri/A (sky130_fd_sc_hd__clkbuf_16)
     4    0.20    0.21    0.25    2.27 ^ clkbuf_0_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_0_clk_pri (net)
                  0.21    0.01    2.27 ^ clkbuf_2_2_0_clk_pri/A (sky130_fd_sc_hd__clkbuf_16)
     4    0.14    0.16    0.27    2.54 ^ clkbuf_2_2_0_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_2_2_0_clk_pri (net)
                  0.16    0.00    2.54 ^ clkbuf_4_9__f_clk_pri/A (sky130_fd_sc_hd__clkbuf_16)
     9    0.18    0.19    0.28    2.82 ^ clkbuf_4_9__f_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_4_9__leaf_clk_pri (net)
                  0.19    0.00    2.83 ^ clkbuf_leaf_40_clk_pri/A (sky130_fd_sc_hd__clkbuf_16)
     8    0.04    0.06    0.19    3.01 ^ clkbuf_leaf_40_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_leaf_40_clk_pri (net)
                  0.06    0.00    3.01 ^ riscv_pri.CPU_imm_a3[30]$_DFF_P_/CLK (sky130_fd_sc_hd__dfxtp_4)
    51    0.43    1.18    1.12    4.13 ^ riscv_pri.CPU_imm_a3[30]$_DFF_P_/Q (sky130_fd_sc_hd__dfxtp_4)
                                         riscv_pri.CPU_imm_a3[10] (net)
                  1.18    0.03    4.16 ^ _11532_/B (sky130_fd_sc_hd__ha_2)
     6    0.03    0.11    0.55    4.71 v _11532_/SUM (sky130_fd_sc_hd__ha_2)
                                         _05641_ (net)
                  0.11    0.00    4.71 v _07986_/C (sky130_fd_sc_hd__nor3_2)
     3    0.02    0.36    0.31    5.02 ^ _07986_/Y (sky130_fd_sc_hd__nor3_2)
                                         _02614_ (net)
                  0.36    0.00    5.02 ^ _07988_/A (sky130_fd_sc_hd__nand2_2)
     2    0.02    0.15    0.17    5.19 v _07988_/Y (sky130_fd_sc_hd__nand2_2)
                                         _02616_ (net)
                  0.15    0.00    5.19 v _07992_/A2 (sky130_fd_sc_hd__a21oi_4)
     2    0.03    0.22    0.27    5.46 ^ _07992_/Y (sky130_fd_sc_hd__a21oi_4)
                                         _02620_ (net)
                  0.22    0.00    5.47 ^ _08110_/A1 (sky130_fd_sc_hd__o21ai_2)
     4    0.02    0.15    0.16    5.62 v _08110_/Y (sky130_fd_sc_hd__o21ai_2)
                                         _02734_ (net)
                  0.15    0.00    5.62 v _08312_/A1 (sky130_fd_sc_hd__a21oi_4)
     3    0.02    0.20    0.24    5.86 ^ _08312_/Y (sky130_fd_sc_hd__a21oi_4)
                                         _02927_ (net)
                  0.20    0.00    5.86 ^ _08525_/A1 (sky130_fd_sc_hd__o211ai_1)
     2    0.01    0.15    0.17    6.03 v _08525_/Y (sky130_fd_sc_hd__o211ai_1)
                                         _03130_ (net)
                  0.15    0.00    6.03 v _08529_/B (sky130_fd_sc_hd__and3_1)
     1    0.01    0.08    0.25    6.28 v _08529_/X (sky130_fd_sc_hd__and3_1)
                                         _03134_ (net)
                  0.08    0.00    6.28 v _08544_/B (sky130_fd_sc_hd__nor3_4)
    17    0.13    1.24    0.97    7.26 ^ _08544_/Y (sky130_fd_sc_hd__nor3_4)
                                         _03149_ (net)
                  1.24    0.04    7.29 ^ _08748_/B2 (sky130_fd_sc_hd__o221ai_1)
     1    0.01    0.23    0.26    7.55 v _08748_/Y (sky130_fd_sc_hd__o221ai_1)
                                         _00599_ (net)
                  0.23    0.00    7.55 v hold1504/A (sky130_fd_sc_hd__dlygate4sd3_1)
     1    0.00    0.06    0.65    8.20 v hold1504/X (sky130_fd_sc_hd__dlygate4sd3_1)
                                         net1755 (net)
                  0.06    0.00    8.20 v riscv_pri.CPU_Xreg_value_a4[11][30]$_SDFFE_PP0P_/D (sky130_fd_sc_hd__dfxtp_1)
                                  8.20   data arrival time

                         11.50   11.50   clock clk (rise edge)
                          2.00   13.50   clock source latency
     2    0.23    0.00    0.00   13.50 ^ avsdpll/CLK (avsdpll)
                                         clk_pri (net)
                  0.04    0.02   13.52 ^ clkbuf_0_clk_pri/A (sky130_fd_sc_hd__clkbuf_16)
     4    0.20    0.21    0.25   13.77 ^ clkbuf_0_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_0_clk_pri (net)
                  0.21    0.01   13.77 ^ clkbuf_2_1_0_clk_pri/A (sky130_fd_sc_hd__clkbuf_16)
     4    0.15    0.16    0.27   14.05 ^ clkbuf_2_1_0_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_2_1_0_clk_pri (net)
                  0.16    0.00   14.05 ^ clkbuf_4_6__f_clk_pri/A (sky130_fd_sc_hd__clkbuf_16)
    12    0.20    0.21    0.30   14.35 ^ clkbuf_4_6__f_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_4_6__leaf_clk_pri (net)
                  0.21    0.00   14.35 ^ clkbuf_leaf_146_clk_pri/A (sky130_fd_sc_hd__clkbuf_16)
     9    0.04    0.06    0.20   14.55 ^ clkbuf_leaf_146_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
                                         clknet_leaf_146_clk_pri (net)
                  0.06    0.00   14.55 ^ riscv_pri.CPU_Xreg_value_a4[11][30]$_SDFFE_PP0P_/CLK (sky130_fd_sc_hd__dfxtp_1)
                         -0.57   13.98   clock uncertainty
                          0.00   13.98   clock reconvergence pessimism
                         -0.11   13.86   library setup time
                                 13.86   data required time
-----------------------------------------------------------------------------
                                 13.86   data required time
                                 -8.20   data arrival time
-----------------------------------------------------------------------------
                                  5.67   slack (MET)



==========================================================================
global route report_check_types -max_slew -max_cap -max_fanout -violators
--------------------------------------------------------------------------

==========================================================================
global route max_slew_check_slack
--------------------------------------------------------------------------
0.051913365721702576

==========================================================================
global route max_slew_check_limit
--------------------------------------------------------------------------
1.5

==========================================================================
global route max_slew_check_slack_limit
--------------------------------------------------------------------------
0.0346

==========================================================================
global route max_fanout_check_slack
--------------------------------------------------------------------------
1.0000000150474662e+30

==========================================================================
global route max_fanout_check_limit
--------------------------------------------------------------------------
1.0000000150474662e+30

==========================================================================
global route max_capacitance_check_slack
--------------------------------------------------------------------------
0.01552768424153328

==========================================================================
global route max_capacitance_check_limit
--------------------------------------------------------------------------
0.021067000925540924

==========================================================================
global route max_capacitance_check_slack_limit
--------------------------------------------------------------------------
0.7371

==========================================================================
global route max_slew_violation_count
--------------------------------------------------------------------------
max slew violation count 0

==========================================================================
global route max_fanout_violation_count
--------------------------------------------------------------------------
max fanout violation count 0

==========================================================================
global route max_cap_violation_count
--------------------------------------------------------------------------
max cap violation count 0

==========================================================================
global route setup_violation_count
--------------------------------------------------------------------------
setup violation count 0

==========================================================================
global route hold_violation_count
--------------------------------------------------------------------------
hold violation count 0

==========================================================================
global route report_checks -path_delay max reg to reg
--------------------------------------------------------------------------
Startpoint: riscv_pri.CPU_imm_a3[30]$_DFF_P_
            (rising edge-triggered flip-flop clocked by clk)
Endpoint: riscv_pri.CPU_Xreg_value_a4[11][30]$_SDFFE_PP0P_
          (rising edge-triggered flip-flop clocked by clk)
Path Group: clk
Path Type: max

  Delay    Time   Description
---------------------------------------------------------
   0.00    0.00   clock clk (rise edge)
   2.00    2.00   clock source latency
   0.00    2.00 ^ avsdpll/CLK (avsdpll)
   0.27    2.27 ^ clkbuf_0_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
   0.27    2.54 ^ clkbuf_2_2_0_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
   0.28    2.82 ^ clkbuf_4_9__f_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
   0.19    3.01 ^ clkbuf_leaf_40_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
   0.00    3.01 ^ riscv_pri.CPU_imm_a3[30]$_DFF_P_/CLK (sky130_fd_sc_hd__dfxtp_4)
   1.12    4.13 ^ riscv_pri.CPU_imm_a3[30]$_DFF_P_/Q (sky130_fd_sc_hd__dfxtp_4)
   0.58    4.71 v _11532_/SUM (sky130_fd_sc_hd__ha_2)
   0.31    5.02 ^ _07986_/Y (sky130_fd_sc_hd__nor3_2)
   0.17    5.19 v _07988_/Y (sky130_fd_sc_hd__nand2_2)
   0.27    5.46 ^ _07992_/Y (sky130_fd_sc_hd__a21oi_4)
   0.16    5.62 v _08110_/Y (sky130_fd_sc_hd__o21ai_2)
   0.24    5.86 ^ _08312_/Y (sky130_fd_sc_hd__a21oi_4)
   0.17    6.03 v _08525_/Y (sky130_fd_sc_hd__o211ai_1)
   0.25    6.28 v _08529_/X (sky130_fd_sc_hd__and3_1)
   0.97    7.26 ^ _08544_/Y (sky130_fd_sc_hd__nor3_4)
   0.29    7.55 v _08748_/Y (sky130_fd_sc_hd__o221ai_1)
   0.65    8.20 v hold1504/X (sky130_fd_sc_hd__dlygate4sd3_1)
   0.00    8.20 v riscv_pri.CPU_Xreg_value_a4[11][30]$_SDFFE_PP0P_/D (sky130_fd_sc_hd__dfxtp_1)
           8.20   data arrival time

  11.50   11.50   clock clk (rise edge)
   2.00   13.50   clock source latency
   0.00   13.50 ^ avsdpll/CLK (avsdpll)
   0.27   13.77 ^ clkbuf_0_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
   0.28   14.05 ^ clkbuf_2_1_0_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
   0.30   14.35 ^ clkbuf_4_6__f_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
   0.20   14.55 ^ clkbuf_leaf_146_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
   0.00   14.55 ^ riscv_pri.CPU_Xreg_value_a4[11][30]$_SDFFE_PP0P_/CLK (sky130_fd_sc_hd__dfxtp_1)
  -0.57   13.98   clock uncertainty
   0.00   13.98   clock reconvergence pessimism
  -0.11   13.86   library setup time
          13.86   data required time
---------------------------------------------------------
          13.86   data required time
          -8.20   data arrival time
---------------------------------------------------------
           5.67   slack (MET)



==========================================================================
global route report_checks -path_delay min reg to reg
--------------------------------------------------------------------------
Startpoint: riscv_pri.CPU_Xreg_value_a4[9][8]$_SDFFE_PP0P_
            (rising edge-triggered flip-flop clocked by clk)
Endpoint: riscv_pri.CPU_src1_value_a3[8]$_DFF_P_
          (rising edge-triggered flip-flop clocked by clk)
Path Group: clk
Path Type: min

  Delay    Time   Description
---------------------------------------------------------
   0.00    0.00   clock clk (rise edge)
   2.00    2.00   clock source latency
   0.00    2.00 ^ avsdpll/CLK (avsdpll)
   0.27    2.27 ^ clkbuf_0_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
   0.28    2.55 ^ clkbuf_2_1_0_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
   0.31    2.85 ^ clkbuf_4_4__f_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
   0.20    3.06 ^ clkbuf_leaf_143_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
   0.00    3.06 ^ riscv_pri.CPU_Xreg_value_a4[9][8]$_SDFFE_PP0P_/CLK (sky130_fd_sc_hd__dfxtp_1)
   0.32    3.38 ^ riscv_pri.CPU_Xreg_value_a4[9][8]$_SDFFE_PP0P_/Q (sky130_fd_sc_hd__dfxtp_1)
   0.09    3.47 v _10554_/Y (sky130_fd_sc_hd__a221oi_1)
   0.13    3.60 ^ _10557_/Y (sky130_fd_sc_hd__nand3_1)
   0.14    3.74 v _10558_/Y (sky130_fd_sc_hd__o22ai_4)
   0.20    3.95 ^ _10560_/Y (sky130_fd_sc_hd__o21ai_0)
   0.00    3.95 ^ riscv_pri.CPU_src1_value_a3[8]$_DFF_P_/D (sky130_fd_sc_hd__dfxtp_1)
           3.95   data arrival time

   0.00    0.00   clock clk (rise edge)
   2.00    2.00   clock source latency
   0.00    2.00 ^ avsdpll/CLK (avsdpll)
   0.27    2.27 ^ clkbuf_0_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
   0.28    2.55 ^ clkbuf_2_1_0_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
   0.30    2.85 ^ clkbuf_4_6__f_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
   0.21    3.05 ^ clkbuf_leaf_99_clk_pri/X (sky130_fd_sc_hd__clkbuf_16)
   0.00    3.06 ^ riscv_pri.CPU_src1_value_a3[8]$_DFF_P_/CLK (sky130_fd_sc_hd__dfxtp_1)
   0.92    3.98   clock uncertainty
   0.00    3.98   clock reconvergence pessimism
  -0.04    3.94   library hold time
           3.94   data required time
---------------------------------------------------------
           3.94   data required time
          -3.95   data arrival time
---------------------------------------------------------
           0.01   slack (MET)



==========================================================================
global route critical path target clock latency max path
--------------------------------------------------------------------------
0

==========================================================================
global route critical path target clock latency min path
--------------------------------------------------------------------------
0

==========================================================================
global route critical path source clock latency min path
--------------------------------------------------------------------------
0

==========================================================================
global route critical path delay
--------------------------------------------------------------------------
8.1954

==========================================================================
global route critical path slack
--------------------------------------------------------------------------
5.6669

==========================================================================
global route slack div critical path delay
--------------------------------------------------------------------------
69.147327

==========================================================================
global route report_power
--------------------------------------------------------------------------
Group                  Internal  Switching    Leakage      Total
                          Power      Power      Power      Power (Watts)
----------------------------------------------------------------
Sequential             4.86e-03   9.43e-04   1.04e-08   5.80e-03  29.6%
Combinational          2.14e-03   4.88e-03   2.41e-08   7.02e-03  35.8%
Clock                  3.66e-03   3.14e-03   3.16e-09   6.80e-03  34.7%
Macro                  0.00e+00   0.00e+00   0.00e+00   0.00e+00   0.0%
Pad                    0.00e+00   0.00e+00   0.00e+00   0.00e+00   0.0%
----------------------------------------------------------------
Total                  1.07e-02   8.96e-03   3.77e-08   1.96e-02 100.0%
                          54.3%      45.7%       0.0%
```

**Note: All the generated reports and relevant design files are added in the folder Lab14 for your reference.**


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
*  https://github.com/nickson-jose
*  https://github.com/fayizferosh/soc-design-and-planning-nasscom-vsd.git
*  https://github.com/kunalg123/sky130RTLDesignAndSynthesisWorkshop.git
  

------

