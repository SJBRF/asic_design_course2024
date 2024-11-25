//_\TLV_version 1d: tl-x.org, generated by SandPiper(TM) 1.14-2022/10/10-beta-Pro
`include "sp_verilog.vh" //_\SV
   // Included URL: "https://raw.githubusercontent.com/shivanishah269/risc-v-core/master/FPGA_Implementation/riscv_shell_lib.tlv"// Included URL: "https://raw.githubusercontent.com/stevehoover/warp-v_includes/2d6d36baa4d2bc62321f982f78c8fe1456641a43/risc-v_defs.tlv"
   
   // Module interface, either for Makerchip, or not.
   
   
   
   
   
   
   
   // Custom module interface for BabySoC.
   module riscv_pri(
      output reg [9:0] OUT,
      input CLK,
      input reset
   );
   wire clk = CLK;
   
   
`include "rvmyth_pri_gen.v" //_\TLV
   //
   // Inst #0: ADD,r10,r0,r0             // Initialize r10 (a0) to 0.
   // Function:
   // Inst #1: ADD,r14,r10,r0            // Initialize sum register a4 with 0x0
   // Inst #2: ADDI,r12,r10,1010         // Store count of 10 in register a2.
   // Inst #3: ADD,r13,r10,r0            // Initialize intermediate sum register a3 with 0
   // Loop:
   // Inst #4: ADD,r14,r13,r14           // Incremental addition
   // Inst #5: ADDI,r13,r13,1            // Increment intermediate register by 1
   // Inst #6: BLT,r13,r12,1111111111000 // If a3 is less than a2, branch to label named <loop>
   // Inst #7: ADD,r10,r14,r0            // Store final result to register a0 so that it can be read by main program
   // Inst #8: SW,r0,r10,100           // Store final result in memory address 0x100
   // Inst #9: LW,r15,r0,100           //r15 is destination
   // Optional:
   // m4_asm(JAL, r7, 00000000000000000000) // Done. Jump to itself (infinite loop).  
   
   //
   //_|cpu
      //_@0
         assign CPU_reset_a0 = reset;
         assign CPU_clk_chandan_a0 = clk;


         assign CPU_pc_a0[31:0] = (CPU_reset_a1) ? 32'd0 : 
                     (CPU_valid_taken_br_a3) ? CPU_br_tgt_pc_a3 : 
                     (CPU_valid_load_a3) ? CPU_inc_pc_a3 : 
                     (CPU_valid_jump_a3 && CPU_is_jal_a3) ? CPU_br_tgt_pc_a3 :
                     (CPU_valid_jump_a3 && CPU_is_jalr_a3) ? CPU_jalr_tgt_pc_a3 : CPU_inc_pc_a1;
         
         assign CPU_imem_rd_en_a0 = !CPU_reset_a0;
         assign CPU_imem_rd_addr_a0[31:0] = CPU_pc_a0[4+1:2];
         
      //_@1         
         assign CPU_instr_a1[31:0] = CPU_imem_rd_data_a1[31:0];
         assign CPU_inc_pc_a1[31:0] = CPU_pc_a1 + 32'd4;          


         assign CPU_is_i_instr_a1 = CPU_instr_a1[6:2] == 5'b00000 ||
                       CPU_instr_a1[6:2] == 5'b00001 ||
                       CPU_instr_a1[6:2] == 5'b00100 ||
                       CPU_instr_a1[6:2] == 5'b00110 ||
                       CPU_instr_a1[6:2] == 5'b11001;

         assign CPU_is_r_instr_a1 = CPU_instr_a1[6:2] == 5'b01011 ||
                       CPU_instr_a1[6:2] == 5'b10100 ||
                       CPU_instr_a1[6:2] == 5'b01100 ||
                       CPU_instr_a1[6:2] == 5'b01101;

         assign CPU_is_b_instr_a1 = CPU_instr_a1[6:2] == 5'b11000;

         assign CPU_is_u_instr_a1 = CPU_instr_a1[6:2] == 5'b00101 ||
                       CPU_instr_a1[6:2] == 5'b01101;

         assign CPU_is_s_instr_a1 = CPU_instr_a1[6:2] == 5'b01000 ||
                       CPU_instr_a1[6:2] == 5'b01001;

         assign CPU_is_j_instr_a1 = CPU_instr_a1[6:2] == 5'b11011;

         assign CPU_imm_a1[31:0] = CPU_is_i_instr_a1 ? { {21{CPU_instr_a1[31]}} , CPU_instr_a1[30:20] } :
                      CPU_is_s_instr_a1 ? { {21{CPU_instr_a1[31]}} , CPU_instr_a1[30:25] , CPU_instr_a1[11:8] , CPU_instr_a1[7] } :
                      CPU_is_b_instr_a1 ? { {20{CPU_instr_a1[31]}} , CPU_instr_a1[7] , CPU_instr_a1[30:25] , CPU_instr_a1[11:8] , 1'b0} :
                      CPU_is_u_instr_a1 ? { CPU_instr_a1[31:12] , 12'b0} : 
                      CPU_is_j_instr_a1 ? { {12{CPU_instr_a1[31]}} , CPU_instr_a1[19:12] , CPU_instr_a1[20] , CPU_instr_a1[30:21] , 1'b0} : 32'b0;
         //Extra fields- rs1,rs2,rd,func3,func7
         assign CPU_rs1_valid_a1 = CPU_is_r_instr_a1 || CPU_is_s_instr_a1 || CPU_is_b_instr_a1 || CPU_is_i_instr_a1;
         assign CPU_rs2_valid_a1 = CPU_is_r_instr_a1 || CPU_is_s_instr_a1 || CPU_is_b_instr_a1;
         assign CPU_rd_valid_a1 = CPU_is_r_instr_a1 || CPU_is_i_instr_a1 || CPU_is_u_instr_a1 || CPU_is_j_instr_a1;
         assign CPU_funct3_valid_a1 = CPU_is_r_instr_a1 || CPU_is_s_instr_a1 || CPU_is_b_instr_a1 || CPU_is_i_instr_a1;
         assign CPU_funct7_valid_a1 = CPU_is_r_instr_a1;
         //opcode
         assign CPU_opcode_a1[6:0] = CPU_instr_a1[6:0];
         //_?$rs2_valid
            assign w_CPU_rs2_a1[4:0] = CPU_instr_a1[24:20];
         //_?$rs1_valid
            assign w_CPU_rs1_a1[4:0] = CPU_instr_a1[19:15];
         //_?$rd_valid
            assign w_CPU_rd_a1[4:0] = CPU_instr_a1[11:7];
         //_?$funct3_valid
            assign CPU_funct3_a1[2:0] = CPU_instr_a1[14:12];
         //_?$funct7_valid
            assign CPU_funct7_a1[6:0] = CPU_instr_a1[31:25];
            
         
         //Decoding
         assign CPU_dec_bits_a1[10:0] = {CPU_funct7_a1[5],CPU_funct3_a1,CPU_opcode_a1};
         
         // Branch Instruction
         assign CPU_is_beq_a1 = CPU_dec_bits_a1[9:0] == 10'b000_1100011;
         assign CPU_is_bne_a1 = CPU_dec_bits_a1[9:0] == 10'b001_1100011;
         assign CPU_is_blt_a1 = CPU_dec_bits_a1[9:0] == 10'b100_1100011;
         assign CPU_is_bge_a1 = CPU_dec_bits_a1[9:0] == 10'b101_1100011;
         assign CPU_is_bltu_a1 = CPU_dec_bits_a1[9:0] == 10'b110_1100011;
         assign CPU_is_bgeu_a1 = CPU_dec_bits_a1[9:0] == 10'b111_1100011;
         
         // Arithmetic Instruction
         assign CPU_is_add_a1 = CPU_dec_bits_a1 == 11'b0_000_0110011;
         assign CPU_is_addi_a1 = CPU_dec_bits_a1[9:0] == 10'b000_0010011;
         assign CPU_is_or_a1 = CPU_dec_bits_a1 == 11'b0_110_0110011;
         assign CPU_is_ori_a1 = CPU_dec_bits_a1[9:0] == 10'b110_0010011;
         assign CPU_is_xor_a1 = CPU_dec_bits_a1 == 11'b0_100_0110011;
         assign CPU_is_xori_a1 = CPU_dec_bits_a1[9:0] == 10'b100_0010011;
         assign CPU_is_and_a1 = CPU_dec_bits_a1 == 11'b0_111_0110011;
         assign CPU_is_andi_a1 = CPU_dec_bits_a1[9:0] == 10'b111_0010011;
         assign CPU_is_sub_a1 = CPU_dec_bits_a1 == 11'b1_000_0110011;
         assign CPU_is_slti_a1 = CPU_dec_bits_a1[9:0] == 10'b010_0010011;
         assign CPU_is_sltiu_a1 = CPU_dec_bits_a1[9:0] == 10'b011_0010011;
         assign CPU_is_slli_a1 = CPU_dec_bits_a1 == 11'b0_001_0010011;
         assign CPU_is_srli_a1 = CPU_dec_bits_a1 == 11'b0_101_0010011;
         assign CPU_is_srai_a1 = CPU_dec_bits_a1 == 11'b1_101_0010011;
         assign CPU_is_sll_a1 = CPU_dec_bits_a1 == 11'b0_001_0110011;
         assign CPU_is_slt_a1 = CPU_dec_bits_a1 == 11'b0_010_0110011;
         assign CPU_is_sltu_a1 = CPU_dec_bits_a1 == 11'b0_011_0110011;
         assign CPU_is_srl_a1 = CPU_dec_bits_a1 == 11'b0_101_0110011;
         assign CPU_is_sra_a1 = CPU_dec_bits_a1 == 11'b1_101_0110011;
         
         // Load
         assign CPU_is_load_a1 = CPU_dec_bits_a1[6:0] == 7'b0000011;
         
         // Store
         assign CPU_is_sb_a1 = CPU_dec_bits_a1[9:0] == 10'b000_0100011;
         assign CPU_is_sh_a1 = CPU_dec_bits_a1[9:0] == 10'b001_0100011;
         assign CPU_is_sw_a1 = CPU_dec_bits_a1[9:0] == 10'b010_0100011;
         
         // Jump Instruction
         assign CPU_is_lui_a1 = CPU_dec_bits_a1[6:0] == 7'b0110111;
         assign CPU_is_auipc_a1 = CPU_dec_bits_a1[6:0] == 7'b0010111;
         assign CPU_is_jal_a1 = CPU_dec_bits_a1[6:0] == 7'b1101111;
         assign CPU_is_jalr_a1 = CPU_dec_bits_a1[9:0] == 10'b000_1100111;
         
         assign CPU_is_jump_a1 = CPU_is_jal_a1 || CPU_is_jalr_a1;
         
      //_@2   
      // Register File Read
         assign CPU_rf_rd_en1_a2 = CPU_rs1_valid_a2;
         //_?$rf_rd_en1
            assign CPU_rf_rd_index1_a2[4:0] = CPU_rs1_a2[4:0];
         
         assign CPU_rf_rd_en2_a2 = CPU_rs2_valid_a2;
         //_?$rf_rd_en2
            assign CPU_rf_rd_index2_a2[4:0] = CPU_rs2_a2[4:0];

      // Connecting Reg file to alu
         assign CPU_src1_value_a2[31:0] = ((CPU_rd_a3 == CPU_rs1_a2) && CPU_rf_wr_en_a3) ? CPU_result_a3 : CPU_rf_rd_data1_a2[31:0];
         assign CPU_src2_value_a2[31:0] = ((CPU_rd_a3 == CPU_rs2_a2) && CPU_rf_wr_en_a3) ? CPU_result_a3 : CPU_rf_rd_data2_a2[31:0];
       // Branch  PC       
         assign CPU_br_tgt_pc_a2[31:0] = CPU_pc_a2 + CPU_imm_a2;
      
      // Jump  PC
         assign CPU_jalr_tgt_pc_a2[31:0] = CPU_src1_value_a2 + CPU_imm_a2;
         
      //_@3   
         
      
         assign CPU_sltu_result_a3 = CPU_src1_value_a3 < CPU_src2_value_a3 ;
         assign CPU_sltiu_result_a3 = CPU_src1_value_a3 < CPU_imm_a3 ;
         // alu
         assign CPU_result_a3[31:0] = CPU_is_addi_a3 ? CPU_src1_value_a3 + CPU_imm_a3 :
                         CPU_is_add_a3 ? CPU_src1_value_a3 + CPU_src2_value_a3 : 
                         CPU_is_or_a3 ? CPU_src1_value_a3 | CPU_src2_value_a3 : 
                         CPU_is_ori_a3 ? CPU_src1_value_a3 | CPU_imm_a3 :
                         CPU_is_xor_a3 ? CPU_src1_value_a3 ^ CPU_src2_value_a3 :
                         CPU_is_xori_a3 ? CPU_src1_value_a3 ^ CPU_imm_a3 :
                         CPU_is_and_a3 ? CPU_src1_value_a3 & CPU_src2_value_a3 :
                         CPU_is_andi_a3 ? CPU_src1_value_a3 & CPU_imm_a3 :
                         CPU_is_sub_a3 ? CPU_src1_value_a3 - CPU_src2_value_a3 :
                         CPU_is_slti_a3 ? ((CPU_src1_value_a3[31] == CPU_imm_a3[31]) ? CPU_sltiu_result_a3 : {31'b0,CPU_src1_value_a3[31]}) :
                         CPU_is_sltiu_a3 ? CPU_sltiu_result_a3 :
                         CPU_is_slli_a3 ? CPU_src1_value_a3 << CPU_imm_a3[5:0] :
                         CPU_is_srli_a3 ? CPU_src1_value_a3 >> CPU_imm_a3[5:0] :
                         CPU_is_srai_a3 ? ({{32{CPU_src1_value_a3[31]}}, CPU_src1_value_a3} >> CPU_imm_a3[4:0]) :
                         CPU_is_sll_a3 ? CPU_src1_value_a3 << CPU_src2_value_a3[4:0] :
                         CPU_is_slt_a3 ? ((CPU_src1_value_a3[31] == CPU_src2_value_a3[31]) ? CPU_sltu_result_a3 : {31'b0,CPU_src1_value_a3[31]}) :
                         CPU_is_sltu_a3 ? CPU_sltu_result_a3 :
                         CPU_is_srl_a3 ? CPU_src1_value_a3 >> CPU_src2_value_a3[5:0] :
                         CPU_is_sra_a3 ? ({{32{CPU_src1_value_a3[31]}}, CPU_src1_value_a3} >> CPU_src2_value_a3[4:0]) :
                         CPU_is_lui_a3 ? ({CPU_imm_a3[31:12], 12'b0}) :
                         CPU_is_auipc_a3 ? CPU_pc_a3 + CPU_imm_a3 :
                         CPU_is_jal_a3 ? CPU_pc_a3 + 4 :
                         CPU_is_jalr_a3 ? CPU_pc_a3 + 4 : 
                         (CPU_is_load_a3 || CPU_is_s_instr_a3) ? CPU_src1_value_a3 + CPU_imm_a3 : 32'bx;
                         
      // Register File Write
         assign CPU_rf_wr_en_a3 = (CPU_rd_valid_a3 && CPU_valid_a3 && CPU_rd_a3 != 5'b0) || CPU_valid_load_a5;
         //_?$rf_wr_en
            assign CPU_rf_wr_index_a3[4:0] = !CPU_valid_a3 ? CPU_rd_a5[4:0] : CPU_rd_a3[4:0];
      
         assign CPU_rf_wr_data_a3[31:0] = !CPU_valid_a3 ? CPU_ld_data_a5[31:0] : CPU_result_a3[31:0];
      
      // Branch
         assign CPU_taken_br_a3 = CPU_is_beq_a3 ? (CPU_src1_value_a3 == CPU_src2_value_a3) :
                     CPU_is_bne_a3 ? (CPU_src1_value_a3 != CPU_src2_value_a3) :
                     CPU_is_blt_a3 ? ((CPU_src1_value_a3 < CPU_src2_value_a3) ^ (CPU_src1_value_a3[31] != CPU_src2_value_a3[31])) :
                     CPU_is_bge_a3 ? ((CPU_src1_value_a3 >= CPU_src2_value_a3) ^ (CPU_src1_value_a3[31] != CPU_src2_value_a3[31])) :
                     CPU_is_bltu_a3 ? (CPU_src1_value_a3 < CPU_src2_value_a3) :
                     CPU_is_bgeu_a3 ? (CPU_src1_value_a3 >= CPU_src2_value_a3) : 1'b0;
      //valid branch signal        
         assign CPU_valid_taken_br_a3 = CPU_valid_a3 && CPU_taken_br_a3;
         
      // Load
         assign CPU_valid_load_a3 = CPU_valid_a3 && CPU_is_load_a3;
         assign CPU_valid_a3 = !(CPU_valid_taken_br_a4 || CPU_valid_taken_br_a5 || CPU_valid_load_a4 || CPU_valid_load_a5 || CPU_valid_jump_a4 || CPU_valid_jump_a5);
      
      // Jump
         assign CPU_valid_jump_a3 = CPU_valid_a3 && CPU_is_jump_a3;
                  
      //_@4
         //memory
         assign CPU_dmem_rd_en_a4 = CPU_valid_load_a4;
         assign CPU_dmem_wr_en_a4 = CPU_valid_a4 && CPU_is_s_instr_a4;
         assign CPU_dmem_addr_a4[3:0] = CPU_result_a4[5:2];
         assign CPU_dmem_wr_data_a4[31:0] = CPU_src2_value_a4[31:0];
         
      //_@5   
         //load data stage
         assign CPU_ld_data_a5[31:0] = CPU_dmem_rd_data_a5[31:0];
         
      // Note: Because of the magic we are using for visualisation, if visualisation is enabled below,
      //       be sure to avoid having unassigned signals (which you might be using for random inputs)
      //       other than those specifically expected in the labs. You'll get strange errors for these.

         `BOGUS_USE(CPU_is_beq_a5 CPU_is_bne_a5 CPU_is_blt_a5 CPU_is_bge_a5 CPU_is_bltu_a5 CPU_is_bgeu_a5 CPU_is_sb_a5 CPU_is_sh_a5 CPU_is_sw_a5 CPU_clk_chandan_a5)
         
   // Assert these to end simulation (before Makerchip cycle limit).
   /*SV_plus*/
      always @ (posedge CLK) begin
         OUT = CPU_Xreg_value_a5[15];                
      end
   
   // Macro instantiations for:
   //  o instruction memory
   //  o register file
   //  o data memory
   //  o CPU visualization
   //_|cpu
      //_\source /raw.githubusercontent.com/shivanishah269/riscvcore/master/FPGAImplementation/riscvshelllib.tlv 16   // Instantiated from risc_chandan.tlv, 257 as: m4+imem(@1)
         // Instruction Memory containing program defined by m4_asm(...) instantiations.
         //_@1
            /*SV_plus*/
               // The program in an instruction memory.
               wire [31:0] instrs [0:10-1];
               assign instrs[0] = {7'b0000000, 5'd0, 5'd0, 3'b000, 5'd10, 7'b0110011}; 
               assign instrs[1] = {7'b0000000, 5'd0, 5'd10, 3'b000, 5'd14, 7'b0110011}; 
               assign instrs[2] = {12'b1010, 5'd10, 3'b000, 5'd12, 7'b0010011}; 
               assign instrs[3] = {7'b0000000, 5'd0, 5'd10, 3'b000, 5'd13, 7'b0110011}; 
               assign instrs[4] = {7'b0000000, 5'd14, 5'd13, 3'b000, 5'd14, 7'b0110011}; 
               assign instrs[5] = {12'b1, 5'd13, 3'b000, 5'd13, 7'b0010011}; 
               assign instrs[6] = {1'b1, 6'b111111, 5'd12, 5'd13, 3'b100, 4'b1100, 1'b1, 7'b1100011}; 
               assign instrs[7] = {7'b0000000, 5'd0, 5'd14, 3'b000, 5'd10, 7'b0110011}; 
               assign instrs[8] = {7'b0000000, 5'd10, 5'd0, 3'b010, 5'b00100, 7'b0100011}; 
               assign instrs[9] = {12'b100, 5'd0, 3'b010, 5'd15, 7'b0000011}; 
                 
            generate for (imem = 0; imem <= 9; imem=imem+1) begin : L1_CPU_Imem //_/imem
               assign CPU_Imem_instr_a1[imem][31:0] = instrs[imem];
            end endgenerate
            //_?$imem_rd_en
               assign CPU_imem_rd_data_a1[31:0] = CPU_imem_rd_addr_a1 < 10 ? CPU_Imem_instr_a1[CPU_imem_rd_addr_a1] : 32'b0;
          
      //_\end_source    // Args: (read stage)
      //_\source /raw.githubusercontent.com/shivanishah269/riscvcore/master/FPGAImplementation/riscvshelllib.tlv 31   // Instantiated from risc_chandan.tlv, 258 as: m4+rf(@2, @3)
         // Reg File
         //_@3
            generate for (xreg = 0; xreg <= 31; xreg=xreg+1) begin : L1_CPU_Xreg //_/xreg

               // For $wr.
               wire L1_wr_a3;

               assign L1_wr_a3 = CPU_rf_wr_en_a3 && (CPU_rf_wr_index_a3 != 5'b0) && (CPU_rf_wr_index_a3 == xreg);
               assign CPU_Xreg_value_a3[xreg][31:0] = CPU_reset_a3 ?   xreg           :
                              L1_wr_a3        ?   CPU_rf_wr_data_a3 :
                                             CPU_Xreg_value_a4[xreg][31:0];
            end endgenerate
         //_@2
            //_?$rf_rd_en1
               assign CPU_rf_rd_data1_a2[31:0] = CPU_Xreg_value_a4[CPU_rf_rd_index1_a2];
            //_?$rf_rd_en2
               assign CPU_rf_rd_data2_a2[31:0] = CPU_Xreg_value_a4[CPU_rf_rd_index2_a2];
            `BOGUS_USE(CPU_rf_rd_data1_a2 CPU_rf_rd_data2_a2) 
      //_\end_source  // Args: (read stage, write stage) - if equal, no register bypass is required
      //_\source /raw.githubusercontent.com/shivanishah269/riscvcore/master/FPGAImplementation/riscvshelllib.tlv 48   // Instantiated from risc_chandan.tlv, 259 as: m4+dmem(@4)
         // Data Memory
         //_@4
            generate for (dmem = 0; dmem <= 15; dmem=dmem+1) begin : L1_CPU_Dmem //_/dmem

               // For $wr.
               wire L1_wr_a4;

               assign L1_wr_a4 = CPU_dmem_wr_en_a4 && (CPU_dmem_addr_a4 == dmem);
               assign CPU_Dmem_value_a4[dmem][31:0] = CPU_reset_a4 ?   dmem :
                              L1_wr_a4        ?   CPU_dmem_wr_data_a4 :
                                             CPU_Dmem_value_a5[dmem][31:0];
            end endgenerate
                                        
            //_?$dmem_rd_en
               assign w_CPU_dmem_rd_data_a4[31:0] = CPU_Dmem_value_a5[CPU_dmem_addr_a4];
            //`BOGUS_USE($dmem_rd_data)
      //_\end_source    // Args: (read/write stage)

//m4+cpu_viz(@4)//Visualization
//_\SV
   
   endmodule


// Undefine macros defined by SandPiper (in "riscv_chandan_gen.v").
`undef BOGUS_USE
