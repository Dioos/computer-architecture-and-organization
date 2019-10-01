`timescale 1ns / 1ps
module MUX_2_to_1(data0_i,data1_i,select_i,data_o);
    parameter size = 0;	
    input  [size-1:0] data0_i;          
    input  [size-1:0] data1_i;
    input             select_i;
    output [size-1:0] data_o;

    reg [size-1:0] data_o;  
    /* add your design */

    //assign data_o = (select_i == 0) ? data0_i : data1_i;


   // if(select_i == 0)
    //     assign data_o = data0_i;

    
    always @(data0_i,data1_i,select_i)
    begin
       if(select_i == 0)
       begin
          data_o = data0_i;
       end
       else
       begin
          data_o = data1_i;
       end
    end
    
endmodule
