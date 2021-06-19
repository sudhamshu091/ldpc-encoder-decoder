module comp_cell(
    clk,
    reset_n,
    iter_0,
    lq6_in,
    lr_in,
    cnu_in,
    lq6_out,
    lr_out
);

//Parameter
parameter D_WID = 8;

//Input ports
input                 clk        ;
input                 reset_n    ;
input                 iter_0     ;
input  [6*D_WID-1:0]  lq6_in     ;
input  [2*D_WID+9:0]  lr_in      ;
input  [6:0]          cnu_in     ;

//Output ports
output [6*D_WID-1:0]  lq6_out    ;
output [2*D_WID+9:0]  lr_out     ;

reg    [D_WID-1:0]    lq0        ;
reg    [D_WID-1:0]    lq1        ;
reg    [D_WID-1:0]    lq2        ;
reg    [D_WID-1:0]    lq3        ;
reg    [D_WID-1:0]    lq4        ;
reg    [D_WID-1:0]    lq5        ;
reg    [D_WID-1:0]    lq0_dly    ;   
reg    [D_WID-1:0]    lq1_dly    ;   
reg    [D_WID-1:0]    lq2_dly    ;   
reg    [D_WID-1:0]    lq3_dly    ;   
reg    [D_WID-1:0]    lq4_dly    ;   
reg    [D_WID-1:0]    lq5_dly    ;   
reg                   sign_xor   ;
reg    [D_WID-1:0]    abs_less_lq ;
reg    [D_WID-1:0]    abs_least_lq;
reg    [2:0]          least_loc  ; 
reg  [2*D_WID+9:0]    compress_lr;

wire                  in_dly     ;
wire                  in_dly2    ;
wire                  in_dly3    ;
wire                  in_dly4    ;
wire                  in_dly5    ;
wire   [D_WID-1:0]    lq0_diff   ;
wire   [D_WID-1:0]    lq1_diff   ;
wire   [D_WID-1:0]    lq2_diff   ;
wire   [D_WID-1:0]    lq3_diff   ;
wire   [D_WID-1:0]    lq4_diff   ;
wire   [D_WID-1:0]    lq5_diff   ;  
wire   [D_WID-1:0]    lq0_sum    ;  
wire   [D_WID-1:0]    lq1_sum    ;  
wire   [D_WID-1:0]    lq2_sum    ;  
wire   [D_WID-1:0]    lq3_sum    ;  
wire   [D_WID-1:0]    lq4_sum    ;  
wire   [D_WID-1:0]    lq5_sum    ;
wire   [D_WID-1:0]    new_lr0    ;
wire   [D_WID-1:0]    new_lr1    ;
wire   [D_WID-1:0]    new_lr2    ;
wire   [D_WID-1:0]    new_lr3    ;
wire   [D_WID-1:0]    new_lr4    ;
wire   [D_WID-1:0]    new_lr5    ;  
wire   [D_WID-1:0]    abs_lq0    ;  
wire   [D_WID-1:0]    abs_lq1    ;  
wire   [D_WID-1:0]    abs_lq2    ;  
wire   [D_WID-1:0]    abs_lq3    ;  
wire   [D_WID-1:0]    abs_lq4    ;  
wire   [D_WID-1:0]    abs_lq5    ;  
wire                  com0_1     ;
wire                  com2_3     ;
wire                  com4_5     ;
wire   [D_WID-1:0]    less01     ;
wire   [D_WID-1:0]    less23     ;
wire   [D_WID-1:0]    less45     ;
wire   [D_WID-1:0]    more01     ;
wire   [D_WID-1:0]    more23     ;
wire   [D_WID-1:0]    more45     ;
wire   [2:0]          ind_less01 ;
wire   [2:0]          ind_less23 ;
wire   [2:0]          ind_less45 ;
wire   [2:0]          ind_more01 ;
wire   [2:0]          ind_more23 ;
wire   [2:0]          ind_more45 ;
wire                  com01_23   ;
wire   [D_WID-1:0]    more0123   ;
wire   [D_WID-1:0]    least0123  ;
wire   [2:0]          ind_least0123   ;
wire                  com01_0123 ;
wire                  com23_0123 ;
wire   [D_WID-1:0]    less0123   ;
wire   [2:0]          ind_less0123    ;
wire                  com0123_45      ;
wire   [D_WID-1:0]    least012345     ;
wire   [D_WID-1:0]    more012345      ;
wire   [2:0]          ind_least012345 ;                    
wire                  com0123_012345  ;
wire                  com45_012345    ;
wire   [D_WID-1:0]    less012345      ;
wire   [2:0]          ind_less012345  ;
wire   [D_WID:0]      less_lq_w  ;
wire   [D_WID:0]      least_lq_w ;
wire   [D_WID-1:0]    inv_less_lq;
wire   [D_WID-1:0]    inv_least_lq;  
wire                  sign_xor_w ;
wire   [D_WID-1:0]    lr0        ;
wire   [D_WID-1:0]    lr1        ;
wire   [D_WID-1:0]    lr2        ;
wire   [D_WID-1:0]    lr3        ;
wire   [D_WID-1:0]    lr4        ;
wire   [D_WID-1:0]    lr5        ;
wire   [D_WID-1:0]    inv_less_lr;    
wire   [D_WID-1:0]    inv_least_lr;
wire   [D_WID-1:0]    abs_less_lr;
wire   [D_WID-1:0]    abs_least_lr;   
wire                  lr0_sign   ;
wire                  lr1_sign   ;
wire                  lr2_sign   ;
wire                  lr3_sign   ;
wire                  lr4_sign   ;
wire                  lr5_sign   ;
wire                  sign_lr    ;
wire   [2:0]          lr_least_loc;

