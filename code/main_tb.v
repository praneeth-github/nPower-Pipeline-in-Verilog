module tb_v;

	// Inputs
	reg clk,reset;
	wire [63:0] pc_next;
	reg [63:0] pc;
	reg RegWrite;
	reg ALUSrc;
	reg Branch;
	reg [2:0] ALUop;
	reg MemWrite;
	reg MemRead;
	reg MemtoReg;

	// Outputs

	// Instantiate the Unit Under Test (UUT)
	main_main uut (
		.clk(clk),
		.reset(reset),
		.pc_next(pc_next),
		.pc(pc),
		.RegWrite(RegWrite),
		.ALUSrc(ALUSrc),
		.Branch(Branch),
		.ALUop(ALUop),
		.MemWrite(MemWrite),
		.MemRead(MemRead),
		.MemtoReg(MemtoReg)
	);



	initial begin

		// Initialize Inputs
		$dumpfile("example.vcd");
		$dumpvars(0,tb_v);
		
		$monitor($time, ".pc:%b pc_next:%b RegWrite:%b ALUSrc:%b Branch:%b ALUop:%b MemWrite:%b MemRead:%b MemtoReg:%b" ,pc,pc_next,RegWrite,ALUSrc,Branch,ALUop,MemWrite,MemRead,MemtoReg);
		clk=1;
		reset=0;
		pc=0;
		RegWrite=0;
		ALUSrc=0;
		Branch=1;
		ALUop=001;
		MemWrite=0;
		MemRead=0;
		MemtoReg=0;                		
		
		// Wait 100 ns for global reset to finish
		#100;		 

	end
      
endmodule