module sign(
input[31:0] instruction,
output[63:0] seinst
);

//wire[11:0] inst;

wire [5:0] w1;

assign w1[0]=instruction[0];
assign w1[1]=instruction[1];
assign w1[2]=instruction[2];
assign w1[3]=instruction[3];
assign w1[4]=instruction[4];
assign w1[5]=instruction[5];

reg [11:0] inst1;
reg [31:0] inst2;
reg [63:0] tmp1;

always @(*)
   begin
		case(w1)
			6'b011111:
			begin
				 inst2 = {{16{instruction[31]}}, instruction[31:16]};
				 tmp1 = {{32{inst2[31]}}, inst2};
			end
			6'b001110:
			begin
				 inst2 = {{16{instruction[31]}}, instruction[31:16]};
				 tmp1 = {{32{inst2[31]}}, inst2};
			end
			6'b011100:
			begin
				 inst2 = {{16{instruction[31]}}, instruction[31:16]};
				 tmp1 = {{32{inst2[31]}}, inst2};
			end
			6'b011000:
			begin
				 inst2 = {{16{instruction[31]}}, instruction[31:16]};
				 tmp1 = {{32{inst2[31]}}, inst2};
			end
			6'b111010:
			begin
				 inst2 = {{18{instruction[31]}}, instruction[29:16]};
				 tmp1 = {{32{inst2[31]}}, inst2};
			end
			6'b111110:
			begin
				 inst2 = {{18{instruction[31]}}, instruction[29:16]};
				 tmp1 = {{32{inst2[31]}}, inst2};
			end
			6'b010011:
			begin
				 inst2 = {{18{instruction[31]}}, instruction[29:16]};
				 tmp1 = {{32{inst2[31]}}, inst2};
			end
		endcase
	end

assign seinst = tmp1;

//assign inst = {instruction[31:25],instruction[11:7]};
//assign seinst = {{52{instruction[31]}}, inst};


//assign inst = {{20{instruction[31]}}, instruction[31:20]};
//assign seinst = {{32{inst[31]}}, inst};

endmodule