//Module
module ldpc(
    clk,
    reset_n,
    data_in,
    sync_in,
    rate,
    max_iter,
    
    data_out,
    sync_out,
    busy,
    num_iter
);

//Parameter
parameter D_WID = 8;
parameter A_WID = 8;

//Input ports
input                 clk        ;
input                 reset_n    ;
input                 rate       ; // 0, 1/2 1, 3/4
input   [D_WID-3:0]   data_in    ; // LLR input
input                 sync_in    ;
input   [4:0]         max_iter   ;

//Output ports
output               data_out   ; 
output               sync_out   ;
output               busy       ; // ldpc is running
//output               finish     ; // ldpc decoder finish, can read new data
output  [4:0]        num_iter   ; // iteration number

//Internal Register and Wire definition

wire    [A_WID-1:0]   wr_addr00  ;
wire    [A_WID-1:0]   wr_addr01  ;
wire    [A_WID-1:0]   wr_addr02  ;
wire    [A_WID-1:0]   wr_addr03  ;
wire    [A_WID-1:0]   wr_addr04  ;
wire    [A_WID-1:0]   wr_addr05  ;
wire    [A_WID-1:0]   wr_addr06  ;
wire    [A_WID-1:0]   wr_addr07  ;
wire    [A_WID-1:0]   wr_addr08  ;
wire    [A_WID-1:0]   wr_addr09  ;
wire    [A_WID-1:0]   wr_addr10  ;
wire    [A_WID-1:0]   wr_addr11  ;
wire    [A_WID-1:0]   wr_addr12  ;
wire    [A_WID-1:0]   wr_addr13  ;
wire    [A_WID-1:0]   wr_addr14  ;
wire    [A_WID-1:0]   wr_addr15  ;
wire    [A_WID-1:0]   wr_addr16  ;
wire    [A_WID-1:0]   wr_addr17  ;
wire    [A_WID-1:0]   wr_addr18  ;
wire    [A_WID-1:0]   wr_addr19  ;
wire    [A_WID-1:0]   wr_addr20  ;
wire    [A_WID-1:0]   wr_addr21  ;
wire    [A_WID-1:0]   wr_addr22  ;
wire    [A_WID-1:0]   wr_addr23  ;
wire    [A_WID-1:0]   wr_addr24  ;
wire    [A_WID-1:0]   wr_addr25  ;
wire    [A_WID-1:0]   wr_addr26  ;
wire    [A_WID-1:0]   wr_addr27  ;
wire    [A_WID-1:0]   wr_addr28  ;
wire    [A_WID-1:0]   wr_addr29  ;
wire    [A_WID-1:0]   wr_addr30  ;
wire    [A_WID-1:0]   wr_addr31  ;
wire    [A_WID-1:0]   wr_addr32  ;
wire    [A_WID-1:0]   wr_addr33  ;
wire    [A_WID-1:0]   wr_addr34  ;
wire    [A_WID-1:0]   wr_addr35  ;
wire    [A_WID-1:0]   rd_addr00  ;
wire    [A_WID-1:0]   rd_addr01  ;
wire    [A_WID-1:0]   rd_addr02  ;
wire    [A_WID-1:0]   rd_addr03  ;
wire    [A_WID-1:0]   rd_addr04  ;
wire    [A_WID-1:0]   rd_addr05  ;
wire    [A_WID-1:0]   rd_addr06  ;
wire    [A_WID-1:0]   rd_addr07  ;
wire    [A_WID-1:0]   rd_addr08  ;
wire    [A_WID-1:0]   rd_addr09  ;
wire    [A_WID-1:0]   rd_addr10  ;
wire    [A_WID-1:0]   rd_addr11  ;
wire    [A_WID-1:0]   rd_addr12  ;
wire    [A_WID-1:0]   rd_addr13  ;
wire    [A_WID-1:0]   rd_addr14  ;
wire    [A_WID-1:0]   rd_addr15  ;
wire    [A_WID-1:0]   rd_addr16  ;
wire    [A_WID-1:0]   rd_addr17  ;
wire    [A_WID-1:0]   rd_addr18  ;
wire    [A_WID-1:0]   rd_addr19  ;
wire    [A_WID-1:0]   rd_addr20  ;
wire    [A_WID-1:0]   rd_addr21  ;
wire    [A_WID-1:0]   rd_addr22  ;
wire    [A_WID-1:0]   rd_addr23  ;
wire    [A_WID-1:0]   rd_addr24  ;
wire    [A_WID-1:0]   rd_addr25  ;
wire    [A_WID-1:0]   rd_addr26  ;
wire    [A_WID-1:0]   rd_addr27  ;
wire    [A_WID-1:0]   rd_addr28  ;
wire    [A_WID-1:0]   rd_addr29  ;
wire    [A_WID-1:0]   rd_addr30  ;
wire    [A_WID-1:0]   rd_addr31  ;
wire    [A_WID-1:0]   rd_addr32  ;
wire    [A_WID-1:0]   rd_addr33  ;
wire    [A_WID-1:0]   rd_addr34  ;
wire    [A_WID-1:0]   rd_addr35  ;
wire                  wr00       ;
wire                  wr01       ;
wire                  wr02       ;
wire                  wr03       ;
wire                  wr04       ;
wire                  wr05       ;
wire                  wr06       ;
wire                  wr07       ;
wire                  wr08       ;
wire                  wr09       ;
wire                  wr10       ;
wire                  wr11       ;
wire                  wr12       ;
wire                  wr13       ;
wire                  wr14       ;
wire                  wr15       ;
wire                  wr16       ;
wire                  wr17       ;
wire                  wr18       ;
wire                  wr19       ;
wire                  wr20       ;
wire                  wr21       ;
wire                  wr22       ;
wire                  wr23       ;
wire                  wr24       ;
wire                  wr25       ;
wire                  wr26       ;
wire                  wr27       ;
wire                  wr28       ;
wire                  wr29       ;
wire                  wr30       ;
wire                  wr31       ;
wire                  wr32       ;
wire                  wr33       ;
wire                  wr34       ;
wire                  wr35       ;
wire    [D_WID-1:0]   din00      ;
wire    [D_WID-1:0]   din01      ;
wire    [D_WID-1:0]   din02      ;
wire    [D_WID-1:0]   din03      ;
wire    [D_WID-1:0]   din04      ;
wire    [D_WID-1:0]   din05      ;
wire    [D_WID-1:0]   din06      ;
wire    [D_WID-1:0]   din07      ;
wire    [D_WID-1:0]   din08      ;
wire    [D_WID-1:0]   din09      ;
wire    [D_WID-1:0]   din10      ;
wire    [D_WID-1:0]   din11      ;
wire    [D_WID-1:0]   din12      ;
wire    [D_WID-1:0]   din13      ;
wire    [D_WID-1:0]   din14      ;
wire    [D_WID-1:0]   din15      ;
wire    [D_WID-1:0]   din16      ;
wire    [D_WID-1:0]   din17      ;
wire    [D_WID-1:0]   din18      ;
wire    [D_WID-1:0]   din19      ;
wire    [D_WID-1:0]   din20      ;
wire    [D_WID-1:0]   din21      ;
wire    [D_WID-1:0]   din22      ;
wire    [D_WID-1:0]   din23      ;
wire    [D_WID-1:0]   din24      ;
wire    [D_WID-1:0]   din25      ;
wire    [D_WID-1:0]   din26      ;
wire    [D_WID-1:0]   din27      ;
wire    [D_WID-1:0]   din28      ;
wire    [D_WID-1:0]   din29      ;
wire    [D_WID-1:0]   din30      ;
wire    [D_WID-1:0]   din31      ;
wire    [D_WID-1:0]   din32      ;
wire    [D_WID-1:0]   din33      ;
wire    [D_WID-1:0]   din34      ;
wire    [D_WID-1:0]   din35      ;
wire    [D_WID-1:0]   dout00     ;
wire    [D_WID-1:0]   dout01     ;
wire    [D_WID-1:0]   dout02     ;
wire    [D_WID-1:0]   dout03     ;
wire    [D_WID-1:0]   dout04     ;
wire    [D_WID-1:0]   dout05     ;
wire    [D_WID-1:0]   dout06     ;
wire    [D_WID-1:0]   dout07     ;
wire    [D_WID-1:0]   dout08     ;
wire    [D_WID-1:0]   dout09     ;
wire    [D_WID-1:0]   dout10     ;
wire    [D_WID-1:0]   dout11     ;
wire    [D_WID-1:0]   dout12     ;
wire    [D_WID-1:0]   dout13     ;
wire    [D_WID-1:0]   dout14     ;
wire    [D_WID-1:0]   dout15     ;
wire    [D_WID-1:0]   dout16     ;
wire    [D_WID-1:0]   dout17     ;
wire    [D_WID-1:0]   dout18     ;
wire    [D_WID-1:0]   dout19     ;
wire    [D_WID-1:0]   dout20     ;
wire    [D_WID-1:0]   dout21     ;
wire    [D_WID-1:0]   dout22     ;
wire    [D_WID-1:0]   dout23     ;
wire    [D_WID-1:0]   dout24     ;
wire    [D_WID-1:0]   dout25     ;
wire    [D_WID-1:0]   dout26     ;
wire    [D_WID-1:0]   dout27     ;
wire    [D_WID-1:0]   dout28     ;
wire    [D_WID-1:0]   dout29     ;
wire    [D_WID-1:0]   dout30     ;
wire    [D_WID-1:0]   dout31     ;
wire    [D_WID-1:0]   dout32     ;
wire    [D_WID-1:0]   dout33     ;
wire    [D_WID-1:0]   dout34     ;
wire    [D_WID-1:0]   dout35     ;
//wire    [D_WID-1:0]   dctv00     ;
//wire    [D_WID-1:0]   dctv01     ;
//wire    [D_WID-1:0]   dctv02     ;
//wire    [D_WID-1:0]   dctv03     ;
//wire    [D_WID-1:0]   dctv04     ;
//wire    [D_WID-1:0]   dctv05     ;
//wire    [D_WID-1:0]   dctv06     ;
//wire    [D_WID-1:0]   dctv07     ;
//wire    [D_WID-1:0]   dctv08     ;
//wire    [D_WID-1:0]   dctv09     ;
//wire    [D_WID-1:0]   dctv10     ;
//wire    [D_WID-1:0]   dctv11     ;
//wire    [D_WID-1:0]   dctv12     ;
//wire    [D_WID-1:0]   dctv13     ;
//wire    [D_WID-1:0]   dctv14     ;
//wire    [D_WID-1:0]   dctv15     ;
//wire    [D_WID-1:0]   dctv16     ;
//wire    [D_WID-1:0]   dctv17     ;
//wire    [D_WID-1:0]   dctv18     ;
//wire    [D_WID-1:0]   dctv19     ;
//wire    [D_WID-1:0]   dctv20     ;
//wire    [D_WID-1:0]   dctv21     ;
//wire    [D_WID-1:0]   dctv22     ;
//wire    [D_WID-1:0]   dctv23     ;
//wire    [D_WID-1:0]   dctv24     ;
//wire    [D_WID-1:0]   dctv25     ;
//wire    [D_WID-1:0]   dctv26     ;
//wire    [D_WID-1:0]   dctv27     ;
//wire    [D_WID-1:0]   dctv28     ;
//wire    [D_WID-1:0]   dctv29     ;
//wire    [D_WID-1:0]   dctv30     ;
//wire    [D_WID-1:0]   dctv31     ;
//wire    [D_WID-1:0]   dctv32     ;
//wire    [D_WID-1:0]   dctv33     ;
//wire    [D_WID-1:0]   dctv34     ;
//wire    [D_WID-1:0]   dctv35     ;
wire    [A_WID+1:0]   rd_addr    ;
wire    [A_WID+1:0]   wr_addr    ;
wire                  wr0        ;
wire    [3:0]         cycle      ;
wire                  ctv_out    ;
wire   [4*D_WID+19:0] mem0_in    ;   
wire   [4*D_WID+19:0] mem1_in    ;   
wire   [4*D_WID+19:0] mem2_in    ;   
wire   [4*D_WID+19:0] mem0_out   ;   
wire   [4*D_WID+19:0] mem1_out   ;   
wire   [4*D_WID+19:0] mem2_out   ;   
wire                  sigma_vnu  ;
wire     [35:0]       out_sel    ;
wire                  out_en     ;

