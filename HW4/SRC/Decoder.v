`timescale 1ns / 1ps

module Decoder( OP, Reg_WE, DM_WE, ALU_OP, ALU_src,MEM_to_REG,REG_Dst,funct);
	input [5:0] OP;
	input [5:0] funct;
	output Reg_WE, DM_WE, ALU_src,MEM_to_REG,REG_Dst;
	output [1:0] ALU_OP;
	
        reg Reg_WE, DM_WE, ALU_src,MEM_to_REG,REG_Dst;
        reg [1:0] ALU_OP;


        //assign Reg_WE = (OP[5:0] == 6'b000000 && funct[5:0] == 6'b100000) ? 1 : 0;





   /* add your design */   	

   

    always @(funct or OP)
    begin 
       if(OP[5:0] == 6'b000000 && funct[5:0] == 6'b100000)
       begin
          Reg_WE = 1;
          DM_WE = 0;
          ALU_src = 0;
          MEM_to_REG = 0;
          REG_Dst = 1;
          ALU_OP[1:0] = 2'b10;
       end

       else if(OP[5:0] == 6'b000000 && funct[5:0] == 6'b100010)
       begin
         Reg_WE = 1; 
         DM_WE = 0;
         ALU_src = 0;
         MEM_to_REG = 0;
         REG_Dst = 1;
         ALU_OP[1:0] = 2'b10;
       end

       else if(OP[5:0] == 6'b000000 && funct[5:0] == 6'b101010)
       begin
          Reg_WE = 1;
          DM_WE = 0;
          ALU_src = 0;
          MEM_to_REG = 0;
          REG_Dst = 1;
          ALU_OP[1:0] = 2'b10;
       end
    end

	
endmodule
