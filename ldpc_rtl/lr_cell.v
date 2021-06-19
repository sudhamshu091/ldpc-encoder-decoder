module lr_cell(
    clk,
    reset_n,
    iter_0,
    cnu_in,
    cycle ,
    cnu0_q,
    cnu1_q,
    cnu2_q,
    cnu3_q,
    cnu4_q,
    cnu5_q,
    mem_in,
    mem_out,
    cnu0_d,
    cnu1_d,
    cnu2_d,
    cnu3_d,
    cnu4_d,
    cnu5_d
);

//Parameter
parameter D_WID = 8;

//Input ports
input                 clk        ;
input                 reset_n    ;
input                 iter_0     ;
input  [6:0]          cnu_in     ;
input  [1:0]          cycle      ;
input  [2*D_WID+9:0]  cnu0_q     ;
input  [2*D_WID+9:0]  cnu1_q     ;
input  [2*D_WID+9:0]  cnu2_q     ;
input  [2*D_WID+9:0]  cnu3_q     ;
input  [2*D_WID+9:0]  cnu4_q     ;
input  [2*D_WID+9:0]  cnu5_q     ;
input  [4*D_WID+19:0] mem_out    ;

output [2*D_WID+9:0]  cnu0_d     ;
output [2*D_WID+9:0]  cnu1_d     ;
output [2*D_WID+9:0]  cnu2_d     ;
output [2*D_WID+9:0]  cnu3_d     ;
output [2*D_WID+9:0]  cnu4_d     ;
output [2*D_WID+9:0]  cnu5_d     ;
output [4*D_WID+19:0] mem_in     ;

reg    [4*D_WID+19:0] mem_in     ;
reg    [4*D_WID+19:0] cnu_tmp0   ;
reg    [4*D_WID+19:0] cnu_tmp1   ;
reg    [2*D_WID+9:0]  cnu0_d     ;
reg    [2*D_WID+9:0]  cnu1_d     ;
reg    [2*D_WID+9:0]  cnu2_d     ;
reg    [2*D_WID+9:0]  cnu3_d     ;
reg    [2*D_WID+9:0]  cnu4_d     ;
reg    [2*D_WID+9:0]  cnu5_d     ;
reg                   cnu_dly    ;

always @ (posedge clk or negedge reset_n)
begin : cnu_dly_r
    if(!reset_n)
        cnu_dly <= 1'b0;
    else 
        cnu_dly <= #1 cnu_in[6];
end        

always @ (posedge clk or negedge reset_n)
begin : mem_in_r
    if(!reset_n)
        mem_in <= #1 52'h0;
    else if(cnu_in[5])
        mem_in <= #1 {cnu0_q, cnu1_q};
    else if(cnu_in[6])
        mem_in <= #1 cnu_tmp0;
    else if(cnu_dly)
        mem_in <= #1 cnu_tmp1; 
end

always @ (posedge clk or negedge reset_n)
begin : cnu_tmp0_r
    if(!reset_n)
        cnu_tmp0 <= #1 52'h0;
    else if(cnu_in[5])
        cnu_tmp0 <= #1 {cnu2_q, cnu3_q};
end

always @ (posedge clk or negedge reset_n)
begin : cnu_tmp1_r
    if(!reset_n)
        cnu_tmp1 <= #1 52'h0;
    else if(cnu_in[5])
        cnu_tmp1 <= #1 {cnu4_q, cnu5_q};
end

always @ (posedge clk or negedge reset_n)
begin : cnu0_d_r
    if(!reset_n)
        cnu0_d <= #1 26'h0;
    else if((cycle == 2'b01) & !iter_0)
        cnu0_d <= #1 mem_out[4*D_WID+19:2*D_WID+10];
end

always @ (posedge clk or negedge reset_n)
begin : cnu1_d_r
    if(!reset_n)
        cnu1_d <= #1 26'h0;
    else if((cycle == 2'b01) & !iter_0)
        cnu1_d <= #1 mem_out[2*D_WID+9:0];
end

always @ (posedge clk or negedge reset_n)
begin : cnu2_d_r
    if(!reset_n)
        cnu2_d <= #1 26'h0;
    else if((cycle == 2'b10) & !iter_0)
        cnu2_d <= #1 mem_out[4*D_WID+19:2*D_WID+10];
end

always @ (posedge clk or negedge reset_n)
begin : cnu3_d_r
    if(!reset_n)
        cnu3_d <= #1 26'h0;
    else if((cycle == 2'b10) & !iter_0)
        cnu3_d <= #1 mem_out[2*D_WID+9:0];
end


always @ (posedge clk or negedge reset_n)
begin : cnu4_d_r
    if(!reset_n)
        cnu4_d <= #1 26'h0;
    else if((cycle == 2'b11) & !iter_0)
        cnu4_d <= #1 mem_out[4*D_WID+19:2*D_WID+10];
end

always @ (posedge clk or negedge reset_n)
begin : cnu5_d_r
    if(!reset_n)
        cnu5_d <= #1 26'h0;
    else if((cycle == 2'b11) & !iter_0)
        cnu5_d <= #1 mem_out[2*D_WID+9:0];
end

endmodule