assign lq6_out = {lq0_dly,lq1_dly,lq2_dly,lq3_dly,lq4_dly,lq5_dly};
assign lr_out = {abs_least_lq, abs_less_lq, least_loc, sign_xor, lq0_dly[D_WID-1], lq1_dly[D_WID-1], lq2_dly[D_WID-1], lq3_dly[D_WID-1], lq4_dly[D_WID-1], lq5_dly[D_WID-1]};

assign lq0_diff = iter_0 ? lq0 : (lq0 - lr0);
assign lq1_diff = iter_0 ? lq1 : (lq1 - lr1);
assign lq2_diff = iter_0 ? lq2 : (lq2 - lr2);
assign lq3_diff = iter_0 ? lq3 : (lq3 - lr3);
assign lq4_diff = iter_0 ? lq4 : (lq4 - lr4);
assign lq5_diff = iter_0 ? lq5 : (lq5 - lr5);

assign {abs_least_lr, abs_less_lr, lr_least_loc, sign_lr, lr0_sign, lr1_sign, lr2_sign, lr3_sign, lr4_sign, lr5_sign} = compress_lr; 
assign inv_less_lr = ~abs_less_lr + 1'b1;
assign inv_least_lr = ~abs_least_lr + 1'b1;
assign lr0 = (lr_least_loc==3'h0) ? ((lr0_sign ^ sign_lr)? inv_less_lr : abs_less_lr ) : ((lr0_sign ^ sign_lr)? inv_least_lr : abs_least_lr ); 
assign lr1 = (lr_least_loc==3'h1) ? ((lr1_sign ^ sign_lr)? inv_less_lr : abs_less_lr ) : ((lr1_sign ^ sign_lr)? inv_least_lr : abs_least_lr ); 
assign lr2 = (lr_least_loc==3'h2) ? ((lr2_sign ^ sign_lr)? inv_less_lr : abs_less_lr ) : ((lr2_sign ^ sign_lr)? inv_least_lr : abs_least_lr ); 
assign lr3 = (lr_least_loc==3'h3) ? ((lr3_sign ^ sign_lr)? inv_less_lr : abs_less_lr ) : ((lr3_sign ^ sign_lr)? inv_least_lr : abs_least_lr ); 
assign lr4 = (lr_least_loc==3'h4) ? ((lr4_sign ^ sign_lr)? inv_less_lr : abs_less_lr ) : ((lr4_sign ^ sign_lr)? inv_least_lr : abs_least_lr ); 
assign lr5 = (lr_least_loc==3'h5) ? ((lr5_sign ^ sign_lr)? inv_less_lr : abs_less_lr ) : ((lr5_sign ^ sign_lr)? inv_least_lr : abs_least_lr ); 


assign  in_dly  =  cnu_in[2] ;
assign  in_dly2 =  cnu_in[3] ;
assign  in_dly3 =  cnu_in[4] ;
assign  in_dly4 =  cnu_in[5] ;
assign  in_dly5 =  cnu_in[6] ;

always @ (posedge clk or negedge reset_n)
begin : lr_r
    if(!reset_n) 
        compress_lr <= #1 {(2*D_WID+10){1'b0}};
    else if(cnu_in[1]) 
        compress_lr <= #1 lr_in;
end
        
always @ (posedge clk or negedge reset_n)
begin : lq_r
    if(!reset_n) begin
        lq0 <= #1 {D_WID{1'b0}};
        lq1 <= #1 {D_WID{1'b0}};
        lq2 <= #1 {D_WID{1'b0}};
        lq3 <= #1 {D_WID{1'b0}};
        lq4 <= #1 {D_WID{1'b0}};
        lq5 <= #1 {D_WID{1'b0}};
        end
    else if(cnu_in[1]) begin
        lq0 <= #1 lq6_in[6*D_WID-1:5*D_WID];
        lq1 <= #1 lq6_in[5*D_WID-1:4*D_WID];
        lq2 <= #1 lq6_in[4*D_WID-1:3*D_WID];
        lq3 <= #1 lq6_in[3*D_WID-1:2*D_WID];
        lq4 <= #1 lq6_in[2*D_WID-1:  D_WID];
        lq5 <= #1 lq6_in[  D_WID-1:0];
        end
    else if(in_dly) begin
        lq0 <= #1 lq0_diff;
        lq1 <= #1 lq1_diff;
        lq2 <= #1 lq2_diff;
        lq3 <= #1 lq3_diff;
        lq4 <= #1 lq4_diff;
        lq5 <= #1 lq5_diff;
        end
//    else if(in_dly2) begin
//              
//        end
    else ;
end

// Lrij Sign (Lq) and Minimum Value
// Sign bit
assign sign_xor_w = lq0[D_WID-1] ^ lq1[D_WID-1] ^ lq2[D_WID-1] ^ lq3[D_WID-1] ^ lq4[D_WID-1] ^ lq5[D_WID-1];

// Absolute value   
assign abs_lq0 = lq0[D_WID-1] ? (~lq0 + 1'b1) : lq0;
assign abs_lq1 = lq1[D_WID-1] ? (~lq1 + 1'b1) : lq1;
assign abs_lq2 = lq2[D_WID-1] ? (~lq2 + 1'b1) : lq2;
assign abs_lq3 = lq3[D_WID-1] ? (~lq3 + 1'b1) : lq3;
assign abs_lq4 = lq4[D_WID-1] ? (~lq4 + 1'b1) : lq4;
assign abs_lq5 = lq5[D_WID-1] ? (~lq5 + 1'b1) : lq5;

// L1,L2 finder current leave 2 cycles for L1,L2 finder
// Compare 2 group
assign com0_1      = abs_lq0 > abs_lq1;
assign com2_3      = abs_lq2 > abs_lq3;
assign com4_5      = abs_lq4 > abs_lq5;

// Keep more, less, index value
assign less01      = com0_1 ? abs_lq1 : abs_lq0 ;
assign less23      = com2_3 ? abs_lq3 : abs_lq2 ;
assign less45      = com4_5 ? abs_lq5 : abs_lq4 ;
assign more01      = com0_1 ? abs_lq0 : abs_lq1 ;
assign more23      = com2_3 ? abs_lq2 : abs_lq3 ;
assign more45      = com4_5 ? abs_lq4 : abs_lq5 ;
assign ind_less01  = com0_1 ? 3'h1    : 3'h0    ;
assign ind_less23  = com2_3 ? 3'h3    : 3'h2    ;
assign ind_less45  = com4_5 ? 3'h5    : 3'h4    ;
assign ind_more01  = com0_1 ? 3'h0    : 3'h1    ; 
assign ind_more23  = com2_3 ? 3'h2    : 3'h3    ; 
assign ind_more45  = com4_5 ? 3'h4    : 3'h5    ; 

// 01 vs 23 comparsion
assign com01_23      = less01   > less23;
assign more0123      = com01_23 ? less01 : less23;
assign least0123     = com01_23 ? less23 : less01;
assign ind_least0123 = com01_23 ? ind_less23 : ind_less01 ;

assign com01_0123    = less01     > more23;
assign com23_0123    = less23     > more01;
assign less0123      = com01_23 ? (com01_0123 ? more23 : less01) : (com23_0123 ? more01 : less23);
assign ind_less0123  = com23_0123 ? (com01_0123 ? ind_more23 : ind_less01 ) : (com23_0123 ? ind_more01 : ind_less23 );

// 0123 vs 45 comparsion
assign com0123_45      = least0123 > less45 ;
assign least012345     = com0123_45 ? less45 : least0123;
assign more012345      = com0123_45 ? least0123 : less45;
assign ind_least012345 = com0123_45 ? ind_less45 : ind_least0123;

assign com0123_012345  = least0123 > more45;
assign com45_012345    = less45 > less0123;
assign less012345      = com0123_45 ? ( com0123_012345 ? more45 : least0123 ) : ( com45_012345 ? less0123 : less45 );
assign ind_less012345  = com0123_45 ? ( com0123_012345 ? ind_more45 : ind_least0123) : (com45_012345 ? ind_less0123 : ind_less45 );

// compress lr information
assign less_lq_w  = {1'b0, abs_less_lq[D_WID-2:0]} + {3'b0, abs_less_lq[D_WID-4:2]} + 1'b1;
assign least_lq_w = {1'b0,abs_least_lq[D_WID-2:0]} + {3'b0,abs_least_lq[D_WID-4:2]} + 1'b1; 

always @ (posedge clk or negedge reset_n)
begin : lq_less_r
    if(!reset_n) begin
        abs_less_lq  <= #1 {D_WID{1'b0}};
        abs_least_lq <= #1 {D_WID{1'b0}};
        least_loc    <= #1 3'h0;
        sign_xor     <= #1 1'b0;
        end
    else if(in_dly2) begin
        abs_less_lq  <= #1 less012345;
        abs_least_lq <= #1 least012345;
        least_loc    <= #1 ind_least012345;
        sign_xor     <= #1 sign_xor_w;
        end
    else if(in_dly3) begin
        abs_less_lq  <= #1 less_lq_w[D_WID:1];
        abs_least_lq <= #1 least_lq_w[D_WID:1];
        end
end

assign inv_less_lq = ~abs_less_lq + 1'b1;
assign inv_least_lq = ~abs_least_lq + 1'b1;

assign new_lr0 = (least_loc==3'h0) ? ((lq0_dly[D_WID-1]^sign_xor) ? inv_less_lq : abs_less_lq ) : ((lq0_dly[D_WID-1]^sign_xor) ? inv_least_lq : abs_least_lq );
assign new_lr1 = (least_loc==3'h1) ? ((lq1_dly[D_WID-1]^sign_xor) ? inv_less_lq : abs_less_lq ) : ((lq1_dly[D_WID-1]^sign_xor) ? inv_least_lq : abs_least_lq );
assign new_lr2 = (least_loc==3'h2) ? ((lq2_dly[D_WID-1]^sign_xor) ? inv_less_lq : abs_less_lq ) : ((lq2_dly[D_WID-1]^sign_xor) ? inv_least_lq : abs_least_lq );
assign new_lr3 = (least_loc==3'h3) ? ((lq3_dly[D_WID-1]^sign_xor) ? inv_less_lq : abs_less_lq ) : ((lq3_dly[D_WID-1]^sign_xor) ? inv_least_lq : abs_least_lq );
assign new_lr4 = (least_loc==3'h4) ? ((lq4_dly[D_WID-1]^sign_xor) ? inv_less_lq : abs_less_lq ) : ((lq4_dly[D_WID-1]^sign_xor) ? inv_least_lq : abs_least_lq );
assign new_lr5 = (least_loc==3'h5) ? ((lq5_dly[D_WID-1]^sign_xor) ? inv_less_lq : abs_less_lq ) : ((lq5_dly[D_WID-1]^sign_xor) ? inv_least_lq : abs_least_lq );
assign lq0_sum = lq0_dly + new_lr0;
assign lq1_sum = lq1_dly + new_lr1;
assign lq2_sum = lq2_dly + new_lr2;
assign lq3_sum = lq3_dly + new_lr3;
assign lq4_sum = lq4_dly + new_lr4;
assign lq5_sum = lq5_dly + new_lr5;

always @ (posedge clk or negedge reset_n)
begin : lq_dly_r
    if(!reset_n) begin
        lq0_dly <= #1 {D_WID{1'b0}};
        lq1_dly <= #1 {D_WID{1'b0}};
        lq2_dly <= #1 {D_WID{1'b0}};
        lq3_dly <= #1 {D_WID{1'b0}};
        lq4_dly <= #1 {D_WID{1'b0}};
        lq5_dly <= #1 {D_WID{1'b0}};
        end 
    else if(in_dly3) begin
        lq0_dly <= #1 lq0;
        lq1_dly <= #1 lq1;
        lq2_dly <= #1 lq2;
        lq3_dly <= #1 lq3;
        lq4_dly <= #1 lq4;
        lq5_dly <= #1 lq5;
        end
    else if(in_dly4) begin
        lq0_dly <= #1 lq0_sum;
        lq1_dly <= #1 lq1_sum;
        lq2_dly <= #1 lq2_sum;
        lq3_dly <= #1 lq3_sum;
        lq4_dly <= #1 lq4_sum;
        lq5_dly <= #1 lq5_sum;
        end        
end
        

endmodule
