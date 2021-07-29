module main_main(clk,reset,pc_next,pc,RegWrite,ALUSrc,Branch,ALUop,MemWrite,MemRead,MemtoReg);
	input clk,reset;
	output [63:0] pc_next;
	input [63:0] pc;
	input RegWrite;
	input ALUSrc;
	input Branch;
	input [2:0] ALUop;
	input MemWrite;
	input MemRead;
	input MemtoReg;

        wire [63:0] mid;
	wire [31:0] instruction;

        Memory m11(instruction,pc);
        PC p1(clk,reset,pc,mid);

	wire [63:0] pc_next1;
	assign pc_next1 = mid+4;   
	
	wire [4:0] rs1;
	wire [4:0] rs2;
	wire [4:0] rd;
	
	wire [5:0] w1;

	assign w1[0]=instruction[0];
	assign w1[1]=instruction[1];
	assign w1[2]=instruction[2];
	assign w1[3]=instruction[3];
	assign w1[4]=instruction[4];
	assign w1[5]=instruction[5];

	reg [4:0] rs11;
	reg [4:0] rs21;
	reg [4:0] rd1;
	always @(*)
  	begin
		case(w1)
			6'b010011:
			begin
				 rs21 = instruction[15:11];
				 rd1 = instruction[20:16];
				 rs11 = instruction [10:6];
			end
			6'b111110:
			begin
				 rs11 = instruction[15:11];
				 rd1 = instruction[20:16];
				 rs21 = instruction [10:6];
			end
			default:
			begin
				 rs11 = instruction[15:11];
				 rs21 = instruction[20:16];
				 rd1 = instruction [10:6];
			end
		endcase
	end
	
	assign rs1 = rs11;
	assign rs2 = rs21;
	assign rd = rd1;
	

	wire [63:0] writedata;
	wire [63:0] readdata1;
	wire [63:0] readdata2;
	wire [63:0] immed;


	register reg1(rs1,rs2,rd,writedata,RegWrite,readdata1,readdata2);
	
	sign sign1(instruction,immed);
	
	wire [63:0] immed_1;
	assign immed_1 = immed;

	wire [3:0] abc;
	assign abc = 4'b0010;

	wire [63:0] pcpc;
	wire ovf1,zero1;
	ALU alu2(pc,immed_1,abc,pcpc,ovf1,zero1);

	
	
	wire [63:0] input2;
	MUX_ALUSrc muxalusrc(readdata2,immed,ALUSrc,input2);

	wire [63:0] out;
	wire ovf,zero;
	wire [63:0] readdata;
	wire [3:0] alu;
	ALUCU alucu1(ALUop,instruction,alu);
	ALU alu64(readdata1,input2,alu,out,ovf,zero);
	wire Zero1;
	AND and1(zero,Branch,Zero1);
	


	MUX_Zero muxzero1111(pc_next1,pcpc,Zero1,pc_next);

	datamem data11(out,readdata2,MemWrite,MemRead,readdata);

	MUX_MemtoReg muxmemtoreg(readdata,out,MemtoReg,writedata);
                
endmodule