`ifdef DEBUG
integer file;
integer file1,file2;

initial 
begin
file = $fopen("../debussy/lq.csv");
file1 = $fopen("./hpu.dat");
file2 = $fopen("./vpu.dat");
DEBUG;
end

task DEBUG;
integer k;
begin
    #100000
    wait(u_ldpc_dec.u_ram00.ADDRB == 8'hf5) begin
    $display("OK,%dns",$time);
    for(k=0;k<256;k=k+1) begin
    $fdisplay(file,"%d",$signed(u_ldpc_dec.u_ram00 .mem[k]));
    $fdisplay(file,"%d",$signed(u_ldpc_dec.u_ram01 .mem[k]));
    $fdisplay(file,"%d",$signed(u_ldpc_dec.u_ram02 .mem[k]));
    $fdisplay(file,"%d",$signed(u_ldpc_dec.u_ram03 .mem[k]));
    $fdisplay(file,"%d",$signed(u_ldpc_dec.u_ram04 .mem[k]));
    $fdisplay(file,"%d",$signed(u_ldpc_dec.u_ram05 .mem[k]));
    $fdisplay(file,"%d",$signed(u_ldpc_dec.u_ram06 .mem[k]));
    $fdisplay(file,"%d",$signed(u_ldpc_dec.u_ram07 .mem[k]));
    $fdisplay(file,"%d",$signed(u_ldpc_dec.u_ram08 .mem[k]));
    $fdisplay(file,"%d",$signed(u_ldpc_dec.u_ram09 .mem[k]));
    $fdisplay(file,"%d",$signed(u_ldpc_dec.u_ram10 .mem[k]));
    $fdisplay(file,"%d",$signed(u_ldpc_dec.u_ram11 .mem[k]));
    $fdisplay(file,"%d",$signed(u_ldpc_dec.u_ram12 .mem[k]));
    $fdisplay(file,"%d",$signed(u_ldpc_dec.u_ram13 .mem[k]));
    $fdisplay(file,"%d",$signed(u_ldpc_dec.u_ram14 .mem[k]));
    $fdisplay(file,"%d",$signed(u_ldpc_dec.u_ram15 .mem[k]));
    $fdisplay(file,"%d",$signed(u_ldpc_dec.u_ram16 .mem[k]));
    $fdisplay(file,"%d",$signed(u_ldpc_dec.u_ram17 .mem[k]));
    $fdisplay(file,"%d",$signed(u_ldpc_dec.u_ram18 .mem[k]));
    $fdisplay(file,"%d",$signed(u_ldpc_dec.u_ram19 .mem[k]));
    $fdisplay(file,"%d",$signed(u_ldpc_dec.u_ram20 .mem[k]));
    $fdisplay(file,"%d",$signed(u_ldpc_dec.u_ram21 .mem[k]));
    $fdisplay(file,"%d",$signed(u_ldpc_dec.u_ram22 .mem[k]));
    $fdisplay(file,"%d",$signed(u_ldpc_dec.u_ram23 .mem[k]));
    $fdisplay(file,"%d",$signed(u_ldpc_dec.u_ram24 .mem[k]));
    $fdisplay(file,"%d",$signed(u_ldpc_dec.u_ram25 .mem[k]));
    $fdisplay(file,"%d",$signed(u_ldpc_dec.u_ram26 .mem[k]));
    $fdisplay(file,"%d",$signed(u_ldpc_dec.u_ram27 .mem[k]));
    $fdisplay(file,"%d",$signed(u_ldpc_dec.u_ram28 .mem[k]));
    $fdisplay(file,"%d",$signed(u_ldpc_dec.u_ram29 .mem[k]));
    $fdisplay(file,"%d",$signed(u_ldpc_dec.u_ram30 .mem[k]));
    $fdisplay(file,"%d",$signed(u_ldpc_dec.u_ram31 .mem[k]));
    $fdisplay(file,"%d",$signed(u_ldpc_dec.u_ram32 .mem[k]));
    $fdisplay(file,"%d",$signed(u_ldpc_dec.u_ram33 .mem[k]));
    $fdisplay(file,"%d",$signed(u_ldpc_dec.u_ram34 .mem[k]));
    $fdisplay(file,"%d",$signed(u_ldpc_dec.u_ram35 .mem[k]));  
      end
    #90000 $finish;  
    end                                       
end
endtask


always  @ (posedge clk) 
    if (u_ldpc_dec.u_data_comp.cnu_in[2] == 1'b1) begin
    $fdisplay(file1,"%d, %d, %d, %d, %d ,%d,",$signed(u_ldpc_dec.u_data_comp.comp0.lq0),$signed(u_ldpc_dec.u_data_comp.comp0.lq1),$signed(u_ldpc_dec.u_data_comp.comp0.lq2),$signed(u_ldpc_dec.u_data_comp.comp0.lq3),$signed(u_ldpc_dec.u_data_comp.comp0.lq4),$signed(u_ldpc_dec.u_data_comp.comp0.lq5));
    $fdisplay(file1,"%d, %d, %d, %d, %d ,%d,",$signed(u_ldpc_dec.u_data_comp.comp1.lq0),$signed(u_ldpc_dec.u_data_comp.comp1.lq1),$signed(u_ldpc_dec.u_data_comp.comp1.lq2),$signed(u_ldpc_dec.u_data_comp.comp1.lq3),$signed(u_ldpc_dec.u_data_comp.comp1.lq4),$signed(u_ldpc_dec.u_data_comp.comp1.lq5));
    $fdisplay(file1,"%d, %d, %d, %d, %d ,%d,",$signed(u_ldpc_dec.u_data_comp.comp2.lq0),$signed(u_ldpc_dec.u_data_comp.comp2.lq1),$signed(u_ldpc_dec.u_data_comp.comp2.lq2),$signed(u_ldpc_dec.u_data_comp.comp2.lq3),$signed(u_ldpc_dec.u_data_comp.comp2.lq4),$signed(u_ldpc_dec.u_data_comp.comp2.lq5));
    $fdisplay(file1,"%d, %d, %d, %d, %d ,%d,",$signed(u_ldpc_dec.u_data_comp.comp3.lq0),$signed(u_ldpc_dec.u_data_comp.comp3.lq1),$signed(u_ldpc_dec.u_data_comp.comp3.lq2),$signed(u_ldpc_dec.u_data_comp.comp3.lq3),$signed(u_ldpc_dec.u_data_comp.comp3.lq4),$signed(u_ldpc_dec.u_data_comp.comp3.lq5));
    $fdisplay(file1,"%d, %d, %d, %d, %d ,%d,",$signed(u_ldpc_dec.u_data_comp.comp4.lq0),$signed(u_ldpc_dec.u_data_comp.comp4.lq1),$signed(u_ldpc_dec.u_data_comp.comp4.lq2),$signed(u_ldpc_dec.u_data_comp.comp4.lq3),$signed(u_ldpc_dec.u_data_comp.comp4.lq4),$signed(u_ldpc_dec.u_data_comp.comp4.lq5));
    $fdisplay(file1,"%d, %d, %d, %d, %d ,%d,",$signed(u_ldpc_dec.u_data_comp.comp5.lq0),$signed(u_ldpc_dec.u_data_comp.comp5.lq1),$signed(u_ldpc_dec.u_data_comp.comp5.lq2),$signed(u_ldpc_dec.u_data_comp.comp5.lq3),$signed(u_ldpc_dec.u_data_comp.comp5.lq4),$signed(u_ldpc_dec.u_data_comp.comp5.lq5));
    $fdisplay(file1,"%d, %d, %d, %d, %d ,%d,",$signed(u_ldpc_dec.u_data_comp.comp6.lq0),$signed(u_ldpc_dec.u_data_comp.comp6.lq1),$signed(u_ldpc_dec.u_data_comp.comp6.lq2),$signed(u_ldpc_dec.u_data_comp.comp6.lq3),$signed(u_ldpc_dec.u_data_comp.comp6.lq4),$signed(u_ldpc_dec.u_data_comp.comp6.lq5));
    $fdisplay(file1,"%d, %d, %d, %d, %d ,%d,",$signed(u_ldpc_dec.u_data_comp.comp7.lq0),$signed(u_ldpc_dec.u_data_comp.comp7.lq1),$signed(u_ldpc_dec.u_data_comp.comp7.lq2),$signed(u_ldpc_dec.u_data_comp.comp7.lq3),$signed(u_ldpc_dec.u_data_comp.comp7.lq4),$signed(u_ldpc_dec.u_data_comp.comp7.lq5));
    $fdisplay(file1,"%d, %d, %d, %d, %d ,%d,",$signed(u_ldpc_dec.u_data_comp.comp8.lq0),$signed(u_ldpc_dec.u_data_comp.comp8.lq1),$signed(u_ldpc_dec.u_data_comp.comp8.lq2),$signed(u_ldpc_dec.u_data_comp.comp8.lq3),$signed(u_ldpc_dec.u_data_comp.comp8.lq4),$signed(u_ldpc_dec.u_data_comp.comp8.lq5));
    $fdisplay(file1,"%d, %d, %d, %d, %d ,%d,",$signed(u_ldpc_dec.u_data_comp.comp9.lq0),$signed(u_ldpc_dec.u_data_comp.comp9.lq1),$signed(u_ldpc_dec.u_data_comp.comp9.lq2),$signed(u_ldpc_dec.u_data_comp.comp9.lq3),$signed(u_ldpc_dec.u_data_comp.comp9.lq4),$signed(u_ldpc_dec.u_data_comp.comp9.lq5));
    $fdisplay(file1,"%d, %d, %d, %d, %d ,%d,",$signed(u_ldpc_dec.u_data_comp.compa.lq0),$signed(u_ldpc_dec.u_data_comp.compa.lq1),$signed(u_ldpc_dec.u_data_comp.compa.lq2),$signed(u_ldpc_dec.u_data_comp.compa.lq3),$signed(u_ldpc_dec.u_data_comp.compa.lq4),$signed(u_ldpc_dec.u_data_comp.compa.lq5));
    $fdisplay(file1,"%d, %d, %d, %d, %d ,%d,",$signed(u_ldpc_dec.u_data_comp.compb.lq0),$signed(u_ldpc_dec.u_data_comp.compb.lq1),$signed(u_ldpc_dec.u_data_comp.compb.lq2),$signed(u_ldpc_dec.u_data_comp.compb.lq3),$signed(u_ldpc_dec.u_data_comp.compb.lq4),$signed(u_ldpc_dec.u_data_comp.compb.lq5));
    $fdisplay(file1,"%d, %d, %d, %d, %d ,%d,",$signed(u_ldpc_dec.u_data_comp.compc.lq0),$signed(u_ldpc_dec.u_data_comp.compc.lq1),$signed(u_ldpc_dec.u_data_comp.compc.lq2),$signed(u_ldpc_dec.u_data_comp.compc.lq3),$signed(u_ldpc_dec.u_data_comp.compc.lq4),$signed(u_ldpc_dec.u_data_comp.compc.lq5));
    $fdisplay(file1,"%d, %d, %d, %d, %d ,%d,",$signed(u_ldpc_dec.u_data_comp.compd.lq0),$signed(u_ldpc_dec.u_data_comp.compd.lq1),$signed(u_ldpc_dec.u_data_comp.compd.lq2),$signed(u_ldpc_dec.u_data_comp.compd.lq3),$signed(u_ldpc_dec.u_data_comp.compd.lq4),$signed(u_ldpc_dec.u_data_comp.compd.lq5));
    $fdisplay(file1,"%d, %d, %d, %d, %d ,%d,",$signed(u_ldpc_dec.u_data_comp.compe.lq0),$signed(u_ldpc_dec.u_data_comp.compe.lq1),$signed(u_ldpc_dec.u_data_comp.compe.lq2),$signed(u_ldpc_dec.u_data_comp.compe.lq3),$signed(u_ldpc_dec.u_data_comp.compe.lq4),$signed(u_ldpc_dec.u_data_comp.compe.lq5));
    $fdisplay(file1,"%d, %d, %d, %d, %d ,%d,",$signed(u_ldpc_dec.u_data_comp.compf.lq0),$signed(u_ldpc_dec.u_data_comp.compf.lq1),$signed(u_ldpc_dec.u_data_comp.compf.lq2),$signed(u_ldpc_dec.u_data_comp.compf.lq3),$signed(u_ldpc_dec.u_data_comp.compf.lq4),$signed(u_ldpc_dec.u_data_comp.compf.lq5));
    $fdisplay(file1,"%d, %d, %d, %d, %d ,%d,",$signed(u_ldpc_dec.u_data_comp.compg.lq0),$signed(u_ldpc_dec.u_data_comp.compg.lq1),$signed(u_ldpc_dec.u_data_comp.compg.lq2),$signed(u_ldpc_dec.u_data_comp.compg.lq3),$signed(u_ldpc_dec.u_data_comp.compg.lq4),$signed(u_ldpc_dec.u_data_comp.compg.lq5));
    $fdisplay(file1,"%d, %d, %d, %d, %d ,%d,",$signed(u_ldpc_dec.u_data_comp.comph.lq0),$signed(u_ldpc_dec.u_data_comp.comph.lq1),$signed(u_ldpc_dec.u_data_comp.comph.lq2),$signed(u_ldpc_dec.u_data_comp.comph.lq3),$signed(u_ldpc_dec.u_data_comp.comph.lq4),$signed(u_ldpc_dec.u_data_comp.comph.lq5));
    end

always  @ (posedge clk) 
    if (u_ldpc_dec.u_data_comp.cnu_in[6] == 1'b1) begin
    $fdisplay(file2,"%d, %d, %d, %d, %d ,%d,",$signed(u_ldpc_dec.u_data_comp.comp0.lq0_dly),$signed(u_ldpc_dec.u_data_comp.comp0.lq1_dly),$signed(u_ldpc_dec.u_data_comp.comp0.lq2_dly),$signed(u_ldpc_dec.u_data_comp.comp0.lq3_dly),$signed(u_ldpc_dec.u_data_comp.comp0.lq4_dly),$signed(u_ldpc_dec.u_data_comp.comp0.lq5_dly));
    $fdisplay(file2,"%d, %d, %d, %d, %d ,%d,",$signed(u_ldpc_dec.u_data_comp.comp1.lq0_dly),$signed(u_ldpc_dec.u_data_comp.comp1.lq1_dly),$signed(u_ldpc_dec.u_data_comp.comp1.lq2_dly),$signed(u_ldpc_dec.u_data_comp.comp1.lq3_dly),$signed(u_ldpc_dec.u_data_comp.comp1.lq4_dly),$signed(u_ldpc_dec.u_data_comp.comp1.lq5_dly));
    $fdisplay(file2,"%d, %d, %d, %d, %d ,%d,",$signed(u_ldpc_dec.u_data_comp.comp2.lq0_dly),$signed(u_ldpc_dec.u_data_comp.comp2.lq1_dly),$signed(u_ldpc_dec.u_data_comp.comp2.lq2_dly),$signed(u_ldpc_dec.u_data_comp.comp2.lq3_dly),$signed(u_ldpc_dec.u_data_comp.comp2.lq4_dly),$signed(u_ldpc_dec.u_data_comp.comp2.lq5_dly));
    $fdisplay(file2,"%d, %d, %d, %d, %d ,%d,",$signed(u_ldpc_dec.u_data_comp.comp3.lq0_dly),$signed(u_ldpc_dec.u_data_comp.comp3.lq1_dly),$signed(u_ldpc_dec.u_data_comp.comp3.lq2_dly),$signed(u_ldpc_dec.u_data_comp.comp3.lq3_dly),$signed(u_ldpc_dec.u_data_comp.comp3.lq4_dly),$signed(u_ldpc_dec.u_data_comp.comp3.lq5_dly));
    $fdisplay(file2,"%d, %d, %d, %d, %d ,%d,",$signed(u_ldpc_dec.u_data_comp.comp4.lq0_dly),$signed(u_ldpc_dec.u_data_comp.comp4.lq1_dly),$signed(u_ldpc_dec.u_data_comp.comp4.lq2_dly),$signed(u_ldpc_dec.u_data_comp.comp4.lq3_dly),$signed(u_ldpc_dec.u_data_comp.comp4.lq4_dly),$signed(u_ldpc_dec.u_data_comp.comp4.lq5_dly));
    $fdisplay(file2,"%d, %d, %d, %d, %d ,%d,",$signed(u_ldpc_dec.u_data_comp.comp5.lq0_dly),$signed(u_ldpc_dec.u_data_comp.comp5.lq1_dly),$signed(u_ldpc_dec.u_data_comp.comp5.lq2_dly),$signed(u_ldpc_dec.u_data_comp.comp5.lq3_dly),$signed(u_ldpc_dec.u_data_comp.comp5.lq4_dly),$signed(u_ldpc_dec.u_data_comp.comp5.lq5_dly));
    $fdisplay(file2,"%d, %d, %d, %d, %d ,%d,",$signed(u_ldpc_dec.u_data_comp.comp6.lq0_dly),$signed(u_ldpc_dec.u_data_comp.comp6.lq1_dly),$signed(u_ldpc_dec.u_data_comp.comp6.lq2_dly),$signed(u_ldpc_dec.u_data_comp.comp6.lq3_dly),$signed(u_ldpc_dec.u_data_comp.comp6.lq4_dly),$signed(u_ldpc_dec.u_data_comp.comp6.lq5_dly));
    $fdisplay(file2,"%d, %d, %d, %d, %d ,%d,",$signed(u_ldpc_dec.u_data_comp.comp7.lq0_dly),$signed(u_ldpc_dec.u_data_comp.comp7.lq1_dly),$signed(u_ldpc_dec.u_data_comp.comp7.lq2_dly),$signed(u_ldpc_dec.u_data_comp.comp7.lq3_dly),$signed(u_ldpc_dec.u_data_comp.comp7.lq4_dly),$signed(u_ldpc_dec.u_data_comp.comp7.lq5_dly));
    $fdisplay(file2,"%d, %d, %d, %d, %d ,%d,",$signed(u_ldpc_dec.u_data_comp.comp8.lq0_dly),$signed(u_ldpc_dec.u_data_comp.comp8.lq1_dly),$signed(u_ldpc_dec.u_data_comp.comp8.lq2_dly),$signed(u_ldpc_dec.u_data_comp.comp8.lq3_dly),$signed(u_ldpc_dec.u_data_comp.comp8.lq4_dly),$signed(u_ldpc_dec.u_data_comp.comp8.lq5_dly));
    $fdisplay(file2,"%d, %d, %d, %d, %d ,%d,",$signed(u_ldpc_dec.u_data_comp.comp9.lq0_dly),$signed(u_ldpc_dec.u_data_comp.comp9.lq1_dly),$signed(u_ldpc_dec.u_data_comp.comp9.lq2_dly),$signed(u_ldpc_dec.u_data_comp.comp9.lq3_dly),$signed(u_ldpc_dec.u_data_comp.comp9.lq4_dly),$signed(u_ldpc_dec.u_data_comp.comp9.lq5_dly));
    $fdisplay(file2,"%d, %d, %d, %d, %d ,%d,",$signed(u_ldpc_dec.u_data_comp.compa.lq0_dly),$signed(u_ldpc_dec.u_data_comp.compa.lq1_dly),$signed(u_ldpc_dec.u_data_comp.compa.lq2_dly),$signed(u_ldpc_dec.u_data_comp.compa.lq3_dly),$signed(u_ldpc_dec.u_data_comp.compa.lq4_dly),$signed(u_ldpc_dec.u_data_comp.compa.lq5_dly));
    $fdisplay(file2,"%d, %d, %d, %d, %d ,%d,",$signed(u_ldpc_dec.u_data_comp.compb.lq0_dly),$signed(u_ldpc_dec.u_data_comp.compb.lq1_dly),$signed(u_ldpc_dec.u_data_comp.compb.lq2_dly),$signed(u_ldpc_dec.u_data_comp.compb.lq3_dly),$signed(u_ldpc_dec.u_data_comp.compb.lq4_dly),$signed(u_ldpc_dec.u_data_comp.compb.lq5_dly));
    $fdisplay(file2,"%d, %d, %d, %d, %d ,%d,",$signed(u_ldpc_dec.u_data_comp.compc.lq0_dly),$signed(u_ldpc_dec.u_data_comp.compc.lq1_dly),$signed(u_ldpc_dec.u_data_comp.compc.lq2_dly),$signed(u_ldpc_dec.u_data_comp.compc.lq3_dly),$signed(u_ldpc_dec.u_data_comp.compc.lq4_dly),$signed(u_ldpc_dec.u_data_comp.compc.lq5_dly));
    $fdisplay(file2,"%d, %d, %d, %d, %d ,%d,",$signed(u_ldpc_dec.u_data_comp.compd.lq0_dly),$signed(u_ldpc_dec.u_data_comp.compd.lq1_dly),$signed(u_ldpc_dec.u_data_comp.compd.lq2_dly),$signed(u_ldpc_dec.u_data_comp.compd.lq3_dly),$signed(u_ldpc_dec.u_data_comp.compd.lq4_dly),$signed(u_ldpc_dec.u_data_comp.compd.lq5_dly));
    $fdisplay(file2,"%d, %d, %d, %d, %d ,%d,",$signed(u_ldpc_dec.u_data_comp.compe.lq0_dly),$signed(u_ldpc_dec.u_data_comp.compe.lq1_dly),$signed(u_ldpc_dec.u_data_comp.compe.lq2_dly),$signed(u_ldpc_dec.u_data_comp.compe.lq3_dly),$signed(u_ldpc_dec.u_data_comp.compe.lq4_dly),$signed(u_ldpc_dec.u_data_comp.compe.lq5_dly));
    $fdisplay(file2,"%d, %d, %d, %d, %d ,%d,",$signed(u_ldpc_dec.u_data_comp.compf.lq0_dly),$signed(u_ldpc_dec.u_data_comp.compf.lq1_dly),$signed(u_ldpc_dec.u_data_comp.compf.lq2_dly),$signed(u_ldpc_dec.u_data_comp.compf.lq3_dly),$signed(u_ldpc_dec.u_data_comp.compf.lq4_dly),$signed(u_ldpc_dec.u_data_comp.compf.lq5_dly));
    $fdisplay(file2,"%d, %d, %d, %d, %d ,%d,",$signed(u_ldpc_dec.u_data_comp.compg.lq0_dly),$signed(u_ldpc_dec.u_data_comp.compg.lq1_dly),$signed(u_ldpc_dec.u_data_comp.compg.lq2_dly),$signed(u_ldpc_dec.u_data_comp.compg.lq3_dly),$signed(u_ldpc_dec.u_data_comp.compg.lq4_dly),$signed(u_ldpc_dec.u_data_comp.compg.lq5_dly));
    $fdisplay(file2,"%d, %d, %d, %d, %d ,%d,",$signed(u_ldpc_dec.u_data_comp.comph.lq0_dly),$signed(u_ldpc_dec.u_data_comp.comph.lq1_dly),$signed(u_ldpc_dec.u_data_comp.comph.lq2_dly),$signed(u_ldpc_dec.u_data_comp.comph.lq3_dly),$signed(u_ldpc_dec.u_data_comp.comph.lq4_dly),$signed(u_ldpc_dec.u_data_comp.comph.lq5_dly));
    end
   
`endif
