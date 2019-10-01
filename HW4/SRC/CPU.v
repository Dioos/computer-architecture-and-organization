`timescale 1ns / 1ps

module CPU(CLK, START);

	input CLK, START;
	wire [15:0] PC;
	wire [25:0] Instr;

        //////////////////////////////////////////////////////////op code from Instr////////////////////////////
	wire [5:0] OP;
	
        ////////////////////////////////////rs rt td id from Instr////////////////////////////////////
	wire [2:0] RS_ID, RT_ID , RD_ID;

        /////////////////////////////////////////send to register area//////////////////////////////////////
	wire [15:0] Reg_RData1, Reg_RData2, Reg_WData;

        ////////////////////////////////////////first send to control unit, then register area would read it
	wire Reg_WE;
	
        //////////////////////////////////////// not my business
	wire [15:0] DM_RData, DM_WData ;

        ///////////////////////////////////////can write to memory or not
	wire DM_WE;
	
        ///////////////////////////////////////
	wire [15:0] address;

        //////////////////////////////////////the valut you want to extend
	wire [13:0] immediate_in;
	
        //////////////////////////////////////function code , send to control unit
	wire [5:0] funct;
        //////////////////////////////////////the number out control unit to ALU control
	wire [1:0] ALU_OP;
        //////////////////////////////////////the number out ALU control to ALU 
	wire [3:0] ALU_CTRL;
	
        //////////////////////////////////////the output after ALU computed
	wire [15:0] ALU_result;

        //////////////////////////////////////the output after value extended
	wire [15:0] extend_sign;
	
        //////////////////////////////////////the output after Mux choosen
	wire [15:0] Mux_to_ALU;
 
        //////////////////////////////////////ALU source(sign extension  OR   register2)
	wire ALU_src;
        /////////////////////////////////////write what back to register(result of ALU   OR   memory data)
	wire MEM_to_REG;
        /////////////////////////////////////which register would be written back(rt OR rd)
	wire REG_Dst;
	
        ////////////////////////////////////
	wire [2:0] REG_W_ID;
	
        ////////////////////////////////////
	wire [15:0] ALU_src1,ALU_src2;

        ////////////////////////////////////
	wire [15:0] Mux_Mem_to_reg_out;
	
	


	assign OP = Instr[25:20];
	assign RS_ID = Instr[19:17];
	assign RT_ID = Instr[16:14];
	assign RD_ID = Instr[13:11];
	assign DM_WData = Reg_RData2; 
	assign immediate_in = Instr[13:0];
	
	
	/*add your code here*/
        assign funct =  Instr[5:0];
        assign address = ALU_result;
        assign ALU_src1 = Reg_RData1;
        assign ALU_src2 = Mux_to_ALU;
        assign Reg_WData = Mux_Mem_to_reg_out;



	
	PC i_PC(CLK, START, PC);
	IM i_IM(START, PC, Instr);

        Decoder i_Decoder(OP, Reg_WE, DM_WE , ALU_OP , ALU_src , MEM_to_REG , REG_Dst ,funct);
	Reg i_Reg(CLK, RS_ID, RT_ID,  REG_W_ID ,Reg_WE, Reg_RData1, Reg_RData2, Reg_WData );
	
	
	
	MUX_2_to_1 #(.size(3))MUX_REG_Dst(RT_ID,RD_ID,REG_Dst,REG_W_ID);
	
	sign_extend i_sign_extend(immediate_in,extend_sign);
	
	MUX_2_to_1 #(.size(16))MUX_ALUsrc(Reg_RData2,extend_sign,ALU_src,Mux_to_ALU);
	
	
	ALU_ctrl i_ALU_ctrl(funct,ALU_OP,ALU_CTRL);
	
	ALU i_ALU(ALU_src1,ALU_src2,ALU_CTRL,ALU_result);
	
	DM i_DM(CLK, ALU_result, DM_WE, DM_RData, DM_WData );
	
	MUX_2_to_1 #(.size(16))MUX_MEM_to_REG(ALU_result,DM_RData,MEM_to_REG,Mux_Mem_to_reg_out);
	
	
	
	
endmodule