reg     [35:0]        sync_dly   ;
reg     [D_WID-1:0]   data_dly   ;
reg     [5:0]         sync_count ;
reg                   data_out   ;
reg                   sync_out   ;
reg                   dec_out    ;
reg      [35:0]       out_sel_dly;  
reg                   out_en_dly ;  

wire    [3:0]         fsm        ;
wire                  sync_in6   ;

assign sync_in6 = (sync_count == 6'h0) & sync_in;

always @ (posedge clk or negedge reset_n)
begin : sync_count_r
    if(!reset_n)
        sync_count <= #1 6'h0;
    else if(sync_in)
    begin if(sync_count == 6'd35)
        sync_count <= #1 6'h0;
        else
        sync_count <= #1 sync_count + 1'b1;
    end
end

always @ (posedge clk or negedge reset_n)
begin : sync_dly_r
    if(!reset_n)
        sync_dly <= #1 36'h0;
    else if(sync_in)
        sync_dly <= #1 { sync_dly[34:0],sync_in6 };
    else
        sync_dly <= #1 36'h0;
end

always @ (posedge clk or negedge reset_n)
begin : data_dly_r
    if(!reset_n)
        data_dly <= #1 {D_WID{1'b0}};
    else
        data_dly <= #1 {{2{data_in[D_WID-3]}},data_in};
end

always @ (posedge clk or negedge reset_n)
begin : out_sel_d
    if(!reset_n)
        out_sel_dly <= #1 36'h0;
    else
        out_sel_dly <= #1 out_sel;
end

always @ (posedge clk or negedge reset_n)
begin : out_en_d
    if(!reset_n)
        out_en_dly <= #1 1'b0;
    else
        out_en_dly <= #1 out_en;
end 

always @ (posedge clk or negedge reset_n)
begin : sync_r
    if(!reset_n)
        sync_out <= #1 1'b0;
    else
        sync_out <= #1 out_en_dly;
end
        
always @ (posedge clk or negedge reset_n)
begin : data_r
    if(!reset_n)
        data_out <= #1 1'b0;
    else if(out_en_dly)
        data_out <= #1 dec_out;
end

always @ (*)
case(out_sel_dly)
36'h0_0000_0001: dec_out = dout00[D_WID-1];
36'h0_0000_0002: dec_out = dout01[D_WID-1];
36'h0_0000_0004: dec_out = dout02[D_WID-1];
36'h0_0000_0008: dec_out = dout03[D_WID-1];
36'h0_0000_0010: dec_out = dout04[D_WID-1];
36'h0_0000_0020: dec_out = dout05[D_WID-1];
36'h0_0000_0040: dec_out = dout06[D_WID-1];
36'h0_0000_0080: dec_out = dout07[D_WID-1];
36'h0_0000_0100: dec_out = dout08[D_WID-1];
36'h0_0000_0200: dec_out = dout09[D_WID-1];
36'h0_0000_0400: dec_out = dout10[D_WID-1];
36'h0_0000_0800: dec_out = dout11[D_WID-1];
36'h0_0000_1000: dec_out = dout12[D_WID-1];
36'h0_0000_2000: dec_out = dout13[D_WID-1];
36'h0_0000_4000: dec_out = dout14[D_WID-1];
36'h0_0000_8000: dec_out = dout15[D_WID-1];
36'h0_0001_0000: dec_out = dout16[D_WID-1];
36'h0_0002_0000: dec_out = dout17[D_WID-1];
36'h0_0004_0000: dec_out = dout18[D_WID-1];
36'h0_0008_0000: dec_out = dout19[D_WID-1];
36'h0_0010_0000: dec_out = dout20[D_WID-1];
36'h0_0020_0000: dec_out = dout21[D_WID-1];
36'h0_0040_0000: dec_out = dout22[D_WID-1];
36'h0_0080_0000: dec_out = dout23[D_WID-1];
36'h0_0100_0000: dec_out = dout24[D_WID-1];
36'h0_0200_0000: dec_out = dout25[D_WID-1];
36'h0_0400_0000: dec_out = dout26[D_WID-1];
36'h0_0800_0000: dec_out = dout27[D_WID-1];
36'h0_1000_0000: dec_out = dout28[D_WID-1];
36'h0_2000_0000: dec_out = dout29[D_WID-1];
36'h0_4000_0000: dec_out = dout30[D_WID-1];
36'h0_8000_0000: dec_out = dout31[D_WID-1];
36'h1_0000_0000: dec_out = dout32[D_WID-1];
36'h2_0000_0000: dec_out = dout33[D_WID-1];
36'h4_0000_0000: dec_out = dout34[D_WID-1];
36'h8_0000_0000: dec_out = dout35[D_WID-1];
default: dec_out = 1'b0;
endcase
        
//vtc_cell cel_00(.clk(clk),.reset_n(reset_n),.sin(sync_dly[ 0]),.din(data_dly),.fsm(fsm),.rate(rate),.cycle(cycle),.wr_addr(wr_addr00),.rd_addr(),.ram_wr(wr00),.ram_d(),.dctv(dctv00));
//vtc_cell cel_01(.clk(clk),.reset_n(reset_n),.sin(sync_dly[ 1]),.din(data_dly),.fsm(fsm),.rate(rate),.cycle(cycle),.wr_addr(wr_addr01),.rd_addr(),.ram_wr(wr01),.ram_d(),.dctv(dctv01));
//vtc_cell cel_02(.clk(clk),.reset_n(reset_n),.sin(sync_dly[ 2]),.din(data_dly),.fsm(fsm),.rate(rate),.cycle(cycle),.wr_addr(wr_addr02),.rd_addr(),.ram_wr(wr02),.ram_d(),.dctv(dctv02));
//vtc_cell cel_03(.clk(clk),.reset_n(reset_n),.sin(sync_dly[ 3]),.din(data_dly),.fsm(fsm),.rate(rate),.cycle(cycle),.wr_addr(wr_addr03),.rd_addr(),.ram_wr(wr03),.ram_d(),.dctv(dctv03));
//vtc_cell cel_04(.clk(clk),.reset_n(reset_n),.sin(sync_dly[ 4]),.din(data_dly),.fsm(fsm),.rate(rate),.cycle(cycle),.wr_addr(wr_addr04),.rd_addr(),.ram_wr(wr04),.ram_d(),.dctv(dctv04));
//vtc_cell cel_05(.clk(clk),.reset_n(reset_n),.sin(sync_dly[ 5]),.din(data_dly),.fsm(fsm),.rate(rate),.cycle(cycle),.wr_addr(wr_addr05),.rd_addr(),.ram_wr(wr05),.ram_d(),.dctv(dctv05));
//vtc_cell cel_06(.clk(clk),.reset_n(reset_n),.sin(sync_dly[ 6]),.din(data_dly),.fsm(fsm),.rate(rate),.cycle(cycle),.wr_addr(wr_addr06),.rd_addr(),.ram_wr(wr06),.ram_d(),.dctv(dctv06));
//vtc_cell cel_07(.clk(clk),.reset_n(reset_n),.sin(sync_dly[ 7]),.din(data_dly),.fsm(fsm),.rate(rate),.cycle(cycle),.wr_addr(wr_addr07),.rd_addr(),.ram_wr(wr07),.ram_d(),.dctv(dctv07));
//vtc_cell cel_08(.clk(clk),.reset_n(reset_n),.sin(sync_dly[ 8]),.din(data_dly),.fsm(fsm),.rate(rate),.cycle(cycle),.wr_addr(wr_addr08),.rd_addr(),.ram_wr(wr08),.ram_d(),.dctv(dctv08));
//vtc_cell cel_09(.clk(clk),.reset_n(reset_n),.sin(sync_dly[ 9]),.din(data_dly),.fsm(fsm),.rate(rate),.cycle(cycle),.wr_addr(wr_addr09),.rd_addr(),.ram_wr(wr09),.ram_d(),.dctv(dctv09));
//vtc_cell cel_10(.clk(clk),.reset_n(reset_n),.sin(sync_dly[10]),.din(data_dly),.fsm(fsm),.rate(rate),.cycle(cycle),.wr_addr(wr_addr10),.rd_addr(),.ram_wr(wr10),.ram_d(),.dctv(dctv10));
//vtc_cell cel_11(.clk(clk),.reset_n(reset_n),.sin(sync_dly[11]),.din(data_dly),.fsm(fsm),.rate(rate),.cycle(cycle),.wr_addr(wr_addr11),.rd_addr(),.ram_wr(wr11),.ram_d(),.dctv(dctv11));
//vtc_cell cel_12(.clk(clk),.reset_n(reset_n),.sin(sync_dly[12]),.din(data_dly),.fsm(fsm),.rate(rate),.cycle(cycle),.wr_addr(wr_addr12),.rd_addr(),.ram_wr(wr12),.ram_d(),.dctv(dctv12));
//vtc_cell cel_13(.clk(clk),.reset_n(reset_n),.sin(sync_dly[13]),.din(data_dly),.fsm(fsm),.rate(rate),.cycle(cycle),.wr_addr(wr_addr13),.rd_addr(),.ram_wr(wr13),.ram_d(),.dctv(dctv13));
//vtc_cell cel_14(.clk(clk),.reset_n(reset_n),.sin(sync_dly[14]),.din(data_dly),.fsm(fsm),.rate(rate),.cycle(cycle),.wr_addr(wr_addr14),.rd_addr(),.ram_wr(wr14),.ram_d(),.dctv(dctv14));
//vtc_cell cel_15(.clk(clk),.reset_n(reset_n),.sin(sync_dly[15]),.din(data_dly),.fsm(fsm),.rate(rate),.cycle(cycle),.wr_addr(wr_addr15),.rd_addr(),.ram_wr(wr15),.ram_d(),.dctv(dctv15));
//vtc_cell cel_16(.clk(clk),.reset_n(reset_n),.sin(sync_dly[16]),.din(data_dly),.fsm(fsm),.rate(rate),.cycle(cycle),.wr_addr(wr_addr16),.rd_addr(),.ram_wr(wr16),.ram_d(),.dctv(dctv16));
//vtc_cell cel_17(.clk(clk),.reset_n(reset_n),.sin(sync_dly[17]),.din(data_dly),.fsm(fsm),.rate(rate),.cycle(cycle),.wr_addr(wr_addr17),.rd_addr(),.ram_wr(wr17),.ram_d(),.dctv(dctv17));
//vtc_cell cel_18(.clk(clk),.reset_n(reset_n),.sin(sync_dly[18]),.din(data_dly),.fsm(fsm),.rate(rate),.cycle(cycle),.wr_addr(wr_addr18),.rd_addr(),.ram_wr(wr18),.ram_d(),.dctv(dctv18));
//vtc_cell cel_19(.clk(clk),.reset_n(reset_n),.sin(sync_dly[19]),.din(data_dly),.fsm(fsm),.rate(rate),.cycle(cycle),.wr_addr(wr_addr19),.rd_addr(),.ram_wr(wr19),.ram_d(),.dctv(dctv19));
//vtc_cell cel_20(.clk(clk),.reset_n(reset_n),.sin(sync_dly[20]),.din(data_dly),.fsm(fsm),.rate(rate),.cycle(cycle),.wr_addr(wr_addr20),.rd_addr(),.ram_wr(wr20),.ram_d(),.dctv(dctv20));
//vtc_cell cel_21(.clk(clk),.reset_n(reset_n),.sin(sync_dly[21]),.din(data_dly),.fsm(fsm),.rate(rate),.cycle(cycle),.wr_addr(wr_addr21),.rd_addr(),.ram_wr(wr21),.ram_d(),.dctv(dctv21));
//vtc_cell cel_22(.clk(clk),.reset_n(reset_n),.sin(sync_dly[22]),.din(data_dly),.fsm(fsm),.rate(rate),.cycle(cycle),.wr_addr(wr_addr22),.rd_addr(),.ram_wr(wr22),.ram_d(),.dctv(dctv22));
//vtc_cell cel_23(.clk(clk),.reset_n(reset_n),.sin(sync_dly[23]),.din(data_dly),.fsm(fsm),.rate(rate),.cycle(cycle),.wr_addr(wr_addr23),.rd_addr(),.ram_wr(wr23),.ram_d(),.dctv(dctv23));
//vtc_cell cel_24(.clk(clk),.reset_n(reset_n),.sin(sync_dly[24]),.din(data_dly),.fsm(fsm),.rate(rate),.cycle(cycle),.wr_addr(wr_addr24),.rd_addr(),.ram_wr(wr24),.ram_d(),.dctv(dctv24));
//vtc_cell cel_25(.clk(clk),.reset_n(reset_n),.sin(sync_dly[25]),.din(data_dly),.fsm(fsm),.rate(rate),.cycle(cycle),.wr_addr(wr_addr25),.rd_addr(),.ram_wr(wr25),.ram_d(),.dctv(dctv25));
//vtc_cell cel_26(.clk(clk),.reset_n(reset_n),.sin(sync_dly[26]),.din(data_dly),.fsm(fsm),.rate(rate),.cycle(cycle),.wr_addr(wr_addr26),.rd_addr(),.ram_wr(wr26),.ram_d(),.dctv(dctv26));
//vtc_cell cel_27(.clk(clk),.reset_n(reset_n),.sin(sync_dly[27]),.din(data_dly),.fsm(fsm),.rate(rate),.cycle(cycle),.wr_addr(wr_addr27),.rd_addr(),.ram_wr(wr27),.ram_d(),.dctv(dctv27));
//vtc_cell cel_28(.clk(clk),.reset_n(reset_n),.sin(sync_dly[28]),.din(data_dly),.fsm(fsm),.rate(rate),.cycle(cycle),.wr_addr(wr_addr28),.rd_addr(),.ram_wr(wr28),.ram_d(),.dctv(dctv28));
//vtc_cell cel_29(.clk(clk),.reset_n(reset_n),.sin(sync_dly[29]),.din(data_dly),.fsm(fsm),.rate(rate),.cycle(cycle),.wr_addr(wr_addr29),.rd_addr(),.ram_wr(wr29),.ram_d(),.dctv(dctv29));
//vtc_cell cel_30(.clk(clk),.reset_n(reset_n),.sin(sync_dly[30]),.din(data_dly),.fsm(fsm),.rate(rate),.cycle(cycle),.wr_addr(wr_addr30),.rd_addr(),.ram_wr(wr30),.ram_d(),.dctv(dctv30));
//vtc_cell cel_31(.clk(clk),.reset_n(reset_n),.sin(sync_dly[31]),.din(data_dly),.fsm(fsm),.rate(rate),.cycle(cycle),.wr_addr(wr_addr31),.rd_addr(),.ram_wr(wr31),.ram_d(),.dctv(dctv31));
//vtc_cell cel_32(.clk(clk),.reset_n(reset_n),.sin(sync_dly[32]),.din(data_dly),.fsm(fsm),.rate(rate),.cycle(cycle),.wr_addr(wr_addr32),.rd_addr(),.ram_wr(wr32),.ram_d(),.dctv(dctv32));
//vtc_cell cel_33(.clk(clk),.reset_n(reset_n),.sin(sync_dly[33]),.din(data_dly),.fsm(fsm),.rate(rate),.cycle(cycle),.wr_addr(wr_addr33),.rd_addr(),.ram_wr(wr33),.ram_d(),.dctv(dctv33));
//vtc_cell cel_34(.clk(clk),.reset_n(reset_n),.sin(sync_dly[34]),.din(data_dly),.fsm(fsm),.rate(rate),.cycle(cycle),.wr_addr(wr_addr34),.rd_addr(),.ram_wr(wr34),.ram_d(),.dctv(dctv34));
//vtc_cell cel_35(.clk(clk),.reset_n(reset_n),.sin(sync_dly[35]),.din(data_dly),.fsm(fsm),.rate(rate),.cycle(cycle),.wr_addr(wr_addr35),.rd_addr(),.ram_wr(wr35),.ram_d(),.dctv(dctv35));


sram2p256x8 u_ram00(.CLKA(clk),.CLKB(clk),.ADDRA(rd_addr00),.ADDRB(wr_addr00),.ENA(1'b0),.ENB(1'b0),.WEB(wr00),.DINB(din00),.DOUTA(dout00));
sram2p256x8 u_ram01(.CLKA(clk),.CLKB(clk),.ADDRA(rd_addr01),.ADDRB(wr_addr01),.ENA(1'b0),.ENB(1'b0),.WEB(wr01),.DINB(din01),.DOUTA(dout01));
sram2p256x8 u_ram02(.CLKA(clk),.CLKB(clk),.ADDRA(rd_addr02),.ADDRB(wr_addr02),.ENA(1'b0),.ENB(1'b0),.WEB(wr02),.DINB(din02),.DOUTA(dout02));
sram2p256x8 u_ram03(.CLKA(clk),.CLKB(clk),.ADDRA(rd_addr03),.ADDRB(wr_addr03),.ENA(1'b0),.ENB(1'b0),.WEB(wr03),.DINB(din03),.DOUTA(dout03));
sram2p256x8 u_ram04(.CLKA(clk),.CLKB(clk),.ADDRA(rd_addr04),.ADDRB(wr_addr04),.ENA(1'b0),.ENB(1'b0),.WEB(wr04),.DINB(din04),.DOUTA(dout04));
sram2p256x8 u_ram05(.CLKA(clk),.CLKB(clk),.ADDRA(rd_addr05),.ADDRB(wr_addr05),.ENA(1'b0),.ENB(1'b0),.WEB(wr05),.DINB(din05),.DOUTA(dout05));
sram2p256x8 u_ram06(.CLKA(clk),.CLKB(clk),.ADDRA(rd_addr06),.ADDRB(wr_addr06),.ENA(1'b0),.ENB(1'b0),.WEB(wr06),.DINB(din06),.DOUTA(dout06));
sram2p256x8 u_ram07(.CLKA(clk),.CLKB(clk),.ADDRA(rd_addr07),.ADDRB(wr_addr07),.ENA(1'b0),.ENB(1'b0),.WEB(wr07),.DINB(din07),.DOUTA(dout07));
sram2p256x8 u_ram08(.CLKA(clk),.CLKB(clk),.ADDRA(rd_addr08),.ADDRB(wr_addr08),.ENA(1'b0),.ENB(1'b0),.WEB(wr08),.DINB(din08),.DOUTA(dout08));
sram2p256x8 u_ram09(.CLKA(clk),.CLKB(clk),.ADDRA(rd_addr09),.ADDRB(wr_addr09),.ENA(1'b0),.ENB(1'b0),.WEB(wr09),.DINB(din09),.DOUTA(dout09));
sram2p256x8 u_ram10(.CLKA(clk),.CLKB(clk),.ADDRA(rd_addr10),.ADDRB(wr_addr10),.ENA(1'b0),.ENB(1'b0),.WEB(wr10),.DINB(din10),.DOUTA(dout10));
sram2p256x8 u_ram11(.CLKA(clk),.CLKB(clk),.ADDRA(rd_addr11),.ADDRB(wr_addr11),.ENA(1'b0),.ENB(1'b0),.WEB(wr11),.DINB(din11),.DOUTA(dout11));
sram2p256x8 u_ram12(.CLKA(clk),.CLKB(clk),.ADDRA(rd_addr12),.ADDRB(wr_addr12),.ENA(1'b0),.ENB(1'b0),.WEB(wr12),.DINB(din12),.DOUTA(dout12));
sram2p256x8 u_ram13(.CLKA(clk),.CLKB(clk),.ADDRA(rd_addr13),.ADDRB(wr_addr13),.ENA(1'b0),.ENB(1'b0),.WEB(wr13),.DINB(din13),.DOUTA(dout13));
sram2p256x8 u_ram14(.CLKA(clk),.CLKB(clk),.ADDRA(rd_addr14),.ADDRB(wr_addr14),.ENA(1'b0),.ENB(1'b0),.WEB(wr14),.DINB(din14),.DOUTA(dout14));
sram2p256x8 u_ram15(.CLKA(clk),.CLKB(clk),.ADDRA(rd_addr15),.ADDRB(wr_addr15),.ENA(1'b0),.ENB(1'b0),.WEB(wr15),.DINB(din15),.DOUTA(dout15));
sram2p256x8 u_ram16(.CLKA(clk),.CLKB(clk),.ADDRA(rd_addr16),.ADDRB(wr_addr16),.ENA(1'b0),.ENB(1'b0),.WEB(wr16),.DINB(din16),.DOUTA(dout16));
sram2p256x8 u_ram17(.CLKA(clk),.CLKB(clk),.ADDRA(rd_addr17),.ADDRB(wr_addr17),.ENA(1'b0),.ENB(1'b0),.WEB(wr17),.DINB(din17),.DOUTA(dout17));
sram2p256x8 u_ram18(.CLKA(clk),.CLKB(clk),.ADDRA(rd_addr18),.ADDRB(wr_addr18),.ENA(1'b0),.ENB(1'b0),.WEB(wr18),.DINB(din18),.DOUTA(dout18));
sram2p256x8 u_ram19(.CLKA(clk),.CLKB(clk),.ADDRA(rd_addr19),.ADDRB(wr_addr19),.ENA(1'b0),.ENB(1'b0),.WEB(wr19),.DINB(din19),.DOUTA(dout19));
sram2p256x8 u_ram20(.CLKA(clk),.CLKB(clk),.ADDRA(rd_addr20),.ADDRB(wr_addr20),.ENA(1'b0),.ENB(1'b0),.WEB(wr20),.DINB(din20),.DOUTA(dout20));
sram2p256x8 u_ram21(.CLKA(clk),.CLKB(clk),.ADDRA(rd_addr21),.ADDRB(wr_addr21),.ENA(1'b0),.ENB(1'b0),.WEB(wr21),.DINB(din21),.DOUTA(dout21));
sram2p256x8 u_ram22(.CLKA(clk),.CLKB(clk),.ADDRA(rd_addr22),.ADDRB(wr_addr22),.ENA(1'b0),.ENB(1'b0),.WEB(wr22),.DINB(din22),.DOUTA(dout22));
sram2p256x8 u_ram23(.CLKA(clk),.CLKB(clk),.ADDRA(rd_addr23),.ADDRB(wr_addr23),.ENA(1'b0),.ENB(1'b0),.WEB(wr23),.DINB(din23),.DOUTA(dout23));
sram2p256x8 u_ram24(.CLKA(clk),.CLKB(clk),.ADDRA(rd_addr24),.ADDRB(wr_addr24),.ENA(1'b0),.ENB(1'b0),.WEB(wr24),.DINB(din24),.DOUTA(dout24));
sram2p256x8 u_ram25(.CLKA(clk),.CLKB(clk),.ADDRA(rd_addr25),.ADDRB(wr_addr25),.ENA(1'b0),.ENB(1'b0),.WEB(wr25),.DINB(din25),.DOUTA(dout25));
sram2p256x8 u_ram26(.CLKA(clk),.CLKB(clk),.ADDRA(rd_addr26),.ADDRB(wr_addr26),.ENA(1'b0),.ENB(1'b0),.WEB(wr26),.DINB(din26),.DOUTA(dout26));
sram2p256x8 u_ram27(.CLKA(clk),.CLKB(clk),.ADDRA(rd_addr27),.ADDRB(wr_addr27),.ENA(1'b0),.ENB(1'b0),.WEB(wr27),.DINB(din27),.DOUTA(dout27));
sram2p256x8 u_ram28(.CLKA(clk),.CLKB(clk),.ADDRA(rd_addr28),.ADDRB(wr_addr28),.ENA(1'b0),.ENB(1'b0),.WEB(wr28),.DINB(din28),.DOUTA(dout28));
sram2p256x8 u_ram29(.CLKA(clk),.CLKB(clk),.ADDRA(rd_addr29),.ADDRB(wr_addr29),.ENA(1'b0),.ENB(1'b0),.WEB(wr29),.DINB(din29),.DOUTA(dout29));
sram2p256x8 u_ram30(.CLKA(clk),.CLKB(clk),.ADDRA(rd_addr30),.ADDRB(wr_addr30),.ENA(1'b0),.ENB(1'b0),.WEB(wr30),.DINB(din30),.DOUTA(dout30));
sram2p256x8 u_ram31(.CLKA(clk),.CLKB(clk),.ADDRA(rd_addr31),.ADDRB(wr_addr31),.ENA(1'b0),.ENB(1'b0),.WEB(wr31),.DINB(din31),.DOUTA(dout31));
sram2p256x8 u_ram32(.CLKA(clk),.CLKB(clk),.ADDRA(rd_addr32),.ADDRB(wr_addr32),.ENA(1'b0),.ENB(1'b0),.WEB(wr32),.DINB(din32),.DOUTA(dout32));
sram2p256x8 u_ram33(.CLKA(clk),.CLKB(clk),.ADDRA(rd_addr33),.ADDRB(wr_addr33),.ENA(1'b0),.ENB(1'b0),.WEB(wr33),.DINB(din33),.DOUTA(dout33));
sram2p256x8 u_ram34(.CLKA(clk),.CLKB(clk),.ADDRA(rd_addr34),.ADDRB(wr_addr34),.ENA(1'b0),.ENB(1'b0),.WEB(wr34),.DINB(din34),.DOUTA(dout34));
sram2p256x8 u_ram35(.CLKA(clk),.CLKB(clk),.ADDRA(rd_addr35),.ADDRB(wr_addr35),.ENA(1'b0),.ENB(1'b0),.WEB(wr35),.DINB(din35),.DOUTA(dout35));

sram2p768x52 lr_ram00(.CLKA(clk),.CLKB(clk),.ADDRA(rd_addr),.ADDRB(wr_addr),.ENA(1'b0),.ENB(1'b0),.WEB(wr0),.DINB(mem0_in),.DOUTA(mem0_out));
sram2p768x52 lr_ram01(.CLKA(clk),.CLKB(clk),.ADDRA(rd_addr),.ADDRB(wr_addr),.ENA(1'b0),.ENB(1'b0),.WEB(wr0),.DINB(mem1_in),.DOUTA(mem1_out));
sram2p768x52 lr_ram02(.CLKA(clk),.CLKB(clk),.ADDRA(rd_addr),.ADDRB(wr_addr),.ENA(1'b0),.ENB(1'b0),.WEB(wr0),.DINB(mem2_in),.DOUTA(mem2_out));

ldpc_ctrl u_ldpc_ctrl(
    .clk        (  clk        ),
    .reset_n    (  reset_n    ),
    .sync_in    (  sync_in    ),
    .rate       (  rate       ),
    .max_iter   (  max_iter   ),
    .ctv_out    (  ctv_out    ),
    .sigma_vnu  (  sigma_vnu  ),

    .fsm_state  (  fsm        ),
    .cycle      (  cycle      ),
    .finish     (             ),
    .busy       (  busy       ),
    .iter_0     (  iter_0     ), 
    .wr_lq      (  wr_lq      ),
    .wr_lr      (  wr_lr      ),
    .rd_lq      (  rd_lq      ),
    .rd_lr      (  rd_lr      ),
    .num_iter   (  num_iter   ) 

);

addr_gen u_addr_gen(
    .clk        (clk      ),
    .reset_n    (reset_n  ),
    .fsm        (fsm      ),
    .cycle      (cycle    ),
    .rate       (rate     ),
    .sync_in    (sync_dly ),
    .wr_lq      (  wr_lq  ),
    .wr_lr      (  wr_lr  ),
    .rd_lq      (  rd_lq  ),
    .rd_lr      (  rd_lr  ),
    .out_sel    (out_sel  ),
    .out_en     (out_en   ),
    .rd_addr00  (rd_addr00),
    .rd_addr01  (rd_addr01),
    .rd_addr02  (rd_addr02),
    .rd_addr03  (rd_addr03),
    .rd_addr04  (rd_addr04),
    .rd_addr05  (rd_addr05),
    .rd_addr06  (rd_addr06),
    .rd_addr07  (rd_addr07),
    .rd_addr08  (rd_addr08),
    .rd_addr09  (rd_addr09),
    .rd_addr10  (rd_addr10),
    .rd_addr11  (rd_addr11),
    .rd_addr12  (rd_addr12),
    .rd_addr13  (rd_addr13),
    .rd_addr14  (rd_addr14),
    .rd_addr15  (rd_addr15),
    .rd_addr16  (rd_addr16),
    .rd_addr17  (rd_addr17),
    .rd_addr18  (rd_addr18),
    .rd_addr19  (rd_addr19),
    .rd_addr20  (rd_addr20),
    .rd_addr21  (rd_addr21),
    .rd_addr22  (rd_addr22),
    .rd_addr23  (rd_addr23),
    .rd_addr24  (rd_addr24),
    .rd_addr25  (rd_addr25),
    .rd_addr26  (rd_addr26),
    .rd_addr27  (rd_addr27),
    .rd_addr28  (rd_addr28),
    .rd_addr29  (rd_addr29),
    .rd_addr30  (rd_addr30),
    .rd_addr31  (rd_addr31),
    .rd_addr32  (rd_addr32),
    .rd_addr33  (rd_addr33),
    .rd_addr34  (rd_addr34),
    .rd_addr35  (rd_addr35),
    .wr_addr00  (wr_addr00),
    .wr_addr01  (wr_addr01),
    .wr_addr02  (wr_addr02),
    .wr_addr03  (wr_addr03),
    .wr_addr04  (wr_addr04),
    .wr_addr05  (wr_addr05),
    .wr_addr06  (wr_addr06),
    .wr_addr07  (wr_addr07),
    .wr_addr08  (wr_addr08),
    .wr_addr09  (wr_addr09),
    .wr_addr10  (wr_addr10),
    .wr_addr11  (wr_addr11),
    .wr_addr12  (wr_addr12),
    .wr_addr13  (wr_addr13),
    .wr_addr14  (wr_addr14),
    .wr_addr15  (wr_addr15),
    .wr_addr16  (wr_addr16),
    .wr_addr17  (wr_addr17),
    .wr_addr18  (wr_addr18),
    .wr_addr19  (wr_addr19),
    .wr_addr20  (wr_addr20),
    .wr_addr21  (wr_addr21),
    .wr_addr22  (wr_addr22),
    .wr_addr23  (wr_addr23),
    .wr_addr24  (wr_addr24),
    .wr_addr25  (wr_addr25),
    .wr_addr26  (wr_addr26),
    .wr_addr27  (wr_addr27),
    .wr_addr28  (wr_addr28),
    .wr_addr29  (wr_addr29),
    .wr_addr30  (wr_addr30),
    .wr_addr31  (wr_addr31),
    .wr_addr32  (wr_addr32),
    .wr_addr33  (wr_addr33),
    .wr_addr34  (wr_addr34),
    .wr_addr35  (wr_addr35),
    .wr00       (wr00     ),
    .wr01       (wr01     ),
    .wr02       (wr02     ),
    .wr03       (wr03     ),
    .wr04       (wr04     ),
    .wr05       (wr05     ),
    .wr06       (wr06     ),
    .wr07       (wr07     ),
    .wr08       (wr08     ),
    .wr09       (wr09     ),
    .wr10       (wr10     ),
    .wr11       (wr11     ),
    .wr12       (wr12     ),
    .wr13       (wr13     ),
    .wr14       (wr14     ),
    .wr15       (wr15     ),
    .wr16       (wr16     ),
    .wr17       (wr17     ),
    .wr18       (wr18     ),
    .wr19       (wr19     ),
    .wr20       (wr20     ),
    .wr21       (wr21     ),
    .wr22       (wr22     ),
    .wr23       (wr23     ),
    .wr24       (wr24     ),
    .wr25       (wr25     ),
    .wr26       (wr26     ),
    .wr27       (wr27     ),
    .wr28       (wr28     ),
    .wr29       (wr29     ),
    .wr30       (wr30     ),
    .wr31       (wr31     ),
    .wr32       (wr32     ),
    .wr33       (wr33     ),
    .wr34       (wr34     ),
    .wr35       (wr35     ),
    .rd_addr    (rd_addr  ),
    .wr_addr    (wr_addr  ), 
    .wr0        (wr0      )
);  


data_comp u_data_comp(
    .clk        ( clk        ),
    .reset_n    ( reset_n    ),
    .fsm        ( fsm        ),
    .cycle      ( cycle[3:2] ),
    .rate       ( rate       ),
    .iter_0     ( iter_0     ),
    .sync_in    ( sync_dly   ),
    .data_in    ( data_dly   ),
    .ctv_out    ( ctv_out    ),
    .sigma_vnu  ( sigma_vnu  ),
    .dout00     ( dout00     ),
    .dout01     ( dout01     ),
    .dout02     ( dout02     ),
    .dout03     ( dout03     ),
    .dout04     ( dout04     ),
    .dout05     ( dout05     ),
    .dout06     ( dout06     ),
    .dout07     ( dout07     ),
    .dout08     ( dout08     ),
    .dout09     ( dout09     ),
    .dout10     ( dout10     ),
    .dout11     ( dout11     ),
    .dout12     ( dout12     ),
    .dout13     ( dout13     ),
    .dout14     ( dout14     ),
    .dout15     ( dout15     ),
    .dout16     ( dout16     ),
    .dout17     ( dout17     ),
    .dout18     ( dout18     ),
    .dout19     ( dout19     ),
    .dout20     ( dout20     ),
    .dout21     ( dout21     ),
    .dout22     ( dout22     ),
    .dout23     ( dout23     ),
    .dout24     ( dout24     ),
    .dout25     ( dout25     ),
    .dout26     ( dout26     ),
    .dout27     ( dout27     ),
    .dout28     ( dout28     ),
    .dout29     ( dout29     ),
    .dout30     ( dout30     ),
    .dout31     ( dout31     ),
    .dout32     ( dout32     ),
    .dout33     ( dout33     ),
    .dout34     ( dout34     ),
    .dout35     ( dout35     ),
    .din00      ( din00      ),
    .din01      ( din01      ),
    .din02      ( din02      ),
    .din03      ( din03      ),
    .din04      ( din04      ),
    .din05      ( din05      ),
    .din06      ( din06      ),
    .din07      ( din07      ),
    .din08      ( din08      ),
    .din09      ( din09      ),
    .din10      ( din10      ),
    .din11      ( din11      ),
    .din12      ( din12      ),
    .din13      ( din13      ),
    .din14      ( din14      ),
    .din15      ( din15      ),
    .din16      ( din16      ),
    .din17      ( din17      ),
    .din18      ( din18      ),
    .din19      ( din19      ),
    .din20      ( din20      ),
    .din21      ( din21      ),
    .din22      ( din22      ),
    .din23      ( din23      ),
    .din24      ( din24      ),
    .din25      ( din25      ),
    .din26      ( din26      ),
    .din27      ( din27      ),
    .din28      ( din28      ),
    .din29      ( din29      ),
    .din30      ( din30      ),
    .din31      ( din31      ),
    .din32      ( din32      ),
    .din33      ( din33      ),
    .din34      ( din34      ),
    .din35      ( din35      ),
    .mem0_in    ( mem0_in    ),   
    .mem0_out   ( mem0_out   ), 
    .mem1_in    ( mem1_in    ),   
    .mem1_out   ( mem1_out   ), 
    .mem2_in    ( mem2_in    ),   
    .mem2_out   ( mem2_out   ) 
); 

endmodule
