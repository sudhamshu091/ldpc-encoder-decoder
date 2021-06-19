module data_cell2(
    clk,
    reset_n,
    fsm,
    sin,
    din,
    vtc_en,
    dvtc_a,
    dvtc_b,
    dvtc_c,
    d_last,

    ram_d
);

parameter D_WID = 8;

input                 clk        ;
input                 reset_n    ;
input   [D_WID-1:0]   din        ; // LLR input
input                 sin        ;
input   [3:0]         fsm        ;
input   [2:0]         vtc_en     ;
input   [D_WID-1:0]   dvtc_a     ;
input   [D_WID-1:0]   dvtc_b     ;
input   [D_WID-1:0]   dvtc_c     ;
input   [D_WID-1:0]   d_last     ;

output  [D_WID-1:0]   ram_d      ;
reg     [D_WID-1:0]   ram_d      ;

wire    [D_WID-1:0]   temp1      ;
wire    [D_WID-1:0]   temp2      ;
wire    [D_WID-1:0]   temp3      ;

assign temp1 = dvtc_a - d_last ;
assign temp2 = dvtc_b - d_last ;
assign temp3 = dvtc_c + temp1 + temp2; 

always @ (posedge clk or negedge reset_n)
begin : ram_d_r
    if(!reset_n)
        ram_d <= #1 {D_WID{1'b0}};
    else if(fsm[1] & sin) 
        ram_d <= #1 din;
    else if(fsm[2]) begin
//        if(vtc_en[0])
//        ram_d <= #1 dvtc_a;
//        if(vtc_en[1])
//        ram_d <= #1 dvtc_b;
        if(vtc_en[0]) 
        ram_d <= #1 temp3; 
        end
end    

endmodule