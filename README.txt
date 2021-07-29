Name: PRANEETH G
Roll no: 191CS235


To run the code follow the steps:
1. First navigate to the code folder in the commmand prompt.
2. copy paste this in the terimal to compile code
iverilog main_tb.v IF.v register.v datamem.v mux_ALUSrc.v mux_ALU.v mux_MemtoReg.v mux_Zero.v signex.v alu.v or.v and.v fulladder.v ainvert.v binvert.v topmodule.v overflow.v alucu.v Memory.v PC.v
3. copy paste this to run the code
vvp a.out


Here the inputs should be given in the testbench (i.e. main_tb in the code folder)
and the instruction should be given or entered in the memory (i.e. memory.mem file in code folder)
and the corresponding PC should be given as input in to testbench
for example, if 
PC=0 then it will run the instruction in 1st line in the memory.mem
PC=4 then it will run the instruction in 2nd line in the memory.mem
and so on

Example instruction:
for and: 
	add x1,x2,x3
	00100001010000110001000001011111
for sub:
	sub x1,x3,x2
	00000101000000100001100001011111
for and:
	and x1,x3,x2
	00000111100000100001100001011111
for nand:
	nand x1,x3,x2
	00111011100000100001100001011111
for or:
	or x1,x3,x2
	00110111100000100001100001011111
for addi
	addi x1,x3,2
	00000000000000100001100001001110
for andi:
	andi x1,x3,2
	00000000000000100001100001011100
for ori:
	ori x1,x3,2
	00000000000000100001100001011000
for load:
	ld x1,2(x3)
	00000000000000100001100001111010
for store:
	sd x1,2(x3)
	00000000000000100001100001111110
for beq:
	beq x2,x3,8
	00000000000010000001100010010011

The Control Signals also have to be given in the input itself in the testbench
For add,sub,and,nand,or the control signals are:
	RegWrite=1;
	ALUSrc=0;
	Branch=0;
	ALUop=010;
	MemWrite=0;
	MemRead=0;
	MemtoReg=0;
For addi:
	RegWrite=1;
	ALUSrc=1;
	Branch=0;
	ALUop=011;
	MemWrite=0;
	MemRead=0;
	MemtoReg=0;
For andi:
	RegWrite=1;
	ALUSrc=1;
	Branch=0;
	ALUop=100;
	MemWrite=0;
	MemRead=0;
	MemtoReg=0;
For ori:
	RegWrite=1;
	ALUSrc=1;
	Branch=0;
	ALUop=101;
	MemWrite=0;
	MemRead=0;
	MemtoReg=0;
For Load:
	RegWrite=1;
	ALUSrc=1;
	Branch=0;
	ALUop=000;
	MemWrite=0;
	MemRead=1;
	MemtoReg=1;
For Store:
	RegWrite=0;
	ALUSrc=1;
	Branch=0;
	ALUop=000;
	MemWrite=1;
	MemRead=0;
	MemtoReg=0;
For branch:
	RegWrite=0;
	ALUSrc=0;
	Branch=1;
	ALUop=001;
	MemWrite=0;
	MemRead=0;
	MemtoReg=0;