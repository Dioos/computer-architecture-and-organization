`timescale 1ns / 1ps

module ALU_ctrl( funct, ALU_OP,ALU_CTRL );

    input [5:0] funct;
    input [1:0] ALU_OP;
    output [3:0]ALU_CTRL;


    reg [3:0]ALU_CTRL;
    /* add your design */ 
    //assign  funct[5:0] = 6'b100000;
    //assign  ALU_OP[1:0] = 2'b10;
    //ALU_CTRL[3:0] = 4'b0011;





    always @(funct or ALU_OP)
    begin 
       if(ALU_OP[1:0] == 2'b00)
       begin
          ALU_CTRL[3:0] = 4'b0010;
       end

       else if(ALU_OP[1:0] == 2'b01)
       begin
          ALU_CTRL[3:0] = 4'b0110;
       end

       else if(ALU_OP[1:0] == 2'b10 && funct[5:0] == 6'b100000)
       begin
          ALU_CTRL[3:0] = 4'b0010;
       end

       else if(ALU_OP[1:0] == 2'b10 && funct[5:0] == 6'b100010)
       begin
          ALU_CTRL[3:0] = 4'b0110;
       end

       else if(ALU_OP[1:0] == 2'b10 && funct[5:0] == 6'b100100)
       begin
          ALU_CTRL[3:0] = 4'b0000;
       end

       else if(ALU_OP[1:0] == 2'b10 && funct[5:0] == 6'b100101)
       begin
          ALU_CTRL[3:0] = 4'b0001;
       end

       else if(ALU_OP[1:0] == 2'b10 && funct[5:0] == 6'b101010)
       begin
          ALU_CTRL[3:0] = 4'b0111;
       end
    end

endmodule
