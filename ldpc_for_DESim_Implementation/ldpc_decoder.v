`timescale 1 ns / 1 ps
module desim(CLOCK_50,LEDR,SW,KEY);
input CLOCK_50;
input [9:0] SW;
input [3:0] KEY;
output [9:0] LEDR;
ldpc ldpc(CLOCK_50,KEY[0],SW[5:0],KEY[1],KEY[2],5'b00111,LEDR[9],LEDR[8],LEDR[7],LEDR[4:0]);
endmodule

`timescale 1 ns / 1 ps
module addr_gen(
    clk,
    reset_n,
    fsm,
    cycle,
    rate,
    sync_in,
    wr_lq,
    wr_lr,
    rd_lq,
    rd_lr,
    out_sel,
    out_en,
    rd_addr00,
    rd_addr01,
    rd_addr02,
    rd_addr03,
    rd_addr04,
    rd_addr05,
    rd_addr06,
    rd_addr07,
    rd_addr08,
    rd_addr09,
    rd_addr10,
    rd_addr11,
    rd_addr12,
    rd_addr13,
    rd_addr14,
    rd_addr15,
    rd_addr16,
    rd_addr17,
    rd_addr18,
    rd_addr19,
    rd_addr20,
    rd_addr21,
    rd_addr22,
    rd_addr23,
    rd_addr24,
    rd_addr25,
    rd_addr26,
    rd_addr27,
    rd_addr28,
    rd_addr29,
    rd_addr30,
    rd_addr31,
    rd_addr32,
    rd_addr33,
    rd_addr34,
    rd_addr35,
    wr_addr00,
    wr_addr01,
    wr_addr02,
    wr_addr03,
    wr_addr04,
    wr_addr05,
    wr_addr06,
    wr_addr07,
    wr_addr08,
    wr_addr09,
    wr_addr10,
    wr_addr11,
    wr_addr12,
    wr_addr13,
    wr_addr14,
    wr_addr15,
    wr_addr16,
    wr_addr17,
    wr_addr18,
    wr_addr19,
    wr_addr20,
    wr_addr21,
    wr_addr22,
    wr_addr23,
    wr_addr24,
    wr_addr25,
    wr_addr26,
    wr_addr27,
    wr_addr28,
    wr_addr29,
    wr_addr30,
    wr_addr31,
    wr_addr32,
    wr_addr33,
    wr_addr34,
    wr_addr35,
    wr00     ,
    wr01     ,
    wr02     ,
    wr03     ,
    wr04     ,
    wr05     ,
    wr06     ,
    wr07     ,
    wr08     ,
    wr09     ,
    wr10     ,
    wr11     ,
    wr12     ,
    wr13     ,
    wr14     ,
    wr15     ,
    wr16     ,
    wr17     ,
    wr18     ,
    wr19     ,
    wr20     ,
    wr21     ,
    wr22     ,
    wr23     ,
    wr24     ,
    wr25     ,
    wr26     ,
    wr27     ,
    wr28     ,
    wr29     ,
    wr30     ,
    wr31     ,
    wr32     ,
    wr33     ,
    wr34     ,
    wr35     ,
    rd_addr  ,
    wr_addr  ,
    wr0
);  

parameter A_WID = 8;
   
//Input ports                     
input                 clk        ;
input                 reset_n    ;
input                 rate       ;
input   [3:0]         fsm        ;
input   [3:0]         cycle      ;
input   [35:0]        sync_in    ;
input                 wr_lq      ;
input                 wr_lr      ;
input                 rd_lq      ;
input                 rd_lr      ;

//Output ports
output  [A_WID-1:0]   rd_addr00  ;
output  [A_WID-1:0]   rd_addr01  ;
output  [A_WID-1:0]   rd_addr02  ;
output  [A_WID-1:0]   rd_addr03  ;
output  [A_WID-1:0]   rd_addr04  ;
output  [A_WID-1:0]   rd_addr05  ;
output  [A_WID-1:0]   rd_addr06  ;
output  [A_WID-1:0]   rd_addr07  ;
output  [A_WID-1:0]   rd_addr08  ;
output  [A_WID-1:0]   rd_addr09  ;
output  [A_WID-1:0]   rd_addr10  ;
output  [A_WID-1:0]   rd_addr11  ;
output  [A_WID-1:0]   rd_addr12  ;
output  [A_WID-1:0]   rd_addr13  ;
output  [A_WID-1:0]   rd_addr14  ;
output  [A_WID-1:0]   rd_addr15  ;
output  [A_WID-1:0]   rd_addr16  ;
output  [A_WID-1:0]   rd_addr17  ;
output  [A_WID-1:0]   rd_addr18  ;
output  [A_WID-1:0]   rd_addr19  ;
output  [A_WID-1:0]   rd_addr20  ;
output  [A_WID-1:0]   rd_addr21  ;
output  [A_WID-1:0]   rd_addr22  ;
output  [A_WID-1:0]   rd_addr23  ;
output  [A_WID-1:0]   rd_addr24  ;
output  [A_WID-1:0]   rd_addr25  ;
output  [A_WID-1:0]   rd_addr26  ;
output  [A_WID-1:0]   rd_addr27  ;
output  [A_WID-1:0]   rd_addr28  ;
output  [A_WID-1:0]   rd_addr29  ;
output  [A_WID-1:0]   rd_addr30  ;
output  [A_WID-1:0]   rd_addr31  ;
output  [A_WID-1:0]   rd_addr32  ;
output  [A_WID-1:0]   rd_addr33  ;
output  [A_WID-1:0]   rd_addr34  ;
output  [A_WID-1:0]   rd_addr35  ;    
output  [A_WID-1:0]   wr_addr00  ;
output  [A_WID-1:0]   wr_addr01  ;
output  [A_WID-1:0]   wr_addr02  ;
output  [A_WID-1:0]   wr_addr03  ;
output  [A_WID-1:0]   wr_addr04  ;
output  [A_WID-1:0]   wr_addr05  ;
output  [A_WID-1:0]   wr_addr06  ;
output  [A_WID-1:0]   wr_addr07  ;
output  [A_WID-1:0]   wr_addr08  ;
output  [A_WID-1:0]   wr_addr09  ;
output  [A_WID-1:0]   wr_addr10  ;
output  [A_WID-1:0]   wr_addr11  ;
output  [A_WID-1:0]   wr_addr12  ;
output  [A_WID-1:0]   wr_addr13  ;
output  [A_WID-1:0]   wr_addr14  ;
output  [A_WID-1:0]   wr_addr15  ;
output  [A_WID-1:0]   wr_addr16  ;
output  [A_WID-1:0]   wr_addr17  ;
output  [A_WID-1:0]   wr_addr18  ;
output  [A_WID-1:0]   wr_addr19  ;
output  [A_WID-1:0]   wr_addr20  ;
output  [A_WID-1:0]   wr_addr21  ;
output  [A_WID-1:0]   wr_addr22  ;
output  [A_WID-1:0]   wr_addr23  ;
output  [A_WID-1:0]   wr_addr24  ;
output  [A_WID-1:0]   wr_addr25  ;
output  [A_WID-1:0]   wr_addr26  ;
output  [A_WID-1:0]   wr_addr27  ;
output  [A_WID-1:0]   wr_addr28  ;
output  [A_WID-1:0]   wr_addr29  ;
output  [A_WID-1:0]   wr_addr30  ;
output  [A_WID-1:0]   wr_addr31  ;
output  [A_WID-1:0]   wr_addr32  ;
output  [A_WID-1:0]   wr_addr33  ;
output  [A_WID-1:0]   wr_addr34  ;
output  [A_WID-1:0]   wr_addr35  ; 
output                wr00       ;
output                wr01       ;
output                wr02       ;
output                wr03       ;
output                wr04       ;
output                wr05       ;
output                wr06       ;
output                wr07       ;
output                wr08       ;
output                wr09       ;
output                wr10       ;
output                wr11       ;
output                wr12       ;
output                wr13       ;
output                wr14       ;
output                wr15       ;
output                wr16       ;
output                wr17       ;
output                wr18       ;
output                wr19       ;
output                wr20       ;
output                wr21       ;
output                wr22       ;
output                wr23       ;
output                wr24       ;
output                wr25       ;
output                wr26       ;
output                wr27       ;
output                wr28       ;
output                wr29       ;
output                wr30       ;
output                wr31       ;
output                wr32       ;
output                wr33       ;
output                wr34       ;
output                wr35       ;
output  [A_WID+1:0]   rd_addr    ;
output  [A_WID+1:0]   wr_addr    ;
output                wr0        ;
output   [35:0]       out_sel    ;
output                out_en     ;

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
wire  [3*A_WID-1:0]   offset00   ;
wire  [3*A_WID-1:0]   offset01   ;
wire  [3*A_WID-1:0]   offset02   ;
wire  [3*A_WID-1:0]   offset03   ;
wire  [3*A_WID-1:0]   offset04   ;
wire  [3*A_WID-1:0]   offset05   ;
wire  [3*A_WID-1:0]   offset06   ;
wire  [3*A_WID-1:0]   offset07   ;
wire  [3*A_WID-1:0]   offset08   ;
wire  [3*A_WID-1:0]   offset09   ;
wire  [3*A_WID-1:0]   offset10   ;
wire  [3*A_WID-1:0]   offset11   ;
wire  [3*A_WID-1:0]   offset12   ;
wire  [3*A_WID-1:0]   offset13   ;
wire  [3*A_WID-1:0]   offset14   ;
wire  [3*A_WID-1:0]   offset15   ;
wire  [3*A_WID-1:0]   offset16   ;
wire  [3*A_WID-1:0]   offset17   ;
wire  [3*A_WID-1:0]   offset18   ;
wire  [3*A_WID-1:0]   offset19   ;
wire  [3*A_WID-1:0]   offset20   ;
wire  [3*A_WID-1:0]   offset21   ;
wire  [3*A_WID-1:0]   offset22   ;
wire  [3*A_WID-1:0]   offset23   ;
wire  [3*A_WID-1:0]   offset24   ;
wire  [3*A_WID-1:0]   offset25   ;
wire  [3*A_WID-1:0]   offset26   ;
wire  [3*A_WID-1:0]   offset27   ;
wire  [3*A_WID-1:0]   offset28   ;
wire  [3*A_WID-1:0]   offset29   ;
wire  [3*A_WID-1:0]   offset30   ;
wire  [3*A_WID-1:0]   offset31   ;
wire  [3*A_WID-1:0]   offset32   ;
wire  [3*A_WID-1:0]   offset33   ;
wire  [3*A_WID-1:0]   offset34   ;
wire  [3*A_WID-1:0]   offset35   ;
wire    [A_WID-1:0]   out_addr   ;
wire     [35:0]       out_rd_sel ;
wire                  out_rd_en  ;

reg     [A_WID-1:0]   rd_counter ;
reg     [A_WID-1:0]   wr_counter ;
reg     [A_WID+1:0]   rd_addr    ;
reg     [A_WID+1:0]   wr_addr    ;
reg      [35:0]       out_sel    ;
reg                   out_en     ;

wire                  wr0        ;
wire                  rd_en      ;

assign rd_en = fsm[2] & (cycle[3:2] != 2'h0);
assign wr_en = fsm[2] & (cycle[1:0] != 2'h0);
assign offset00  =  {8'd0,8'd0,8'd0};
assign offset01  =  {8'd0,8'd0,8'd0};
assign offset02  =  {8'd0,8'd0,8'd0};
assign offset03  =  {8'd0,8'd0,8'd0};
assign offset04  =  {8'd0,8'd0,8'd0}; 
assign offset05  =  {8'd0,8'd0,8'd0};
assign offset06  =  {8'd0,8'd0,8'd0};
assign offset07  =  {8'd0,8'd0,8'd0};
assign offset08  =  {8'd0,8'd255,8'd0};
assign offset09  =  {8'd0,8'd129,8'd65};
assign offset10  =  {8'd0,8'd224,8'd240};
assign offset11  =  {8'd0,8'd216,8'd236};
assign offset12  =  {8'd0,8'd157,8'd250};
assign offset13  =  {8'd0,8'd132,8'd242};
assign offset14  =  {8'd0,8'd184,8'd247};
assign offset15  =  {8'd0,8'd254,8'd240};
assign offset16  =  {8'd0,8'd115,8'd242};
assign offset17  =  {8'd0,8'd209,8'd164};
assign offset18  =  {8'd0,8'd255,8'd248};
assign offset19  =  {8'd0,8'd246,8'd58};
assign offset20  =  {8'd0,8'd253,8'd215};
assign offset21  =  {8'd0,8'd252,8'd209};
assign offset22  =  {8'd0,8'd146,8'd249};
assign offset23  =  {8'd0,8'd231,8'd250};
assign offset24  =  {8'd254,8'd200,8'd0};
assign offset25  =  {8'd0,8'd85,8'd235};
assign offset26  =  {8'd0,8'd229,8'd69};
assign offset27  =  {8'd0,8'd203,8'd254};
assign offset28  =  {8'd0,8'd131,8'd251};
assign offset29  =  {8'd0,8'd115,8'd254};
assign offset30  =  {8'd0,8'd253,8'd255};  
assign offset31  =  {8'd0,8'd248,8'd254};
assign offset32  =  {8'd0,8'd255,8'd243}; 
assign offset33  =  {8'd0,8'd239,8'd253}; 
assign offset34  =  {8'd0,8'd248,8'd215}; 
assign offset35  =  {8'd0,8'd252,8'd164}; 
 
always @ (posedge clk or negedge reset_n)
begin : rd_counter_r
    if(!reset_n)
        rd_counter <= #1 8'h0;
    else if(fsm[2]) begin 
        if ( rd_lq )
        rd_counter <= #1 rd_counter + 8'd37;
        else
        rd_counter <= #1 rd_counter;
        end
//    else if(out_rd_en)
//        rd_counter <= #1 out_addr;
    else
	rd_counter <= #1 8'h0;
end

always @ (posedge clk or negedge reset_n)
begin : out_sel_r
    if(!reset_n)
        out_sel <= #1 36'h0;
    else
        out_sel <= #1 out_rd_sel;
end

always @ (posedge clk or negedge reset_n)
begin : out_en_r
    if(!reset_n)
        out_en <= #1 1'b0;
    else
        out_en <= #1 out_rd_en;
end        

always @ (posedge clk or negedge reset_n)
begin : wr_counter_r
    if(!reset_n)
        wr_counter <= #1 8'h0;
    else if(fsm[2]) begin 
        if ( wr_lq )
        wr_counter <= #1 wr_counter + 8'd37;
        else
        wr_counter <= #1 wr_counter;
        end
    else
        wr_counter <= #1 8'h0;
end

always @ (posedge clk or negedge reset_n)
begin : wr_addr_r
    if(!reset_n)
        wr_addr <= #1 10'h0;
    else if(wr_lr) begin
        if( wr_addr == 'd767)
        wr_addr <= #1 10'h0;
        else
        wr_addr <= #1 wr_addr + 1'b1;
        end
end

assign wr0 = wr_lr;

always @ (posedge clk or negedge reset_n)
begin : rd_addr_r
    if(!reset_n)
        rd_addr <= #1 10'h0;
    else if(rd_lr) begin
        if(rd_addr == 'd767)
        rd_addr <= #1 10'h0;
        else        
        rd_addr <= #1 rd_addr + 1'b1;
    end
end

rd_cell rd_cell00(.clk(clk),.reset_n(reset_n),.rd_en(rd_en),.cycle(cycle[3:2]),.base_addr(rd_counter),.addr_offset(offset00),.out_addr(out_addr),.out_en(out_rd_sel[ 0]),.rd_addr(rd_addr00));
rd_cell rd_cell01(.clk(clk),.reset_n(reset_n),.rd_en(rd_en),.cycle(cycle[3:2]),.base_addr(rd_counter),.addr_offset(offset01),.out_addr(out_addr),.out_en(out_rd_sel[ 1]),.rd_addr(rd_addr01));
rd_cell rd_cell02(.clk(clk),.reset_n(reset_n),.rd_en(rd_en),.cycle(cycle[3:2]),.base_addr(rd_counter),.addr_offset(offset02),.out_addr(out_addr),.out_en(out_rd_sel[ 2]),.rd_addr(rd_addr02));
rd_cell rd_cell03(.clk(clk),.reset_n(reset_n),.rd_en(rd_en),.cycle(cycle[3:2]),.base_addr(rd_counter),.addr_offset(offset03),.out_addr(out_addr),.out_en(out_rd_sel[ 3]),.rd_addr(rd_addr03));
rd_cell rd_cell04(.clk(clk),.reset_n(reset_n),.rd_en(rd_en),.cycle(cycle[3:2]),.base_addr(rd_counter),.addr_offset(offset04),.out_addr(out_addr),.out_en(out_rd_sel[ 4]),.rd_addr(rd_addr04));
rd_cell rd_cell05(.clk(clk),.reset_n(reset_n),.rd_en(rd_en),.cycle(cycle[3:2]),.base_addr(rd_counter),.addr_offset(offset05),.out_addr(out_addr),.out_en(out_rd_sel[ 5]),.rd_addr(rd_addr05));
rd_cell rd_cell06(.clk(clk),.reset_n(reset_n),.rd_en(rd_en),.cycle(cycle[3:2]),.base_addr(rd_counter),.addr_offset(offset06),.out_addr(out_addr),.out_en(out_rd_sel[ 6]),.rd_addr(rd_addr06));
rd_cell rd_cell07(.clk(clk),.reset_n(reset_n),.rd_en(rd_en),.cycle(cycle[3:2]),.base_addr(rd_counter),.addr_offset(offset07),.out_addr(out_addr),.out_en(out_rd_sel[ 7]),.rd_addr(rd_addr07));
rd_cell rd_cell08(.clk(clk),.reset_n(reset_n),.rd_en(rd_en),.cycle(cycle[3:2]),.base_addr(rd_counter),.addr_offset(offset08),.out_addr(out_addr),.out_en(out_rd_sel[ 8]),.rd_addr(rd_addr08));
rd_cell rd_cell09(.clk(clk),.reset_n(reset_n),.rd_en(rd_en),.cycle(cycle[3:2]),.base_addr(rd_counter),.addr_offset(offset09),.out_addr(out_addr),.out_en(out_rd_sel[ 9]),.rd_addr(rd_addr09));
rd_cell rd_cell10(.clk(clk),.reset_n(reset_n),.rd_en(rd_en),.cycle(cycle[3:2]),.base_addr(rd_counter),.addr_offset(offset10),.out_addr(out_addr),.out_en(out_rd_sel[10]),.rd_addr(rd_addr10));
rd_cell rd_cell11(.clk(clk),.reset_n(reset_n),.rd_en(rd_en),.cycle(cycle[3:2]),.base_addr(rd_counter),.addr_offset(offset11),.out_addr(out_addr),.out_en(out_rd_sel[11]),.rd_addr(rd_addr11));
rd_cell rd_cell12(.clk(clk),.reset_n(reset_n),.rd_en(rd_en),.cycle(cycle[3:2]),.base_addr(rd_counter),.addr_offset(offset12),.out_addr(out_addr),.out_en(out_rd_sel[12]),.rd_addr(rd_addr12));
rd_cell rd_cell13(.clk(clk),.reset_n(reset_n),.rd_en(rd_en),.cycle(cycle[3:2]),.base_addr(rd_counter),.addr_offset(offset13),.out_addr(out_addr),.out_en(out_rd_sel[13]),.rd_addr(rd_addr13));
rd_cell rd_cell14(.clk(clk),.reset_n(reset_n),.rd_en(rd_en),.cycle(cycle[3:2]),.base_addr(rd_counter),.addr_offset(offset14),.out_addr(out_addr),.out_en(out_rd_sel[14]),.rd_addr(rd_addr14));
rd_cell rd_cell15(.clk(clk),.reset_n(reset_n),.rd_en(rd_en),.cycle(cycle[3:2]),.base_addr(rd_counter),.addr_offset(offset15),.out_addr(out_addr),.out_en(out_rd_sel[15]),.rd_addr(rd_addr15));
rd_cell rd_cell16(.clk(clk),.reset_n(reset_n),.rd_en(rd_en),.cycle(cycle[3:2]),.base_addr(rd_counter),.addr_offset(offset16),.out_addr(out_addr),.out_en(out_rd_sel[16]),.rd_addr(rd_addr16));
rd_cell rd_cell17(.clk(clk),.reset_n(reset_n),.rd_en(rd_en),.cycle(cycle[3:2]),.base_addr(rd_counter),.addr_offset(offset17),.out_addr(out_addr),.out_en(out_rd_sel[17]),.rd_addr(rd_addr17));
rd_cell rd_cell18(.clk(clk),.reset_n(reset_n),.rd_en(rd_en),.cycle(cycle[3:2]),.base_addr(rd_counter),.addr_offset(offset18),.out_addr(out_addr),.out_en(out_rd_sel[18]),.rd_addr(rd_addr18));
rd_cell rd_cell19(.clk(clk),.reset_n(reset_n),.rd_en(rd_en),.cycle(cycle[3:2]),.base_addr(rd_counter),.addr_offset(offset19),.out_addr(out_addr),.out_en(out_rd_sel[19]),.rd_addr(rd_addr19));
rd_cell rd_cell20(.clk(clk),.reset_n(reset_n),.rd_en(rd_en),.cycle(cycle[3:2]),.base_addr(rd_counter),.addr_offset(offset20),.out_addr(out_addr),.out_en(out_rd_sel[20]),.rd_addr(rd_addr20));
rd_cell rd_cell21(.clk(clk),.reset_n(reset_n),.rd_en(rd_en),.cycle(cycle[3:2]),.base_addr(rd_counter),.addr_offset(offset21),.out_addr(out_addr),.out_en(out_rd_sel[21]),.rd_addr(rd_addr21));
rd_cell rd_cell22(.clk(clk),.reset_n(reset_n),.rd_en(rd_en),.cycle(cycle[3:2]),.base_addr(rd_counter),.addr_offset(offset22),.out_addr(out_addr),.out_en(out_rd_sel[22]),.rd_addr(rd_addr22));
rd_cell rd_cell23(.clk(clk),.reset_n(reset_n),.rd_en(rd_en),.cycle(cycle[3:2]),.base_addr(rd_counter),.addr_offset(offset23),.out_addr(out_addr),.out_en(out_rd_sel[23]),.rd_addr(rd_addr23));
rd_cell rd_cell24(.clk(clk),.reset_n(reset_n),.rd_en(rd_en),.cycle(cycle[3:2]),.base_addr(rd_counter),.addr_offset(offset24),.out_addr(out_addr),.out_en(out_rd_sel[24]),.rd_addr(rd_addr24));
rd_cell rd_cell25(.clk(clk),.reset_n(reset_n),.rd_en(rd_en),.cycle(cycle[3:2]),.base_addr(rd_counter),.addr_offset(offset25),.out_addr(out_addr),.out_en(out_rd_sel[25]),.rd_addr(rd_addr25));
rd_cell rd_cell26(.clk(clk),.reset_n(reset_n),.rd_en(rd_en),.cycle(cycle[3:2]),.base_addr(rd_counter),.addr_offset(offset26),.out_addr(out_addr),.out_en(out_rd_sel[26]),.rd_addr(rd_addr26));
rd_cell rd_cell27(.clk(clk),.reset_n(reset_n),.rd_en(rd_en),.cycle(cycle[3:2]),.base_addr(rd_counter),.addr_offset(offset27),.out_addr(out_addr),.out_en(out_rd_sel[27]),.rd_addr(rd_addr27));
rd_cell rd_cell28(.clk(clk),.reset_n(reset_n),.rd_en(rd_en),.cycle(cycle[3:2]),.base_addr(rd_counter),.addr_offset(offset28),.out_addr(out_addr),.out_en(out_rd_sel[28]),.rd_addr(rd_addr28));
rd_cell rd_cell29(.clk(clk),.reset_n(reset_n),.rd_en(rd_en),.cycle(cycle[3:2]),.base_addr(rd_counter),.addr_offset(offset29),.out_addr(out_addr),.out_en(out_rd_sel[29]),.rd_addr(rd_addr29));
rd_cell rd_cell30(.clk(clk),.reset_n(reset_n),.rd_en(rd_en),.cycle(cycle[3:2]),.base_addr(rd_counter),.addr_offset(offset30),.out_addr(out_addr),.out_en(out_rd_sel[30]),.rd_addr(rd_addr30));
rd_cell rd_cell31(.clk(clk),.reset_n(reset_n),.rd_en(rd_en),.cycle(cycle[3:2]),.base_addr(rd_counter),.addr_offset(offset31),.out_addr(out_addr),.out_en(out_rd_sel[31]),.rd_addr(rd_addr31));
rd_cell rd_cell32(.clk(clk),.reset_n(reset_n),.rd_en(rd_en),.cycle(cycle[3:2]),.base_addr(rd_counter),.addr_offset(offset32),.out_addr(out_addr),.out_en(out_rd_sel[32]),.rd_addr(rd_addr32));
rd_cell rd_cell33(.clk(clk),.reset_n(reset_n),.rd_en(rd_en),.cycle(cycle[3:2]),.base_addr(rd_counter),.addr_offset(offset33),.out_addr(out_addr),.out_en(out_rd_sel[33]),.rd_addr(rd_addr33));
rd_cell rd_cell34(.clk(clk),.reset_n(reset_n),.rd_en(rd_en),.cycle(cycle[3:2]),.base_addr(rd_counter),.addr_offset(offset34),.out_addr(out_addr),.out_en(out_rd_sel[34]),.rd_addr(rd_addr34));
rd_cell rd_cell35(.clk(clk),.reset_n(reset_n),.rd_en(rd_en),.cycle(cycle[3:2]),.base_addr(rd_counter),.addr_offset(offset35),.out_addr(out_addr),.out_en(out_rd_sel[35]),.rd_addr(rd_addr35));

wr_cell wr_cell00(.clk(clk),.reset_n(reset_n),.wr_en(wr_en),.sin(sync_in[ 0]),.fsm(fsm),.cycle(cycle[1:0]),.base_addr(wr_counter),.addr_offset(offset00),.wr_addr(wr_addr00),.ram_wr(wr00));
wr_cell wr_cell01(.clk(clk),.reset_n(reset_n),.wr_en(wr_en),.sin(sync_in[ 1]),.fsm(fsm),.cycle(cycle[1:0]),.base_addr(wr_counter),.addr_offset(offset01),.wr_addr(wr_addr01),.ram_wr(wr01));
wr_cell wr_cell02(.clk(clk),.reset_n(reset_n),.wr_en(wr_en),.sin(sync_in[ 2]),.fsm(fsm),.cycle(cycle[1:0]),.base_addr(wr_counter),.addr_offset(offset02),.wr_addr(wr_addr02),.ram_wr(wr02));
wr_cell wr_cell03(.clk(clk),.reset_n(reset_n),.wr_en(wr_en),.sin(sync_in[ 3]),.fsm(fsm),.cycle(cycle[1:0]),.base_addr(wr_counter),.addr_offset(offset03),.wr_addr(wr_addr03),.ram_wr(wr03));
wr_cell wr_cell04(.clk(clk),.reset_n(reset_n),.wr_en(wr_en),.sin(sync_in[ 4]),.fsm(fsm),.cycle(cycle[1:0]),.base_addr(wr_counter),.addr_offset(offset04),.wr_addr(wr_addr04),.ram_wr(wr04));
wr_cell wr_cell05(.clk(clk),.reset_n(reset_n),.wr_en(wr_en),.sin(sync_in[ 5]),.fsm(fsm),.cycle(cycle[1:0]),.base_addr(wr_counter),.addr_offset(offset05),.wr_addr(wr_addr05),.ram_wr(wr05));
wr_cell wr_cell06(.clk(clk),.reset_n(reset_n),.wr_en(wr_en),.sin(sync_in[ 6]),.fsm(fsm),.cycle(cycle[1:0]),.base_addr(wr_counter),.addr_offset(offset06),.wr_addr(wr_addr06),.ram_wr(wr06));
wr_cell wr_cell07(.clk(clk),.reset_n(reset_n),.wr_en(wr_en),.sin(sync_in[ 7]),.fsm(fsm),.cycle(cycle[1:0]),.base_addr(wr_counter),.addr_offset(offset07),.wr_addr(wr_addr07),.ram_wr(wr07));
wr_cell wr_cell08(.clk(clk),.reset_n(reset_n),.wr_en(wr_en),.sin(sync_in[ 8]),.fsm(fsm),.cycle(cycle[1:0]),.base_addr(wr_counter),.addr_offset(offset08),.wr_addr(wr_addr08),.ram_wr(wr08));
wr_cell wr_cell09(.clk(clk),.reset_n(reset_n),.wr_en(wr_en),.sin(sync_in[ 9]),.fsm(fsm),.cycle(cycle[1:0]),.base_addr(wr_counter),.addr_offset(offset09),.wr_addr(wr_addr09),.ram_wr(wr09));
wr_cell wr_cell10(.clk(clk),.reset_n(reset_n),.wr_en(wr_en),.sin(sync_in[10]),.fsm(fsm),.cycle(cycle[1:0]),.base_addr(wr_counter),.addr_offset(offset10),.wr_addr(wr_addr10),.ram_wr(wr10));
wr_cell wr_cell11(.clk(clk),.reset_n(reset_n),.wr_en(wr_en),.sin(sync_in[11]),.fsm(fsm),.cycle(cycle[1:0]),.base_addr(wr_counter),.addr_offset(offset11),.wr_addr(wr_addr11),.ram_wr(wr11));
wr_cell wr_cell12(.clk(clk),.reset_n(reset_n),.wr_en(wr_en),.sin(sync_in[12]),.fsm(fsm),.cycle(cycle[1:0]),.base_addr(wr_counter),.addr_offset(offset12),.wr_addr(wr_addr12),.ram_wr(wr12));
wr_cell wr_cell13(.clk(clk),.reset_n(reset_n),.wr_en(wr_en),.sin(sync_in[13]),.fsm(fsm),.cycle(cycle[1:0]),.base_addr(wr_counter),.addr_offset(offset13),.wr_addr(wr_addr13),.ram_wr(wr13));
wr_cell wr_cell14(.clk(clk),.reset_n(reset_n),.wr_en(wr_en),.sin(sync_in[14]),.fsm(fsm),.cycle(cycle[1:0]),.base_addr(wr_counter),.addr_offset(offset14),.wr_addr(wr_addr14),.ram_wr(wr14));
wr_cell wr_cell15(.clk(clk),.reset_n(reset_n),.wr_en(wr_en),.sin(sync_in[15]),.fsm(fsm),.cycle(cycle[1:0]),.base_addr(wr_counter),.addr_offset(offset15),.wr_addr(wr_addr15),.ram_wr(wr15));
wr_cell wr_cell16(.clk(clk),.reset_n(reset_n),.wr_en(wr_en),.sin(sync_in[16]),.fsm(fsm),.cycle(cycle[1:0]),.base_addr(wr_counter),.addr_offset(offset16),.wr_addr(wr_addr16),.ram_wr(wr16));
wr_cell wr_cell17(.clk(clk),.reset_n(reset_n),.wr_en(wr_en),.sin(sync_in[17]),.fsm(fsm),.cycle(cycle[1:0]),.base_addr(wr_counter),.addr_offset(offset17),.wr_addr(wr_addr17),.ram_wr(wr17));
wr_cell wr_cell18(.clk(clk),.reset_n(reset_n),.wr_en(wr_en),.sin(sync_in[18]),.fsm(fsm),.cycle(cycle[1:0]),.base_addr(wr_counter),.addr_offset(offset18),.wr_addr(wr_addr18),.ram_wr(wr18));
wr_cell wr_cell19(.clk(clk),.reset_n(reset_n),.wr_en(wr_en),.sin(sync_in[19]),.fsm(fsm),.cycle(cycle[1:0]),.base_addr(wr_counter),.addr_offset(offset19),.wr_addr(wr_addr19),.ram_wr(wr19));
wr_cell wr_cell20(.clk(clk),.reset_n(reset_n),.wr_en(wr_en),.sin(sync_in[20]),.fsm(fsm),.cycle(cycle[1:0]),.base_addr(wr_counter),.addr_offset(offset20),.wr_addr(wr_addr20),.ram_wr(wr20));
wr_cell wr_cell21(.clk(clk),.reset_n(reset_n),.wr_en(wr_en),.sin(sync_in[21]),.fsm(fsm),.cycle(cycle[1:0]),.base_addr(wr_counter),.addr_offset(offset21),.wr_addr(wr_addr21),.ram_wr(wr21));
wr_cell wr_cell22(.clk(clk),.reset_n(reset_n),.wr_en(wr_en),.sin(sync_in[22]),.fsm(fsm),.cycle(cycle[1:0]),.base_addr(wr_counter),.addr_offset(offset22),.wr_addr(wr_addr22),.ram_wr(wr22));
wr_cell wr_cell23(.clk(clk),.reset_n(reset_n),.wr_en(wr_en),.sin(sync_in[23]),.fsm(fsm),.cycle(cycle[1:0]),.base_addr(wr_counter),.addr_offset(offset23),.wr_addr(wr_addr23),.ram_wr(wr23));
wr_cell wr_cell24(.clk(clk),.reset_n(reset_n),.wr_en(wr_en),.sin(sync_in[24]),.fsm(fsm),.cycle(cycle[1:0]),.base_addr(wr_counter),.addr_offset(offset24),.wr_addr(wr_addr24),.ram_wr(wr24));
wr_cell wr_cell25(.clk(clk),.reset_n(reset_n),.wr_en(wr_en),.sin(sync_in[25]),.fsm(fsm),.cycle(cycle[1:0]),.base_addr(wr_counter),.addr_offset(offset25),.wr_addr(wr_addr25),.ram_wr(wr25));
wr_cell wr_cell26(.clk(clk),.reset_n(reset_n),.wr_en(wr_en),.sin(sync_in[26]),.fsm(fsm),.cycle(cycle[1:0]),.base_addr(wr_counter),.addr_offset(offset26),.wr_addr(wr_addr26),.ram_wr(wr26));
wr_cell wr_cell27(.clk(clk),.reset_n(reset_n),.wr_en(wr_en),.sin(sync_in[27]),.fsm(fsm),.cycle(cycle[1:0]),.base_addr(wr_counter),.addr_offset(offset27),.wr_addr(wr_addr27),.ram_wr(wr27));
wr_cell wr_cell28(.clk(clk),.reset_n(reset_n),.wr_en(wr_en),.sin(sync_in[28]),.fsm(fsm),.cycle(cycle[1:0]),.base_addr(wr_counter),.addr_offset(offset28),.wr_addr(wr_addr28),.ram_wr(wr28));
wr_cell wr_cell29(.clk(clk),.reset_n(reset_n),.wr_en(wr_en),.sin(sync_in[29]),.fsm(fsm),.cycle(cycle[1:0]),.base_addr(wr_counter),.addr_offset(offset29),.wr_addr(wr_addr29),.ram_wr(wr29));
wr_cell wr_cell30(.clk(clk),.reset_n(reset_n),.wr_en(wr_en),.sin(sync_in[30]),.fsm(fsm),.cycle(cycle[1:0]),.base_addr(wr_counter),.addr_offset(offset30),.wr_addr(wr_addr30),.ram_wr(wr30));
wr_cell wr_cell31(.clk(clk),.reset_n(reset_n),.wr_en(wr_en),.sin(sync_in[31]),.fsm(fsm),.cycle(cycle[1:0]),.base_addr(wr_counter),.addr_offset(offset31),.wr_addr(wr_addr31),.ram_wr(wr31));
wr_cell wr_cell32(.clk(clk),.reset_n(reset_n),.wr_en(wr_en),.sin(sync_in[32]),.fsm(fsm),.cycle(cycle[1:0]),.base_addr(wr_counter),.addr_offset(offset32),.wr_addr(wr_addr32),.ram_wr(wr32));
wr_cell wr_cell33(.clk(clk),.reset_n(reset_n),.wr_en(wr_en),.sin(sync_in[33]),.fsm(fsm),.cycle(cycle[1:0]),.base_addr(wr_counter),.addr_offset(offset33),.wr_addr(wr_addr33),.ram_wr(wr33));
wr_cell wr_cell34(.clk(clk),.reset_n(reset_n),.wr_en(wr_en),.sin(sync_in[34]),.fsm(fsm),.cycle(cycle[1:0]),.base_addr(wr_counter),.addr_offset(offset34),.wr_addr(wr_addr34),.ram_wr(wr34));
wr_cell wr_cell35(.clk(clk),.reset_n(reset_n),.wr_en(wr_en),.sin(sync_in[35]),.fsm(fsm),.cycle(cycle[1:0]),.base_addr(wr_counter),.addr_offset(offset35),.wr_addr(wr_addr35),.ram_wr(wr35));

rd_seq rd_seq(.clk(clk),.reset_n(reset_n),.rate(rate),.fsm(fsm),.out_addr(out_addr),.out_rd_en(out_rd_en),.out_rd_sel(out_rd_sel));

endmodule

//Module
`timescale 1 ns / 1 ps
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

`timescale 1 ns / 1 ps
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

`timescale 1 ns / 1 ps
module data_cell(
    clk,
    reset_n,
    fsm,
    sin,
    din,
    vtc_en,
    dvtc_a,
    dvtc_b,
    dvtc_c,

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

output  [D_WID-1:0]   ram_d      ;
reg     [D_WID-1:0]   ram_d      ;

always @ (posedge clk or negedge reset_n)
begin : ram_d_r
    if(!reset_n)
        ram_d <= #1 {D_WID{1'b0}};
    else if(fsm[1] & sin) 
        ram_d <= #1 din;
    else if(fsm[2]) begin
        if(vtc_en[0])
        ram_d <= #1 dvtc_a;
        if(vtc_en[1])
        ram_d <= #1 dvtc_b;
        if(vtc_en[2]) 
        ram_d <= #1 dvtc_c; 
        end
end    

endmodule

`timescale 1 ns / 1 ps
module data_cell1(
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
//wire    [D_WID-1:0]   temp2      ;
wire    [D_WID-1:0]   temp3      ;

assign temp1 = dvtc_a - d_last ;
//assign temp2 = dvtc_b - d_last ;
assign temp3 = dvtc_c + temp1 ; 

always @ (posedge clk or negedge reset_n)
begin : ram_d_r
    if(!reset_n)
        ram_d <= #1 {D_WID{1'b0}};
    else if(fsm[1] & sin) 
        ram_d <= #1 din;
    else if(fsm[2]) begin
//        if(vtc_en[0])
//        ram_d <= #1 dvtc_a;
        if(vtc_en[1])
        ram_d <= #1 dvtc_b;
        if(vtc_en[2]) 
        ram_d <= #1 temp3; 
        end
end    

endmodule

`timescale 1 ns / 1 ps
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

`timescale 1 ns / 1 ps
module data_comp(
    clk    ,
    reset_n,
    fsm    ,
    cycle  ,
    iter_0 ,
    rate   ,
    sync_in,
    data_in,
    ctv_out,
    sigma_vnu,
    dout00 ,
    dout01 ,
    dout02 ,
    dout03 ,
    dout04 ,
    dout05 ,
    dout06 ,
    dout07 ,
    dout08 ,
    dout09 ,
    dout10 ,
    dout11 ,
    dout12 ,
    dout13 ,
    dout14 ,
    dout15 ,
    dout16 ,
    dout17 ,
    dout18 ,
    dout19 ,
    dout20 ,
    dout21 ,
    dout22 ,
    dout23 ,
    dout24 ,
    dout25 ,
    dout26 ,
    dout27 ,
    dout28 ,
    dout29 ,
    dout30 ,
    dout31 ,
    dout32 ,
    dout33 ,
    dout34 ,
    dout35 ,
    din00 ,
    din01 ,
    din02 ,
    din03 ,
    din04 ,
    din05 ,
    din06 ,
    din07 ,
    din08 ,
    din09 ,
    din10 ,
    din11 ,
    din12 ,
    din13 ,
    din14 ,
    din15 ,
    din16 ,
    din17 ,
    din18 ,
    din19 ,
    din20 ,
    din21 ,
    din22 ,
    din23 ,
    din24 ,
    din25 ,
    din26 ,
    din27 ,
    din28 ,
    din29 ,
    din30 ,
    din31 ,
    din32 ,
    din33 ,
    din34 ,
    din35 ,
    mem0_in,
    mem1_in,
    mem2_in,
    mem0_out,
    mem1_out,
    mem2_out
);

//Parameter
parameter D_WID = 8;

//Input ports
input                 clk        ;
input                 reset_n    ;
input   [3:0]         fsm        ;
input                 rate       ;
input   [1:0]         cycle      ;
input                 iter_0     ;
input   [35:0]        sync_in    ;
input   [D_WID-1:0]   data_in    ;

input   [D_WID-1:0]   dout00     ;
input   [D_WID-1:0]   dout01     ;
input   [D_WID-1:0]   dout02     ;
input   [D_WID-1:0]   dout03     ;
input   [D_WID-1:0]   dout04     ;
input   [D_WID-1:0]   dout05     ;
input   [D_WID-1:0]   dout06     ;
input   [D_WID-1:0]   dout07     ;
input   [D_WID-1:0]   dout08     ;
input   [D_WID-1:0]   dout09     ;
input   [D_WID-1:0]   dout10     ;
input   [D_WID-1:0]   dout11     ;
input   [D_WID-1:0]   dout12     ;
input   [D_WID-1:0]   dout13     ;
input   [D_WID-1:0]   dout14     ;
input   [D_WID-1:0]   dout15     ;
input   [D_WID-1:0]   dout16     ;
input   [D_WID-1:0]   dout17     ;
input   [D_WID-1:0]   dout18     ;
input   [D_WID-1:0]   dout19     ;
input   [D_WID-1:0]   dout20     ;
input   [D_WID-1:0]   dout21     ;
input   [D_WID-1:0]   dout22     ;
input   [D_WID-1:0]   dout23     ;
input   [D_WID-1:0]   dout24     ;
input   [D_WID-1:0]   dout25     ;
input   [D_WID-1:0]   dout26     ;
input   [D_WID-1:0]   dout27     ;
input   [D_WID-1:0]   dout28     ;
input   [D_WID-1:0]   dout29     ;
input   [D_WID-1:0]   dout30     ;
input   [D_WID-1:0]   dout31     ;
input   [D_WID-1:0]   dout32     ;
input   [D_WID-1:0]   dout33     ;
input   [D_WID-1:0]   dout34     ;
input   [D_WID-1:0]   dout35     ;
input  [4*D_WID+19:0] mem0_out   ; 
input  [4*D_WID+19:0] mem1_out   ; 
input  [4*D_WID+19:0] mem2_out   ; 

//Output ports
output                ctv_out   ;
output                sigma_vnu ;
output  [D_WID-1:0]   din00     ;
output  [D_WID-1:0]   din01     ;
output  [D_WID-1:0]   din02     ;
output  [D_WID-1:0]   din03     ;
output  [D_WID-1:0]   din04     ;
output  [D_WID-1:0]   din05     ;
output  [D_WID-1:0]   din06     ;
output  [D_WID-1:0]   din07     ;
output  [D_WID-1:0]   din08     ;
output  [D_WID-1:0]   din09     ;
output  [D_WID-1:0]   din10     ;
output  [D_WID-1:0]   din11     ;
output  [D_WID-1:0]   din12     ;
output  [D_WID-1:0]   din13     ;
output  [D_WID-1:0]   din14     ;
output  [D_WID-1:0]   din15     ;
output  [D_WID-1:0]   din16     ;
output  [D_WID-1:0]   din17     ;
output  [D_WID-1:0]   din18     ;
output  [D_WID-1:0]   din19     ;
output  [D_WID-1:0]   din20     ;
output  [D_WID-1:0]   din21     ;
output  [D_WID-1:0]   din22     ;
output  [D_WID-1:0]   din23     ;
output  [D_WID-1:0]   din24     ;
output  [D_WID-1:0]   din25     ;
output  [D_WID-1:0]   din26     ;
output  [D_WID-1:0]   din27     ;
output  [D_WID-1:0]   din28     ;
output  [D_WID-1:0]   din29     ;
output  [D_WID-1:0]   din30     ;
output  [D_WID-1:0]   din31     ;
output  [D_WID-1:0]   din32     ;
output  [D_WID-1:0]   din33     ;
output  [D_WID-1:0]   din34     ;
output  [D_WID-1:0]   din35     ;
output [4*D_WID+19:0] mem0_in   ; 
output [4*D_WID+19:0] mem1_in   ; 
output [4*D_WID+19:0] mem2_in   ; 


reg     [1:0]         cycle_dly  ;
reg     [1:0]         cycle_dly2 ;
reg     [2:0]         vtc_en     ;
reg     [6:0]         cnu_in     ;
reg     [D_WID-1:0]   data_buffer0a     ;
reg     [D_WID-1:0]   data_buffer1a     ;
reg     [D_WID-1:0]   data_buffer2a     ;
reg     [D_WID-1:0]   data_buffer3a     ;
reg     [D_WID-1:0]   data_buffer4a     ;
reg     [D_WID-1:0]   data_buffer5a     ;
reg     [D_WID-1:0]   data_buffer6a     ;
reg     [D_WID-1:0]   data_buffer7a     ;
reg     [D_WID-1:0]   data_buffer8a     ;
reg     [D_WID-1:0]   data_buffer9a     ;
reg     [D_WID-1:0]   data_buffer10a    ;
reg     [D_WID-1:0]   data_buffer11a    ;
reg     [D_WID-1:0]   data_buffer12a    ;
reg     [D_WID-1:0]   data_buffer13a    ;
reg     [D_WID-1:0]   data_buffer14a    ;
reg     [D_WID-1:0]   data_buffer15a    ;
reg     [D_WID-1:0]   data_buffer16a    ;
reg     [D_WID-1:0]   data_buffer17a    ;
reg     [D_WID-1:0]   data_buffer18a    ;
reg     [D_WID-1:0]   data_buffer19a    ;
reg     [D_WID-1:0]   data_buffer20a    ;
reg     [D_WID-1:0]   data_buffer21a    ;
reg     [D_WID-1:0]   data_buffer22a    ;
reg     [D_WID-1:0]   data_buffer23a    ;
reg     [D_WID-1:0]   data_buffer24a    ;
reg     [D_WID-1:0]   data_buffer25a    ;
reg     [D_WID-1:0]   data_buffer26a    ;
reg     [D_WID-1:0]   data_buffer27a    ;
reg     [D_WID-1:0]   data_buffer28a    ;
reg     [D_WID-1:0]   data_buffer29a    ;
reg     [D_WID-1:0]   data_buffer30a    ;
reg     [D_WID-1:0]   data_buffer31a    ;
reg     [D_WID-1:0]   data_buffer32a    ;
reg     [D_WID-1:0]   data_buffer33a    ;
reg     [D_WID-1:0]   data_buffer34a    ;
reg     [D_WID-1:0]   data_buffer35a    ;
reg     [D_WID-1:0]   data_buffer0b     ;
reg     [D_WID-1:0]   data_buffer1b     ;
reg     [D_WID-1:0]   data_buffer2b     ;
reg     [D_WID-1:0]   data_buffer3b     ;
reg     [D_WID-1:0]   data_buffer4b     ;
reg     [D_WID-1:0]   data_buffer5b     ;
reg     [D_WID-1:0]   data_buffer6b     ;
reg     [D_WID-1:0]   data_buffer7b     ;
reg     [D_WID-1:0]   data_buffer8b     ;
reg     [D_WID-1:0]   data_buffer9b     ;
reg     [D_WID-1:0]   data_buffer10b    ;
reg     [D_WID-1:0]   data_buffer11b    ;
reg     [D_WID-1:0]   data_buffer12b    ;
reg     [D_WID-1:0]   data_buffer13b    ;
reg     [D_WID-1:0]   data_buffer14b    ;
reg     [D_WID-1:0]   data_buffer15b    ;
reg     [D_WID-1:0]   data_buffer16b    ;
reg     [D_WID-1:0]   data_buffer17b    ;
reg     [D_WID-1:0]   data_buffer18b    ;
reg     [D_WID-1:0]   data_buffer19b    ;
reg     [D_WID-1:0]   data_buffer20b    ;
reg     [D_WID-1:0]   data_buffer21b    ;
reg     [D_WID-1:0]   data_buffer22b    ;
reg     [D_WID-1:0]   data_buffer23b    ;
reg     [D_WID-1:0]   data_buffer24b    ;
reg     [D_WID-1:0]   data_buffer25b    ;
reg     [D_WID-1:0]   data_buffer26b    ;
reg     [D_WID-1:0]   data_buffer27b    ;
reg     [D_WID-1:0]   data_buffer28b    ;
reg     [D_WID-1:0]   data_buffer29b    ;
reg     [D_WID-1:0]   data_buffer30b    ;
reg     [D_WID-1:0]   data_buffer31b    ;
reg     [D_WID-1:0]   data_buffer32b    ;
reg     [D_WID-1:0]   data_buffer33b    ;
reg     [D_WID-1:0]   data_buffer34b    ;
reg     [D_WID-1:0]   data_buffer35b    ;
reg     [D_WID-1:0]   data_buffer0c     ;
reg     [D_WID-1:0]   data_buffer1c     ;
reg     [D_WID-1:0]   data_buffer2c     ;
reg     [D_WID-1:0]   data_buffer3c     ;
reg     [D_WID-1:0]   data_buffer4c     ;
reg     [D_WID-1:0]   data_buffer5c     ;
reg     [D_WID-1:0]   data_buffer6c     ;
reg     [D_WID-1:0]   data_buffer7c     ;
reg     [D_WID-1:0]   data_buffer8c     ;
reg     [D_WID-1:0]   data_buffer9c     ;
reg     [D_WID-1:0]   data_buffer10c    ;
reg     [D_WID-1:0]   data_buffer11c    ;
reg     [D_WID-1:0]   data_buffer12c    ;
reg     [D_WID-1:0]   data_buffer13c    ;
reg     [D_WID-1:0]   data_buffer14c    ;
reg     [D_WID-1:0]   data_buffer15c    ;
reg     [D_WID-1:0]   data_buffer16c    ;
reg     [D_WID-1:0]   data_buffer17c    ;
reg     [D_WID-1:0]   data_buffer18c    ;
reg     [D_WID-1:0]   data_buffer19c    ;
reg     [D_WID-1:0]   data_buffer20c    ;
reg     [D_WID-1:0]   data_buffer21c    ;
reg     [D_WID-1:0]   data_buffer22c    ;
reg     [D_WID-1:0]   data_buffer23c    ;
reg     [D_WID-1:0]   data_buffer24c    ;
reg     [D_WID-1:0]   data_buffer25c    ;
reg     [D_WID-1:0]   data_buffer26c    ;
reg     [D_WID-1:0]   data_buffer27c    ;
reg     [D_WID-1:0]   data_buffer28c    ;
reg     [D_WID-1:0]   data_buffer29c    ;
reg     [D_WID-1:0]   data_buffer30c    ;
reg     [D_WID-1:0]   data_buffer31c    ;
reg     [D_WID-1:0]   data_buffer32c    ;
reg     [D_WID-1:0]   data_buffer33c    ;
reg     [D_WID-1:0]   data_buffer34c    ;
reg     [D_WID-1:0]   data_buffer35c    ;
reg     [D_WID-1:0]   dvtc_0a           ;
reg     [D_WID-1:0]   dvtc_1a           ;
reg     [D_WID-1:0]   dvtc_2a           ;
reg     [D_WID-1:0]   dvtc_3a           ;
reg     [D_WID-1:0]   dvtc_4a           ;
reg     [D_WID-1:0]   dvtc_5a           ;
reg     [D_WID-1:0]   dvtc_6a           ;
reg     [D_WID-1:0]   dvtc_7a           ;
reg     [D_WID-1:0]   dvtc_8a           ;
reg     [D_WID-1:0]   dvtc_9a           ;
reg     [D_WID-1:0]   dvtc_10a          ;
reg     [D_WID-1:0]   dvtc_11a          ;
reg     [D_WID-1:0]   dvtc_12a          ;
reg     [D_WID-1:0]   dvtc_13a          ;
reg     [D_WID-1:0]   dvtc_14a          ;
reg     [D_WID-1:0]   dvtc_15a          ;
reg     [D_WID-1:0]   dvtc_16a          ;
reg     [D_WID-1:0]   dvtc_17a          ;
reg     [D_WID-1:0]   dvtc_18a          ;
reg     [D_WID-1:0]   dvtc_19a          ;
reg     [D_WID-1:0]   dvtc_20a          ;
reg     [D_WID-1:0]   dvtc_21a          ;
reg     [D_WID-1:0]   dvtc_22a          ;
reg     [D_WID-1:0]   dvtc_23a          ;
reg     [D_WID-1:0]   dvtc_24a          ;
reg     [D_WID-1:0]   dvtc_25a          ;
reg     [D_WID-1:0]   dvtc_26a          ;
reg     [D_WID-1:0]   dvtc_27a          ;
reg     [D_WID-1:0]   dvtc_28a          ;
reg     [D_WID-1:0]   dvtc_29a          ;
reg     [D_WID-1:0]   dvtc_30a          ;
reg     [D_WID-1:0]   dvtc_31a          ;
reg     [D_WID-1:0]   dvtc_32a          ;
reg     [D_WID-1:0]   dvtc_33a          ;
reg     [D_WID-1:0]   dvtc_34a          ;
reg     [D_WID-1:0]   dvtc_35a          ;
reg     [D_WID-1:0]   dvtc_0b           ;
reg     [D_WID-1:0]   dvtc_1b           ;
reg     [D_WID-1:0]   dvtc_2b           ;
reg     [D_WID-1:0]   dvtc_3b           ;
reg     [D_WID-1:0]   dvtc_4b           ;
reg     [D_WID-1:0]   dvtc_5b           ;
reg     [D_WID-1:0]   dvtc_6b           ;
reg     [D_WID-1:0]   dvtc_7b           ;
reg     [D_WID-1:0]   dvtc_8b           ;
reg     [D_WID-1:0]   dvtc_9b           ;
reg     [D_WID-1:0]   dvtc_10b          ;
reg     [D_WID-1:0]   dvtc_11b          ;
reg     [D_WID-1:0]   dvtc_12b          ;
reg     [D_WID-1:0]   dvtc_13b          ;
reg     [D_WID-1:0]   dvtc_14b          ;
reg     [D_WID-1:0]   dvtc_15b          ;
reg     [D_WID-1:0]   dvtc_16b          ;
reg     [D_WID-1:0]   dvtc_17b          ;
reg     [D_WID-1:0]   dvtc_18b          ;
reg     [D_WID-1:0]   dvtc_19b          ;
reg     [D_WID-1:0]   dvtc_20b          ;
reg     [D_WID-1:0]   dvtc_21b          ;
reg     [D_WID-1:0]   dvtc_22b          ;
reg     [D_WID-1:0]   dvtc_23b          ;
reg     [D_WID-1:0]   dvtc_24b          ;
reg     [D_WID-1:0]   dvtc_25b          ;
reg     [D_WID-1:0]   dvtc_26b          ;
reg     [D_WID-1:0]   dvtc_27b          ;
reg     [D_WID-1:0]   dvtc_28b          ;
reg     [D_WID-1:0]   dvtc_29b          ;
reg     [D_WID-1:0]   dvtc_30b          ;
reg     [D_WID-1:0]   dvtc_31b          ;
reg     [D_WID-1:0]   dvtc_32b          ;
reg     [D_WID-1:0]   dvtc_33b          ;
reg     [D_WID-1:0]   dvtc_34b          ;
reg     [D_WID-1:0]   dvtc_35b          ;
reg     [D_WID-1:0]   dvtc_0c           ;
reg     [D_WID-1:0]   dvtc_1c           ;
reg     [D_WID-1:0]   dvtc_2c           ;
reg     [D_WID-1:0]   dvtc_3c           ;
reg     [D_WID-1:0]   dvtc_4c           ;
reg     [D_WID-1:0]   dvtc_5c           ;
reg     [D_WID-1:0]   dvtc_6c           ;
reg     [D_WID-1:0]   dvtc_7c           ;
reg     [D_WID-1:0]   dvtc_8c           ;
reg     [D_WID-1:0]   dvtc_9c           ;
reg     [D_WID-1:0]   dvtc_10c          ;
reg     [D_WID-1:0]   dvtc_11c          ;
reg     [D_WID-1:0]   dvtc_12c          ;
reg     [D_WID-1:0]   dvtc_13c          ;
reg     [D_WID-1:0]   dvtc_14c          ;
reg     [D_WID-1:0]   dvtc_15c          ;
reg     [D_WID-1:0]   dvtc_16c          ;
reg     [D_WID-1:0]   dvtc_17c          ;
reg     [D_WID-1:0]   dvtc_18c          ;
reg     [D_WID-1:0]   dvtc_19c          ;
reg     [D_WID-1:0]   dvtc_20c          ;
reg     [D_WID-1:0]   dvtc_21c          ;
reg     [D_WID-1:0]   dvtc_22c          ;
reg     [D_WID-1:0]   dvtc_23c          ;
reg     [D_WID-1:0]   dvtc_24c          ;
reg     [D_WID-1:0]   dvtc_25c          ;
reg     [D_WID-1:0]   dvtc_26c          ;
reg     [D_WID-1:0]   dvtc_27c          ;
reg     [D_WID-1:0]   dvtc_28c          ;
reg     [D_WID-1:0]   dvtc_29c          ;
reg     [D_WID-1:0]   dvtc_30c          ;
reg     [D_WID-1:0]   dvtc_31c          ;
reg     [D_WID-1:0]   dvtc_32c          ;
reg     [D_WID-1:0]   dvtc_33c          ;
reg     [D_WID-1:0]   dvtc_34c          ;
reg     [D_WID-1:0]   dvtc_35c          ;

reg     [D_WID-1:0]   data_out0a     ;
reg     [D_WID-1:0]   data_out1a     ;
reg     [D_WID-1:0]   data_out2a     ;
reg     [D_WID-1:0]   data_out3a     ;
reg     [D_WID-1:0]   data_out4a     ;
reg     [D_WID-1:0]   data_out5a     ;
reg     [D_WID-1:0]   data_out6a     ;
reg     [D_WID-1:0]   data_out7a     ;
reg     [D_WID-1:0]   data_out8a     ;
reg     [D_WID-1:0]   data_out9a     ;
reg     [D_WID-1:0]   data_out10a    ;
reg     [D_WID-1:0]   data_out11a    ;
reg     [D_WID-1:0]   data_out12a    ;
reg     [D_WID-1:0]   data_out13a    ;
reg     [D_WID-1:0]   data_out14a    ;
reg     [D_WID-1:0]   data_out15a    ;
reg     [D_WID-1:0]   data_out16a    ;
reg     [D_WID-1:0]   data_out17a    ;
reg     [D_WID-1:0]   data_out18a    ;
reg     [D_WID-1:0]   data_out19a    ;
reg     [D_WID-1:0]   data_out20a    ;
reg     [D_WID-1:0]   data_out21a    ;
reg     [D_WID-1:0]   data_out22a    ;
reg     [D_WID-1:0]   data_out23a    ;
reg     [D_WID-1:0]   data_out24a    ;
reg     [D_WID-1:0]   data_out25a    ;
reg     [D_WID-1:0]   data_out26a    ;
reg     [D_WID-1:0]   data_out27a    ;
reg     [D_WID-1:0]   data_out28a    ;
reg     [D_WID-1:0]   data_out29a    ;
reg     [D_WID-1:0]   data_out30a    ;
reg     [D_WID-1:0]   data_out31a    ;
reg     [D_WID-1:0]   data_out32a    ;
reg     [D_WID-1:0]   data_out33a    ;
reg     [D_WID-1:0]   data_out34a    ;
reg     [D_WID-1:0]   data_out35a    ;
reg     [D_WID-1:0]   data_out0b     ;
reg     [D_WID-1:0]   data_out1b     ;
reg     [D_WID-1:0]   data_out2b     ;
reg     [D_WID-1:0]   data_out3b     ;
reg     [D_WID-1:0]   data_out4b     ;
reg     [D_WID-1:0]   data_out5b     ;
reg     [D_WID-1:0]   data_out6b     ;
reg     [D_WID-1:0]   data_out7b     ;
reg     [D_WID-1:0]   data_out8b     ;
reg     [D_WID-1:0]   data_out9b     ;
reg     [D_WID-1:0]   data_out10b    ;
reg     [D_WID-1:0]   data_out11b    ;
reg     [D_WID-1:0]   data_out12b    ;
reg     [D_WID-1:0]   data_out13b    ;
reg     [D_WID-1:0]   data_out14b    ;
reg     [D_WID-1:0]   data_out15b    ;
reg     [D_WID-1:0]   data_out16b    ;
reg     [D_WID-1:0]   data_out17b    ;
reg     [D_WID-1:0]   data_out18b    ;
reg     [D_WID-1:0]   data_out19b    ;
reg     [D_WID-1:0]   data_out20b    ;
reg     [D_WID-1:0]   data_out21b    ;
reg     [D_WID-1:0]   data_out22b    ;
reg     [D_WID-1:0]   data_out23b    ;
reg     [D_WID-1:0]   data_out24b    ;
reg     [D_WID-1:0]   data_out25b    ;
reg     [D_WID-1:0]   data_out26b    ;
reg     [D_WID-1:0]   data_out27b    ;
reg     [D_WID-1:0]   data_out28b    ;
reg     [D_WID-1:0]   data_out29b    ;
reg     [D_WID-1:0]   data_out30b    ;
reg     [D_WID-1:0]   data_out31b    ;
reg     [D_WID-1:0]   data_out32b    ;
reg     [D_WID-1:0]   data_out33b    ;
reg     [D_WID-1:0]   data_out34b    ;
reg     [D_WID-1:0]   data_out35b    ;
reg     [D_WID-1:0]   data_out0c     ;
reg     [D_WID-1:0]   data_out1c     ;
reg     [D_WID-1:0]   data_out2c     ;
reg     [D_WID-1:0]   data_out3c     ;
reg     [D_WID-1:0]   data_out4c     ;
reg     [D_WID-1:0]   data_out5c     ;
reg     [D_WID-1:0]   data_out6c     ;
reg     [D_WID-1:0]   data_out7c     ;
reg     [D_WID-1:0]   data_out8c     ;
reg     [D_WID-1:0]   data_out9c     ;
reg     [D_WID-1:0]   data_out10c    ;
reg     [D_WID-1:0]   data_out11c    ;
reg     [D_WID-1:0]   data_out12c    ;
reg     [D_WID-1:0]   data_out13c    ;
reg     [D_WID-1:0]   data_out14c    ;
reg     [D_WID-1:0]   data_out15c    ;
reg     [D_WID-1:0]   data_out16c    ;
reg     [D_WID-1:0]   data_out17c    ;
reg     [D_WID-1:0]   data_out18c    ;
reg     [D_WID-1:0]   data_out19c    ;
reg     [D_WID-1:0]   data_out20c    ;
reg     [D_WID-1:0]   data_out21c    ;
reg     [D_WID-1:0]   data_out22c    ;
reg     [D_WID-1:0]   data_out23c    ;
reg     [D_WID-1:0]   data_out24c    ;
reg     [D_WID-1:0]   data_out25c    ;
reg     [D_WID-1:0]   data_out26c    ;
reg     [D_WID-1:0]   data_out27c    ;
reg     [D_WID-1:0]   data_out28c    ;
reg     [D_WID-1:0]   data_out29c    ;
reg     [D_WID-1:0]   data_out30c    ;
reg     [D_WID-1:0]   data_out31c    ;
reg     [D_WID-1:0]   data_out32c    ;
reg     [D_WID-1:0]   data_out33c    ;
reg     [D_WID-1:0]   data_out34c    ;
reg     [D_WID-1:0]   data_out35c    ;
reg     [D_WID-1:0]   data_0     ;
reg     [D_WID-1:0]   data_1     ;
reg     [D_WID-1:0]   data_2     ;
reg     [D_WID-1:0]   data_3     ;
reg     [D_WID-1:0]   data_4     ;
reg     [D_WID-1:0]   data_5     ;
reg     [D_WID-1:0]   data_6     ;
reg     [D_WID-1:0]   data_7     ;
reg     [D_WID-1:0]   data_8     ;
reg     [D_WID-1:0]   data_0d    ; 
reg     [D_WID-1:0]   data_1d    ; 
reg     [D_WID-1:0]   data_2d    ; 
reg     [D_WID-1:0]   data_3d    ; 
reg     [D_WID-1:0]   data_4d    ; 
reg     [D_WID-1:0]   data_5d    ; 
reg     [D_WID-1:0]   data_6d    ; 
reg     [D_WID-1:0]   data_7d    ; 
reg     [D_WID-1:0]   data_8d    ; 
reg     [D_WID-1:0]   data_0d2   ;  
reg     [D_WID-1:0]   data_1d2   ;  
reg     [D_WID-1:0]   data_2d2   ;  
reg     [D_WID-1:0]   data_3d2   ;  
reg     [D_WID-1:0]   data_4d2   ;  
reg     [D_WID-1:0]   data_5d2   ;  
reg     [D_WID-1:0]   data_6d2   ;  
reg     [D_WID-1:0]   data_7d2   ;  
reg     [D_WID-1:0]   data_8d2   ;  
reg   [6*D_WID-1:0]   vnu0_d     ;
reg   [6*D_WID-1:0]   vnu1_d     ;
reg   [6*D_WID-1:0]   vnu2_d     ;
reg   [6*D_WID-1:0]   vnu3_d     ;
reg   [6*D_WID-1:0]   vnu4_d     ;
reg   [6*D_WID-1:0]   vnu5_d     ;
reg   [6*D_WID-1:0]   vnu6_d     ;
reg   [6*D_WID-1:0]   vnu7_d     ;
reg   [6*D_WID-1:0]   vnu8_d     ;
reg   [6*D_WID-1:0]   vnu9_d     ;
reg   [6*D_WID-1:0]   vnua_d     ;
reg   [6*D_WID-1:0]   vnub_d     ;
reg   [6*D_WID-1:0]   vnuc_d     ;
reg   [6*D_WID-1:0]   vnud_d     ;
reg   [6*D_WID-1:0]   vnue_d     ;
reg   [6*D_WID-1:0]   vnuf_d     ;
reg   [6*D_WID-1:0]   vnug_d     ;
reg   [6*D_WID-1:0]   vnuh_d     ;
reg     [17:0]        sign_vnu   ;
reg                   sigma_vnu  ;

wire  [2*D_WID+9:0]   cnu0_d     ;
wire  [2*D_WID+9:0]   cnu1_d     ;
wire  [2*D_WID+9:0]   cnu2_d     ;
wire  [2*D_WID+9:0]   cnu3_d     ;
wire  [2*D_WID+9:0]   cnu4_d     ;
wire  [2*D_WID+9:0]   cnu5_d     ;
wire  [2*D_WID+9:0]   cnu6_d     ;
wire  [2*D_WID+9:0]   cnu7_d     ;
wire  [2*D_WID+9:0]   cnu8_d     ;
wire  [2*D_WID+9:0]   cnu9_d     ;
wire  [2*D_WID+9:0]   cnua_d     ;
wire  [2*D_WID+9:0]   cnub_d     ;
wire  [2*D_WID+9:0]   cnuc_d     ;
wire  [2*D_WID+9:0]   cnud_d     ;
wire  [2*D_WID+9:0]   cnue_d     ;
wire  [2*D_WID+9:0]   cnuf_d     ;
wire  [2*D_WID+9:0]   cnug_d     ;
wire  [2*D_WID+9:0]   cnuh_d     ;
wire  [6*D_WID-1:0]   vnu0_q     ;
wire  [6*D_WID-1:0]   vnu1_q     ;
wire  [6*D_WID-1:0]   vnu2_q     ;
wire  [6*D_WID-1:0]   vnu3_q     ;
wire  [6*D_WID-1:0]   vnu4_q     ;
wire  [6*D_WID-1:0]   vnu5_q     ;
wire  [6*D_WID-1:0]   vnu6_q     ;
wire  [6*D_WID-1:0]   vnu7_q     ;
wire  [6*D_WID-1:0]   vnu8_q     ;
wire  [6*D_WID-1:0]   vnu9_q     ;
wire  [6*D_WID-1:0]   vnua_q     ;
wire  [6*D_WID-1:0]   vnub_q     ;
wire  [6*D_WID-1:0]   vnuc_q     ;
wire  [6*D_WID-1:0]   vnud_q     ;
wire  [6*D_WID-1:0]   vnue_q     ;
wire  [6*D_WID-1:0]   vnuf_q     ;
wire  [6*D_WID-1:0]   vnug_q     ;
wire  [6*D_WID-1:0]   vnuh_q     ;
wire  [2*D_WID+9:0]   cnu0_q     ;
wire  [2*D_WID+9:0]   cnu1_q     ;
wire  [2*D_WID+9:0]   cnu2_q     ;
wire  [2*D_WID+9:0]   cnu3_q     ;
wire  [2*D_WID+9:0]   cnu4_q     ;
wire  [2*D_WID+9:0]   cnu5_q     ;
wire  [2*D_WID+9:0]   cnu6_q     ;
wire  [2*D_WID+9:0]   cnu7_q     ;
wire  [2*D_WID+9:0]   cnu8_q     ;
wire  [2*D_WID+9:0]   cnu9_q     ;
wire  [2*D_WID+9:0]   cnua_q     ;
wire  [2*D_WID+9:0]   cnub_q     ;
wire  [2*D_WID+9:0]   cnuc_q     ;
wire  [2*D_WID+9:0]   cnud_q     ;
wire  [2*D_WID+9:0]   cnue_q     ;
wire  [2*D_WID+9:0]   cnuf_q     ;
wire  [2*D_WID+9:0]   cnug_q     ;
wire  [2*D_WID+9:0]   cnuh_q     ;

assign ctv_out = cnu_in[5];

always @ (posedge clk or negedge reset_n)
begin : cycle_dly_r
    if(!reset_n)
        cycle_dly <= #1 2'b0;
    else
        cycle_dly <= #1 cycle;
end

always @ (posedge clk or negedge reset_n)
begin : cycle_d2_r
    if(!reset_n)
        cycle_dly2 <= #1 2'b0;
    else
        cycle_dly2 <= #1 cycle_dly;
end

always @ (posedge clk or negedge reset_n)
begin : cnu_init_r
    if(!reset_n)
        cnu_in <= #1 7'h0;
    else
        cnu_in <= #1 { cnu_in[5:0], (( cycle_dly == 2'b11 ) ? 1'b1 : 1'b0)};
end         

always @ (posedge clk or negedge reset_n)
begin : data_buffer_ar
    if(!reset_n) begin
        data_buffer0a  <= #1 8'h0;
        data_buffer1a  <= #1 8'h0;
        data_buffer2a  <= #1 8'h0;
        data_buffer3a  <= #1 8'h0;
        data_buffer4a  <= #1 8'h0;
        data_buffer5a  <= #1 8'h0;
        data_buffer6a  <= #1 8'h0;
        data_buffer7a  <= #1 8'h0;
        data_buffer8a  <= #1 8'h0;
        data_buffer9a  <= #1 8'h0;
        data_buffer10a <= #1 8'h0;
        data_buffer11a <= #1 8'h0;
        data_buffer12a <= #1 8'h0;
        data_buffer13a <= #1 8'h0;
        data_buffer14a <= #1 8'h0;
        data_buffer15a <= #1 8'h0;
        data_buffer16a <= #1 8'h0;
        data_buffer17a <= #1 8'h0;
        data_buffer18a <= #1 8'h0;
        data_buffer19a <= #1 8'h0;
        data_buffer20a <= #1 8'h0;
        data_buffer21a <= #1 8'h0;
        data_buffer22a <= #1 8'h0;
        data_buffer23a <= #1 8'h0;
        data_buffer24a <= #1 8'h0;
        data_buffer25a <= #1 8'h0;
        data_buffer26a <= #1 8'h0;
        data_buffer27a <= #1 8'h0;
        data_buffer28a <= #1 8'h0;
        data_buffer29a <= #1 8'h0;
        data_buffer30a <= #1 8'h0;
        data_buffer31a <= #1 8'h0;
        data_buffer32a <= #1 8'h0;
        data_buffer33a <= #1 8'h0;
        data_buffer34a <= #1 8'h0;
        data_buffer35a <= #1 8'h0;
        end
    else if(cycle_dly2 == 2'b01) begin
        data_buffer0a  <= #1 dout00;
        data_buffer1a  <= #1 dout01;
        data_buffer2a  <= #1 dout02;
        data_buffer3a  <= #1 dout03;
        data_buffer4a  <= #1 dout04;
        data_buffer5a  <= #1 dout05;
        data_buffer6a  <= #1 dout06;
        data_buffer7a  <= #1 dout07;
        data_buffer8a  <= #1 dout08;
        data_buffer9a  <= #1 dout09;
        data_buffer10a <= #1 dout10;
        data_buffer11a <= #1 dout11;
        data_buffer12a <= #1 dout12;
        data_buffer13a <= #1 dout13;
        data_buffer14a <= #1 dout14;
        data_buffer15a <= #1 dout15;
        data_buffer16a <= #1 dout16;
        data_buffer17a <= #1 dout17;
        data_buffer18a <= #1 dout18;
        data_buffer19a <= #1 dout19;
        data_buffer20a <= #1 dout20;
        data_buffer21a <= #1 dout21;
        data_buffer22a <= #1 dout22;
        data_buffer23a <= #1 dout23;
        data_buffer24a <= #1 dout24;
        data_buffer25a <= #1 dout25;
        data_buffer26a <= #1 dout26;
        data_buffer27a <= #1 dout27;
        data_buffer28a <= #1 dout28;
        data_buffer29a <= #1 dout29;
        data_buffer30a <= #1 dout30;
        data_buffer31a <= #1 dout31;
        data_buffer32a <= #1 dout32;
        data_buffer33a <= #1 dout33;
        data_buffer34a <= #1 dout34;
        data_buffer35a <= #1 dout35;
        end
end

always @ (posedge clk or negedge reset_n)
begin : data_buffer_br
    if(!reset_n) begin
        data_buffer0b  <= #1 8'h0;
        data_buffer1b  <= #1 8'h0;
        data_buffer2b  <= #1 8'h0;
        data_buffer3b  <= #1 8'h0;
        data_buffer4b  <= #1 8'h0;
        data_buffer5b  <= #1 8'h0;
        data_buffer6b  <= #1 8'h0;
        data_buffer7b  <= #1 8'h0;
        data_buffer8b  <= #1 8'h0;
        data_buffer9b  <= #1 8'h0;
        data_buffer10b <= #1 8'h0;
        data_buffer11b <= #1 8'h0;
        data_buffer12b <= #1 8'h0;
        data_buffer13b <= #1 8'h0;
        data_buffer14b <= #1 8'h0;
        data_buffer15b <= #1 8'h0;
        data_buffer16b <= #1 8'h0;
        data_buffer17b <= #1 8'h0;
        data_buffer18b <= #1 8'h0;
        data_buffer19b <= #1 8'h0;
        data_buffer20b <= #1 8'h0;
        data_buffer21b <= #1 8'h0;
        data_buffer22b <= #1 8'h0;
        data_buffer23b <= #1 8'h0;
        data_buffer24b <= #1 8'h0;
        data_buffer25b <= #1 8'h0;
        data_buffer26b <= #1 8'h0;
        data_buffer27b <= #1 8'h0;
        data_buffer28b <= #1 8'h0;
        data_buffer29b <= #1 8'h0;
        data_buffer30b <= #1 8'h0;
        data_buffer31b <= #1 8'h0;
        data_buffer32b <= #1 8'h0;
        data_buffer33b <= #1 8'h0;
        data_buffer34b <= #1 8'h0;
        data_buffer35b <= #1 8'h0;
        end
    else if(cycle_dly2 == 2'b10) begin
        data_buffer0b  <= #1 dout00;
        data_buffer1b  <= #1 dout01;
        data_buffer2b  <= #1 dout02;
        data_buffer3b  <= #1 dout03;
        data_buffer4b  <= #1 dout04;
        data_buffer5b  <= #1 dout05;
        data_buffer6b  <= #1 dout06;
        data_buffer7b  <= #1 dout07;
        data_buffer8b  <= #1 dout08;
        data_buffer9b  <= #1 dout09;
        data_buffer10b <= #1 dout10;
        data_buffer11b <= #1 dout11;
        data_buffer12b <= #1 dout12;
        data_buffer13b <= #1 dout13;
        data_buffer14b <= #1 dout14;
        data_buffer15b <= #1 dout15;
        data_buffer16b <= #1 dout16;
        data_buffer17b <= #1 dout17;
        data_buffer18b <= #1 dout18;
        data_buffer19b <= #1 dout19;
        data_buffer20b <= #1 dout20;
        data_buffer21b <= #1 dout21;
        data_buffer22b <= #1 dout22;
        data_buffer23b <= #1 dout23;
        data_buffer24b <= #1 dout24;
        data_buffer25b <= #1 dout25;
        data_buffer26b <= #1 dout26;
        data_buffer27b <= #1 dout27;
        data_buffer28b <= #1 dout28;
        data_buffer29b <= #1 dout29;
        data_buffer30b <= #1 dout30;
        data_buffer31b <= #1 dout31;
        data_buffer32b <= #1 dout32;
        data_buffer33b <= #1 dout33;
        data_buffer34b <= #1 dout34;
        data_buffer35b <= #1 dout35;
        end
end

always @ (posedge clk or negedge reset_n)
begin : data_buffer_cr                    
    if(!reset_n) begin                   
        data_buffer0c  <= #1 8'h0;       
        data_buffer1c  <= #1 8'h0;       
        data_buffer2c  <= #1 8'h0;       
        data_buffer3c  <= #1 8'h0;       
        data_buffer4c  <= #1 8'h0;       
        data_buffer5c  <= #1 8'h0;       
        data_buffer6c  <= #1 8'h0;       
        data_buffer7c  <= #1 8'h0;       
        data_buffer8c  <= #1 8'h0;       
        data_buffer9c  <= #1 8'h0;       
        data_buffer10c <= #1 8'h0;       
        data_buffer11c <= #1 8'h0;       
        data_buffer12c <= #1 8'h0;       
        data_buffer13c <= #1 8'h0;       
        data_buffer14c <= #1 8'h0;       
        data_buffer15c <= #1 8'h0;       
        data_buffer16c <= #1 8'h0;       
        data_buffer17c <= #1 8'h0;       
        data_buffer18c <= #1 8'h0;       
        data_buffer19c <= #1 8'h0;       
        data_buffer20c <= #1 8'h0;       
        data_buffer21c <= #1 8'h0;       
        data_buffer22c <= #1 8'h0;       
        data_buffer23c <= #1 8'h0;       
        data_buffer24c <= #1 8'h0;       
        data_buffer25c <= #1 8'h0;       
        data_buffer26c <= #1 8'h0;       
        data_buffer27c <= #1 8'h0;       
        data_buffer28c <= #1 8'h0;       
        data_buffer29c <= #1 8'h0;       
        data_buffer30c <= #1 8'h0;       
        data_buffer31c <= #1 8'h0;       
        data_buffer32c <= #1 8'h0;       
        data_buffer33c <= #1 8'h0;       
        data_buffer34c <= #1 8'h0;       
        data_buffer35c <= #1 8'h0;       
        end                              
    else if(cycle_dly2 == 2'b11) begin    
        data_buffer0c  <= #1 dout00;     
        data_buffer1c  <= #1 dout01;     
        data_buffer2c  <= #1 dout02;     
        data_buffer3c  <= #1 dout03;     
        data_buffer4c  <= #1 dout04;     
        data_buffer5c  <= #1 dout05;     
        data_buffer6c  <= #1 dout06;     
        data_buffer7c  <= #1 dout07;     
        data_buffer8c  <= #1 dout08;     
        data_buffer9c  <= #1 dout09;     
        data_buffer10c <= #1 dout10;     
        data_buffer11c <= #1 dout11;     
        data_buffer12c <= #1 dout12;     
        data_buffer13c <= #1 dout13;     
        data_buffer14c <= #1 dout14;     
        data_buffer15c <= #1 dout15;     
        data_buffer16c <= #1 dout16;     
        data_buffer17c <= #1 dout17;     
        data_buffer18c <= #1 dout18;     
        data_buffer19c <= #1 dout19;     
        data_buffer20c <= #1 dout20;     
        data_buffer21c <= #1 dout21;     
        data_buffer22c <= #1 dout22;     
        data_buffer23c <= #1 dout23;     
        data_buffer24c <= #1 dout24;     
        data_buffer25c <= #1 dout25;     
        data_buffer26c <= #1 dout26;     
        data_buffer27c <= #1 dout27;     
        data_buffer28c <= #1 dout28;     
        data_buffer29c <= #1 dout29;     
        data_buffer30c <= #1 dout30;     
        data_buffer31c <= #1 dout31;     
        data_buffer32c <= #1 dout32;     
        data_buffer33c <= #1 dout33;     
        data_buffer34c <= #1 dout34;     
        data_buffer35c <= #1 dout35;     
        end                              
end    

always @ (posedge clk or negedge reset_n)
begin : dvtc_ar
    if(!reset_n) begin
        dvtc_0a  <= #1 8'h0;
        dvtc_1a  <= #1 8'h0;
        dvtc_2a  <= #1 8'h0;
        dvtc_3a  <= #1 8'h0;
        dvtc_4a  <= #1 8'h0;
        dvtc_5a  <= #1 8'h0;
        dvtc_6a  <= #1 8'h0;
        dvtc_7a  <= #1 8'h0;
        dvtc_8a  <= #1 8'h0;
        dvtc_9a  <= #1 8'h0;
        dvtc_10a <= #1 8'h0;
        dvtc_11a <= #1 8'h0;
        dvtc_12a <= #1 8'h0;
        dvtc_13a <= #1 8'h0;
        dvtc_14a <= #1 8'h0;
        dvtc_15a <= #1 8'h0;
        dvtc_16a <= #1 8'h0;
        dvtc_17a <= #1 8'h0;
        dvtc_18a <= #1 8'h0;
        dvtc_19a <= #1 8'h0;
        dvtc_20a <= #1 8'h0;
        dvtc_21a <= #1 8'h0;
        dvtc_22a <= #1 8'h0;
        dvtc_23a <= #1 8'h0;
        dvtc_24a <= #1 8'h0;
        dvtc_25a <= #1 8'h0;
        dvtc_26a <= #1 8'h0;
        dvtc_27a <= #1 8'h0;
        dvtc_28a <= #1 8'h0;
        dvtc_29a <= #1 8'h0;
        dvtc_30a <= #1 8'h0;
        dvtc_31a <= #1 8'h0;
        dvtc_32a <= #1 8'h0;
        dvtc_33a <= #1 8'h0;
        dvtc_34a <= #1 8'h0;
        dvtc_35a <= #1 8'h0;
        end
    else if(cnu_in[6]) begin
        dvtc_0a  <= #1 data_out0a;
        dvtc_1a  <= #1 data_out1a;
        dvtc_2a  <= #1 data_out2a;
        dvtc_3a  <= #1 data_out3a;
        dvtc_4a  <= #1 data_out4a;
        dvtc_5a  <= #1 data_out5a;
        dvtc_6a  <= #1 data_out6a;
        dvtc_7a  <= #1 data_out7a;
        dvtc_8a  <= #1 data_out8a;
        dvtc_9a  <= #1 data_out9a;
        dvtc_10a <= #1 data_out10a;
        dvtc_11a <= #1 data_out11a;
        dvtc_12a <= #1 data_out12a;
        dvtc_13a <= #1 data_out13a;
        dvtc_14a <= #1 data_out14a;
        dvtc_15a <= #1 data_out15a;
        dvtc_16a <= #1 data_out16a;
        dvtc_17a <= #1 data_out17a;
        dvtc_18a <= #1 data_out18a;
        dvtc_19a <= #1 data_out19a;
        dvtc_20a <= #1 data_out20a;
        dvtc_21a <= #1 data_out21a;
        dvtc_22a <= #1 data_out22a;
        dvtc_23a <= #1 data_out23a;
        dvtc_24a <= #1 data_out24a;
        dvtc_25a <= #1 data_out25a;
        dvtc_26a <= #1 data_out26a;
        dvtc_27a <= #1 data_out27a;
        dvtc_28a <= #1 data_out28a;
        dvtc_29a <= #1 data_out29a;
        dvtc_30a <= #1 data_out30a;
        dvtc_31a <= #1 data_out31a;
        dvtc_32a <= #1 data_out32a;
        dvtc_33a <= #1 data_out33a;
        dvtc_34a <= #1 data_out34a;
        dvtc_35a <= #1 data_out35a;
        end
end

always @ (posedge clk or negedge reset_n)
begin : dvtc_br
    if(!reset_n) begin
        dvtc_0b  <= #1 8'h0;
        dvtc_1b  <= #1 8'h0;
        dvtc_2b  <= #1 8'h0;
        dvtc_3b  <= #1 8'h0;
        dvtc_4b  <= #1 8'h0;
        dvtc_5b  <= #1 8'h0;
        dvtc_6b  <= #1 8'h0;
        dvtc_7b  <= #1 8'h0;
        dvtc_8b  <= #1 8'h0;
        dvtc_9b  <= #1 8'h0;
        dvtc_10b <= #1 8'h0;
        dvtc_11b <= #1 8'h0;
        dvtc_12b <= #1 8'h0;
        dvtc_13b <= #1 8'h0;
        dvtc_14b <= #1 8'h0;
        dvtc_15b <= #1 8'h0;
        dvtc_16b <= #1 8'h0;
        dvtc_17b <= #1 8'h0;
        dvtc_18b <= #1 8'h0;
        dvtc_19b <= #1 8'h0;
        dvtc_20b <= #1 8'h0;
        dvtc_21b <= #1 8'h0;
        dvtc_22b <= #1 8'h0;
        dvtc_23b <= #1 8'h0;
        dvtc_24b <= #1 8'h0;
        dvtc_25b <= #1 8'h0;
        dvtc_26b <= #1 8'h0;
        dvtc_27b <= #1 8'h0;
        dvtc_28b <= #1 8'h0;
        dvtc_29b <= #1 8'h0;
        dvtc_30b <= #1 8'h0;
        dvtc_31b <= #1 8'h0;
        dvtc_32b <= #1 8'h0;
        dvtc_33b <= #1 8'h0;
        dvtc_34b <= #1 8'h0;
        dvtc_35b <= #1 8'h0;
        end
    else if(cnu_in[6]) begin
        dvtc_0b  <= #1 data_out0b;
        dvtc_1b  <= #1 data_out1b;
        dvtc_2b  <= #1 data_out2b;
        dvtc_3b  <= #1 data_out3b;
        dvtc_4b  <= #1 data_out4b;
        dvtc_5b  <= #1 data_out5b;
        dvtc_6b  <= #1 data_out6b;
        dvtc_7b  <= #1 data_out7b;
        dvtc_8b  <= #1 data_out8b;
        dvtc_9b  <= #1 data_out9b;
        dvtc_10b <= #1 data_out10b;
        dvtc_11b <= #1 data_out11b;
        dvtc_12b <= #1 data_out12b;
        dvtc_13b <= #1 data_out13b;
        dvtc_14b <= #1 data_out14b;
        dvtc_15b <= #1 data_out15b;
        dvtc_16b <= #1 data_out16b;
        dvtc_17b <= #1 data_out17b;
        dvtc_18b <= #1 data_out18b;
        dvtc_19b <= #1 data_out19b;
        dvtc_20b <= #1 data_out20b;
        dvtc_21b <= #1 data_out21b;
        dvtc_22b <= #1 data_out22b;
        dvtc_23b <= #1 data_out23b;
        dvtc_24b <= #1 data_out24b;
        dvtc_25b <= #1 data_out25b;
        dvtc_26b <= #1 data_out26b;
        dvtc_27b <= #1 data_out27b;
        dvtc_28b <= #1 data_out28b;
        dvtc_29b <= #1 data_out29b;
        dvtc_30b <= #1 data_out30b;
        dvtc_31b <= #1 data_out31b;
        dvtc_32b <= #1 data_out32b;
        dvtc_33b <= #1 data_out33b;
        dvtc_34b <= #1 data_out34b;
        dvtc_35b <= #1 data_out35b;
        end
end

always @ (posedge clk or negedge reset_n)
begin : dvtc_cr                    
    if(!reset_n) begin                   
        dvtc_0c  <= #1 8'h0;       
        dvtc_1c  <= #1 8'h0;       
        dvtc_2c  <= #1 8'h0;       
        dvtc_3c  <= #1 8'h0;       
        dvtc_4c  <= #1 8'h0;       
        dvtc_5c  <= #1 8'h0;       
        dvtc_6c  <= #1 8'h0;       
        dvtc_7c  <= #1 8'h0;       
        dvtc_8c  <= #1 8'h0;       
        dvtc_9c  <= #1 8'h0;       
        dvtc_10c <= #1 8'h0;       
        dvtc_11c <= #1 8'h0;       
        dvtc_12c <= #1 8'h0;       
        dvtc_13c <= #1 8'h0;       
        dvtc_14c <= #1 8'h0;       
        dvtc_15c <= #1 8'h0;       
        dvtc_16c <= #1 8'h0;       
        dvtc_17c <= #1 8'h0;       
        dvtc_18c <= #1 8'h0;       
        dvtc_19c <= #1 8'h0;       
        dvtc_20c <= #1 8'h0;       
        dvtc_21c <= #1 8'h0;       
        dvtc_22c <= #1 8'h0;       
        dvtc_23c <= #1 8'h0;       
        dvtc_24c <= #1 8'h0;       
        dvtc_25c <= #1 8'h0;       
        dvtc_26c <= #1 8'h0;       
        dvtc_27c <= #1 8'h0;       
        dvtc_28c <= #1 8'h0;       
        dvtc_29c <= #1 8'h0;       
        dvtc_30c <= #1 8'h0;       
        dvtc_31c <= #1 8'h0;       
        dvtc_32c <= #1 8'h0;       
        dvtc_33c <= #1 8'h0;       
        dvtc_34c <= #1 8'h0;       
        dvtc_35c <= #1 8'h0;       
        end                              
    else if(cnu_in[6]) begin    
        dvtc_0c  <= #1 data_out0c;     
        dvtc_1c  <= #1 data_out1c;     
        dvtc_2c  <= #1 data_out2c;     
        dvtc_3c  <= #1 data_out3c;     
        dvtc_4c  <= #1 data_out4c;     
        dvtc_5c  <= #1 data_out5c;     
        dvtc_6c  <= #1 data_out6c;     
        dvtc_7c  <= #1 data_out7c;     
        dvtc_8c  <= #1 data_out8c;     
        dvtc_9c  <= #1 data_out9c;     
        dvtc_10c <= #1 data_out10c;     
        dvtc_11c <= #1 data_out11c;     
        dvtc_12c <= #1 data_out12c;     
        dvtc_13c <= #1 data_out13c;     
        dvtc_14c <= #1 data_out14c;     
        dvtc_15c <= #1 data_out15c;     
        dvtc_16c <= #1 data_out16c;     
        dvtc_17c <= #1 data_out17c;     
        dvtc_18c <= #1 data_out18c;     
        dvtc_19c <= #1 data_out19c;     
        dvtc_20c <= #1 data_out20c;     
        dvtc_21c <= #1 data_out21c;     
        dvtc_22c <= #1 data_out22c;     
        dvtc_23c <= #1 data_out23c;     
        dvtc_24c <= #1 data_out24c;     
        dvtc_25c <= #1 data_out25c;     
        dvtc_26c <= #1 data_out26c;     
        dvtc_27c <= #1 data_out27c;     
        dvtc_28c <= #1 data_out28c;     
        dvtc_29c <= #1 data_out29c;     
        dvtc_30c <= #1 data_out30c;     
        dvtc_31c <= #1 data_out31c;     
        dvtc_32c <= #1 data_out32c;     
        dvtc_33c <= #1 data_out33c;     
        dvtc_34c <= #1 data_out34c;     
        dvtc_35c <= #1 data_out35c;     
        end                              
end    

always @ (*)
begin : cnu_sel_r
   if(!rate) begin
   vnu0_d = { data_buffer0a, data_buffer6a , data_buffer12a, data_buffer18a, data_buffer25a, data_buffer30a };
   vnu1_d = { data_buffer0a, data_buffer7a , data_buffer19a, data_buffer26a, data_buffer31a, data_buffer12b };
   vnu2_d = { data_buffer0a, data_buffer8a , data_buffer13a, data_buffer20a, data_buffer32a, data_buffer26b };
   vnu3_d = { data_buffer1a, data_buffer6b , data_buffer14a, data_buffer21a, data_buffer25b, data_buffer31b };
   vnu4_d = { data_buffer1a, data_buffer15a, data_buffer27a, data_buffer33a, data_buffer20b, data_buffer8b  };
   vnu5_d = { data_buffer1a, data_buffer9a , data_buffer16a, data_buffer34a, data_buffer25c, data_buffer21b };
   vnu6_d = { data_buffer2a, data_buffer6c , data_buffer28a, data_buffer35a, data_buffer16b, data_buffer20c };
   vnu7_d = { data_buffer2a, data_buffer10a, data_buffer17a, data_buffer27b, data_buffer21c, data_buffer30b };
   vnu8_d = { data_buffer2a, data_buffer11a, data_buffer22a, data_buffer22b, data_buffer16c, data_buffer34b };
   vnu9_d = { data_buffer3a, data_buffer7b , data_buffer26c, data_buffer13b, data_buffer33b, data_buffer19b };
   vnua_d = { data_buffer3a, data_buffer9b , data_buffer28b, data_buffer17b, data_buffer31c, data_buffer18b };
   vnub_d = { data_buffer3a, data_buffer23a, data_buffer9c , data_buffer12c, data_buffer35b, data_buffer24a };
   vnuc_d = { data_buffer4a, data_buffer7c , data_buffer29a, data_buffer17c, data_buffer34c, data_buffer18c };
   vnud_d = { data_buffer4a, data_buffer24b, data_buffer10b, data_buffer23b, data_buffer13c, data_buffer32b };
   vnue_d = { data_buffer4a, data_buffer29b, data_buffer10c, data_buffer32c, data_buffer23c, data_buffer15b };
   vnuf_d = { data_buffer5a, data_buffer8c , data_buffer14b, data_buffer22c, data_buffer28c, data_buffer30c };
   vnug_d = { data_buffer5a, data_buffer19c, data_buffer11b, data_buffer15c, data_buffer33c, data_buffer27c };
   vnuh_d = { data_buffer5a, data_buffer24c, data_buffer35c, data_buffer11c, data_buffer14c, data_buffer29c };
   end
   else begin
   vnu0_d = { data_buffer0a , data_buffer6a  , data_buffer16a , data_buffer21a , data_buffer27a , data_buffer34a  };
   vnu1_d = { data_buffer0a , data_buffer10a , data_buffer25a , data_buffer13b , data_buffer34b , data_buffer21b  };
   vnu2_d = { data_buffer0a , data_buffer11a , data_buffer22a , data_buffer27b , data_buffer16b , data_buffer25b  };
   vnu3_d = { data_buffer1a , data_buffer8a  , data_buffer17a , data_buffer29b , data_buffer32b , data_buffer25c  };
   vnu4_d = { data_buffer1a , data_buffer4c  , data_buffer12b , data_buffer27c , data_buffer9c  , data_buffer20b  };
   vnu5_d = { data_buffer1a , data_buffer23a , data_buffer33b , data_buffer7b  , data_buffer19b , data_buffer12c  };
   vnu6_d = { data_buffer2a , data_buffer30a , data_buffer35b , data_buffer32c , data_buffer23b , data_buffer7c   };
   vnu7_d = { data_buffer2a , data_buffer30b , data_buffer23c , data_buffer20c , data_buffer10c , data_buffer8b   };
   vnu8_d = { data_buffer2a , data_buffer19c , data_buffer28c , data_buffer5c  , data_buffer17c , data_buffer22c  };
   vnu9_d = { data_buffer3a , data_buffer12a , data_buffer18a , data_buffer24a , data_buffer31a , data_buffer6b   };
   vnua_d = { data_buffer4a , data_buffer13a , data_buffer28a , data_buffer18b , data_buffer6c  , data_buffer31b  };
   vnub_d = { data_buffer7a , data_buffer19a , data_buffer33a , data_buffer29a , data_buffer13c , data_buffer4b   };
   vnuc_d = { data_buffer3a , data_buffer14a , data_buffer20a , data_buffer32a , data_buffer9a  , data_buffer22b  };
   vnud_d = { data_buffer9b , data_buffer15a , data_buffer31c , data_buffer24b , data_buffer21c , data_buffer34c  };
   vnue_d = { data_buffer5a , data_buffer26a , data_buffer35a , data_buffer29c , data_buffer15b , data_buffer10b  };
   vnuf_d = { data_buffer3a , data_buffer16c , data_buffer11b , data_buffer26b , data_buffer14b , data_buffer18c  };
   vnug_d = { data_buffer35c, data_buffer26c , data_buffer5b  , data_buffer28b , data_buffer14c , data_buffer17b  };
   vnuh_d = { data_buffer15c, data_buffer33c , data_buffer11c , data_buffer24c , data_buffer30c , data_buffer8c   };
   end
end   

always @ (*)
begin : cnu_data_out_r
   if(!rate) begin
   { data_out0a, data_out6a , data_out12a, data_out18a, data_out25a, data_out30a } = vnu0_q;
   { data_out0b, data_out7a , data_out19a, data_out26a, data_out31a, data_out12b } = vnu1_q;
   { data_out0c, data_out8a , data_out13a, data_out20a, data_out32a, data_out26b } = vnu2_q;
   { data_out1a, data_out6b , data_out14a, data_out21a, data_out25b, data_out31b } = vnu3_q;
   { data_out1b, data_out15a, data_out27a, data_out33a, data_out20b, data_out8b  } = vnu4_q;
   { data_out1c, data_out9a , data_out16a, data_out34a, data_out25c, data_out21b } = vnu5_q;
   { data_out2a, data_out6c , data_out28a, data_out35a, data_out16b, data_out20c } = vnu6_q;
   { data_out2b, data_out10a, data_out17a, data_out27b, data_out21c, data_out30b } = vnu7_q;
   { data_out2c, data_out11a, data_out22a, data_out22b, data_out16c, data_out34b } = vnu8_q;
   { data_out3a, data_out7b , data_out26c, data_out13b, data_out33b, data_out19b } = vnu9_q;
   { data_out3b, data_out9b , data_out28b, data_out17b, data_out31c, data_out18b } = vnua_q;
   { data_out3c, data_out23a, data_out9c , data_out12c, data_out35b, data_out24a } = vnub_q;
   { data_out4a, data_out7c , data_out29a, data_out17c, data_out34c, data_out18c } = vnuc_q;
   { data_out4b, data_out24b, data_out10b, data_out23b, data_out13c, data_out32b } = vnud_q;
   { data_out4c, data_out29b, data_out10c, data_out32c, data_out23c, data_out15b } = vnue_q;
   { data_out5a, data_out8c , data_out14b, data_out22c, data_out28c, data_out30c } = vnuf_q;
   { data_out5b, data_out19c, data_out11b, data_out15c, data_out33c, data_out27c } = vnug_q;
   { data_out5c, data_out24c, data_out35c, data_out11c, data_out14c, data_out29c } = vnuh_q;
   end
   else begin
   { data_out0a , data_out6a  , data_out16a , data_out21a , data_out27a , data_out34a } = vnu0_q;
   { data_out0b , data_out10a , data_out25a , data_out13b , data_out34b , data_out21b } = vnu1_q;
   { data_out0c , data_out11a , data_out22a , data_out27b , data_out16b , data_out25b } = vnu2_q;
   { data_out1a , data_out8a  , data_out17a , data_out29b , data_out32b , data_out25c } = vnu3_q;
   { data_out1b , data_out4c  , data_out12b , data_out27c , data_out9c  , data_out20b } = vnu4_q;
   { data_out1c , data_out23a , data_out33b , data_out7b  , data_out19b , data_out12c } = vnu5_q;
   { data_out2a , data_out30a , data_out35b , data_out32c , data_out23b , data_out7c  } = vnu6_q;
   { data_out2b , data_out30b , data_out23c , data_out20c , data_out10c , data_out8b  } = vnu7_q;
   { data_out2c , data_out19c , data_out28c , data_out5c  , data_out17c , data_out22c } = vnu8_q;
   { data_out3a , data_out12a , data_out18a , data_out24a , data_out31a , data_out6b  } = vnu9_q;
   { data_out4a , data_out13a , data_out28a , data_out18b , data_out6c  , data_out31b } = vnua_q;
   { data_out7a , data_out19a , data_out33a , data_out29a , data_out13c , data_out4b  } = vnub_q;
   { data_out3b , data_out14a , data_out20a , data_out32a , data_out9a  , data_out22b } = vnuc_q;
   { data_out9b , data_out15a , data_out31c , data_out24b , data_out21c , data_out34c } = vnud_q;
   { data_out5a , data_out26a , data_out35a , data_out29c , data_out15b , data_out10b } = vnue_q;
   { data_out3c , data_out16c , data_out11b , data_out26b , data_out14b , data_out18c } = vnuf_q;
   { data_out35c, data_out26c , data_out5b  , data_out28b , data_out14c , data_out17b } = vnug_q;
   { data_out15c, data_out33c , data_out11c , data_out24c , data_out30c , data_out8c  } = vnuh_q;
   end
end   

always @ (posedge clk or negedge reset_n)
begin : sign_vnu_r
    if(!reset_n)
        sign_vnu <= #1 18'h0;
    else if(fsm[2]) begin
        if  (cnu_in[6]) begin
        sign_vnu[ 0] <= #1 vnu0_q[6*D_WID-1]^vnu0_q[5*D_WID-1]^vnu0_q[4*D_WID-1]^vnu0_q[3*D_WID-1]^vnu0_q[2*D_WID-1]^vnu0_q[D_WID-1];
        sign_vnu[ 1] <= #1 vnu1_q[6*D_WID-1]^vnu1_q[5*D_WID-1]^vnu1_q[4*D_WID-1]^vnu1_q[3*D_WID-1]^vnu1_q[2*D_WID-1]^vnu1_q[D_WID-1];
        sign_vnu[ 2] <= #1 vnu2_q[6*D_WID-1]^vnu2_q[5*D_WID-1]^vnu2_q[4*D_WID-1]^vnu2_q[3*D_WID-1]^vnu2_q[2*D_WID-1]^vnu2_q[D_WID-1];
        sign_vnu[ 3] <= #1 vnu3_q[6*D_WID-1]^vnu3_q[5*D_WID-1]^vnu3_q[4*D_WID-1]^vnu3_q[3*D_WID-1]^vnu3_q[2*D_WID-1]^vnu3_q[D_WID-1];
        sign_vnu[ 4] <= #1 vnu4_q[6*D_WID-1]^vnu4_q[5*D_WID-1]^vnu4_q[4*D_WID-1]^vnu4_q[3*D_WID-1]^vnu4_q[2*D_WID-1]^vnu4_q[D_WID-1];
        sign_vnu[ 5] <= #1 vnu5_q[6*D_WID-1]^vnu5_q[5*D_WID-1]^vnu5_q[4*D_WID-1]^vnu5_q[3*D_WID-1]^vnu5_q[2*D_WID-1]^vnu5_q[D_WID-1];
        sign_vnu[ 6] <= #1 vnu6_q[6*D_WID-1]^vnu6_q[5*D_WID-1]^vnu6_q[4*D_WID-1]^vnu6_q[3*D_WID-1]^vnu6_q[2*D_WID-1]^vnu6_q[D_WID-1];
        sign_vnu[ 7] <= #1 vnu7_q[6*D_WID-1]^vnu7_q[5*D_WID-1]^vnu7_q[4*D_WID-1]^vnu7_q[3*D_WID-1]^vnu7_q[2*D_WID-1]^vnu7_q[D_WID-1];
        sign_vnu[ 8] <= #1 vnu8_q[6*D_WID-1]^vnu8_q[5*D_WID-1]^vnu8_q[4*D_WID-1]^vnu8_q[3*D_WID-1]^vnu8_q[2*D_WID-1]^vnu8_q[D_WID-1];
        sign_vnu[ 9] <= #1 vnu9_q[6*D_WID-1]^vnu9_q[5*D_WID-1]^vnu9_q[4*D_WID-1]^vnu9_q[3*D_WID-1]^vnu9_q[2*D_WID-1]^vnu9_q[D_WID-1];
        sign_vnu[10] <= #1 vnua_q[6*D_WID-1]^vnua_q[5*D_WID-1]^vnua_q[4*D_WID-1]^vnua_q[3*D_WID-1]^vnua_q[2*D_WID-1]^vnua_q[D_WID-1];
        sign_vnu[11] <= #1 vnub_q[6*D_WID-1]^vnub_q[5*D_WID-1]^vnub_q[4*D_WID-1]^vnub_q[3*D_WID-1]^vnub_q[2*D_WID-1]^vnub_q[D_WID-1];
        sign_vnu[12] <= #1 vnuc_q[6*D_WID-1]^vnuc_q[5*D_WID-1]^vnuc_q[4*D_WID-1]^vnuc_q[3*D_WID-1]^vnuc_q[2*D_WID-1]^vnuc_q[D_WID-1];
        sign_vnu[13] <= #1 vnud_q[6*D_WID-1]^vnud_q[5*D_WID-1]^vnud_q[4*D_WID-1]^vnud_q[3*D_WID-1]^vnud_q[2*D_WID-1]^vnud_q[D_WID-1];
        sign_vnu[14] <= #1 vnue_q[6*D_WID-1]^vnue_q[5*D_WID-1]^vnue_q[4*D_WID-1]^vnue_q[3*D_WID-1]^vnue_q[2*D_WID-1]^vnue_q[D_WID-1];
        sign_vnu[15] <= #1 vnuf_q[6*D_WID-1]^vnuf_q[5*D_WID-1]^vnuf_q[4*D_WID-1]^vnuf_q[3*D_WID-1]^vnuf_q[2*D_WID-1]^vnuf_q[D_WID-1];
        sign_vnu[16] <= #1 vnug_q[6*D_WID-1]^vnug_q[5*D_WID-1]^vnug_q[4*D_WID-1]^vnug_q[3*D_WID-1]^vnug_q[2*D_WID-1]^vnug_q[D_WID-1];
        sign_vnu[17] <= #1 vnuh_q[6*D_WID-1]^vnuh_q[5*D_WID-1]^vnuh_q[4*D_WID-1]^vnuh_q[3*D_WID-1]^vnuh_q[2*D_WID-1]^vnuh_q[D_WID-1];
        end
        end
    else
        sign_vnu <= #1 18'h0;
end        

always @ (posedge clk or negedge reset_n)
begin
    if(!reset_n)
        sigma_vnu <= #1 1'b0;
    else
        sigma_vnu <= #1 (sign_vnu != 18'h0) ;
end        

always @ (posedge clk or negedge reset_n)
begin : vtc_en_r
    if(!reset_n) 
        vtc_en <= #1 3'h0;
    else 
        vtc_en <= #1 {vtc_en[1:0],cnu_in[6]};
end

always @ (posedge clk or negedge reset_n)
begin : data_buf0_r
    if(!reset_n) begin
        data_0 <= #1 {D_WID{1'b0}};
        data_1 <= #1 {D_WID{1'b0}};
        data_2 <= #1 {D_WID{1'b0}};
        data_3 <= #1 {D_WID{1'b0}};
        data_4 <= #1 {D_WID{1'b0}};
        data_5 <= #1 {D_WID{1'b0}};
        data_6 <= #1 {D_WID{1'b0}};
        data_7 <= #1 {D_WID{1'b0}};
        data_8 <= #1 {D_WID{1'b0}};
        end
    else if(cnu_in[1]) begin
        data_0 <= #1 data_buffer0a;
        data_1 <= #1 data_buffer1a;
        data_2 <= #1 data_buffer2a;
        data_3 <= #1 data_buffer3a;
        data_4 <= #1 data_buffer4a;
        data_5 <= #1 data_buffer5a;
        data_6 <= #1 data_buffer6a;
        data_7 <= #1 data_buffer7a;
        data_8 <= #1 data_buffer8a;
        end
end                

always @ (posedge clk or negedge reset_n)
begin : data_buf1_r
    if(!reset_n) begin
        data_0d <= #1 {D_WID{1'b0}};
        data_1d <= #1 {D_WID{1'b0}};
        data_2d <= #1 {D_WID{1'b0}};
        data_3d <= #1 {D_WID{1'b0}};
        data_4d <= #1 {D_WID{1'b0}};
        data_5d <= #1 {D_WID{1'b0}};
        data_6d <= #1 {D_WID{1'b0}};
        data_7d <= #1 {D_WID{1'b0}};
        data_8d <= #1 {D_WID{1'b0}};
        end
    else if(cnu_in[4]) begin
        data_0d <= #1 data_0;
        data_1d <= #1 data_1;
        data_2d <= #1 data_2;
        data_3d <= #1 data_3;
        data_4d <= #1 data_4;
        data_5d <= #1 data_5;
        data_6d <= #1 data_6;
        data_7d <= #1 data_7;
        data_8d <= #1 data_8;
        end
end                

always @ (posedge clk or negedge reset_n)
begin : data_buf2_r
    if(!reset_n) begin
        data_0d2 <= #1 {D_WID{1'b0}};
        data_1d2 <= #1 {D_WID{1'b0}};
        data_2d2 <= #1 {D_WID{1'b0}};
        data_3d2 <= #1 {D_WID{1'b0}};
        data_4d2 <= #1 {D_WID{1'b0}};
        data_5d2 <= #1 {D_WID{1'b0}};
        data_6d2 <= #1 {D_WID{1'b0}};
        data_7d2 <= #1 {D_WID{1'b0}};
        data_8d2 <= #1 {D_WID{1'b0}};
        end
    else if(cnu_in[6]) begin
        data_0d2 <= #1 data_0d;
        data_1d2 <= #1 data_1d;
        data_2d2 <= #1 data_2d;
        data_3d2 <= #1 data_3d;
        data_4d2 <= #1 data_4d;
        data_5d2 <= #1 data_5d;
        data_6d2 <= #1 data_6d;
        data_7d2 <= #1 data_7d;
        data_8d2 <= #1 data_8d;
        end
end 
//always @ (posedge clk or negedge reset_n)
//begin : data_8r
//    if(!reset_n)
//        data_8d <= #1 {D_WID{1'b0}};
//    else
//      data_8d <= #1 data_8;
//end

comp_cell comp0(.clk(clk),.reset_n(reset_n),.iter_0(iter_0),.lq6_in(vnu0_d),.lr_in(cnu0_d),.cnu_in(cnu_in),.lq6_out(vnu0_q),.lr_out(cnu0_q));
comp_cell comp1(.clk(clk),.reset_n(reset_n),.iter_0(iter_0),.lq6_in(vnu1_d),.lr_in(cnu1_d),.cnu_in(cnu_in),.lq6_out(vnu1_q),.lr_out(cnu1_q));
comp_cell comp2(.clk(clk),.reset_n(reset_n),.iter_0(iter_0),.lq6_in(vnu2_d),.lr_in(cnu2_d),.cnu_in(cnu_in),.lq6_out(vnu2_q),.lr_out(cnu2_q));
comp_cell comp3(.clk(clk),.reset_n(reset_n),.iter_0(iter_0),.lq6_in(vnu3_d),.lr_in(cnu3_d),.cnu_in(cnu_in),.lq6_out(vnu3_q),.lr_out(cnu3_q));
comp_cell comp4(.clk(clk),.reset_n(reset_n),.iter_0(iter_0),.lq6_in(vnu4_d),.lr_in(cnu4_d),.cnu_in(cnu_in),.lq6_out(vnu4_q),.lr_out(cnu4_q));
comp_cell comp5(.clk(clk),.reset_n(reset_n),.iter_0(iter_0),.lq6_in(vnu5_d),.lr_in(cnu5_d),.cnu_in(cnu_in),.lq6_out(vnu5_q),.lr_out(cnu5_q));
comp_cell comp6(.clk(clk),.reset_n(reset_n),.iter_0(iter_0),.lq6_in(vnu6_d),.lr_in(cnu6_d),.cnu_in(cnu_in),.lq6_out(vnu6_q),.lr_out(cnu6_q));
comp_cell comp7(.clk(clk),.reset_n(reset_n),.iter_0(iter_0),.lq6_in(vnu7_d),.lr_in(cnu7_d),.cnu_in(cnu_in),.lq6_out(vnu7_q),.lr_out(cnu7_q));
comp_cell comp8(.clk(clk),.reset_n(reset_n),.iter_0(iter_0),.lq6_in(vnu8_d),.lr_in(cnu8_d),.cnu_in(cnu_in),.lq6_out(vnu8_q),.lr_out(cnu8_q));
comp_cell comp9(.clk(clk),.reset_n(reset_n),.iter_0(iter_0),.lq6_in(vnu9_d),.lr_in(cnu9_d),.cnu_in(cnu_in),.lq6_out(vnu9_q),.lr_out(cnu9_q));
comp_cell compa(.clk(clk),.reset_n(reset_n),.iter_0(iter_0),.lq6_in(vnua_d),.lr_in(cnua_d),.cnu_in(cnu_in),.lq6_out(vnua_q),.lr_out(cnua_q));
comp_cell compb(.clk(clk),.reset_n(reset_n),.iter_0(iter_0),.lq6_in(vnub_d),.lr_in(cnub_d),.cnu_in(cnu_in),.lq6_out(vnub_q),.lr_out(cnub_q));
comp_cell compc(.clk(clk),.reset_n(reset_n),.iter_0(iter_0),.lq6_in(vnuc_d),.lr_in(cnuc_d),.cnu_in(cnu_in),.lq6_out(vnuc_q),.lr_out(cnuc_q));
comp_cell compd(.clk(clk),.reset_n(reset_n),.iter_0(iter_0),.lq6_in(vnud_d),.lr_in(cnud_d),.cnu_in(cnu_in),.lq6_out(vnud_q),.lr_out(cnud_q));
comp_cell compe(.clk(clk),.reset_n(reset_n),.iter_0(iter_0),.lq6_in(vnue_d),.lr_in(cnue_d),.cnu_in(cnu_in),.lq6_out(vnue_q),.lr_out(cnue_q));
comp_cell compf(.clk(clk),.reset_n(reset_n),.iter_0(iter_0),.lq6_in(vnuf_d),.lr_in(cnuf_d),.cnu_in(cnu_in),.lq6_out(vnuf_q),.lr_out(cnuf_q));
comp_cell compg(.clk(clk),.reset_n(reset_n),.iter_0(iter_0),.lq6_in(vnug_d),.lr_in(cnug_d),.cnu_in(cnu_in),.lq6_out(vnug_q),.lr_out(cnug_q));
comp_cell comph(.clk(clk),.reset_n(reset_n),.iter_0(iter_0),.lq6_in(vnuh_d),.lr_in(cnuh_d),.cnu_in(cnu_in),.lq6_out(vnuh_q),.lr_out(cnuh_q));

data_cell2 data00(.clk(clk),.reset_n(reset_n),.fsm(fsm),.sin(sync_in[0]),.din(data_in),.vtc_en(vtc_en),.dvtc_a(dvtc_0a ),.dvtc_b(dvtc_0b ),.dvtc_c(dvtc_0c ),.ram_d(din00),.d_last(data_0d2));
data_cell2 data01(.clk(clk),.reset_n(reset_n),.fsm(fsm),.sin(sync_in[1]),.din(data_in),.vtc_en(vtc_en),.dvtc_a(dvtc_1a ),.dvtc_b(dvtc_1b ),.dvtc_c(dvtc_1c ),.ram_d(din01),.d_last(data_1d2));
data_cell2 data02(.clk(clk),.reset_n(reset_n),.fsm(fsm),.sin(sync_in[2]),.din(data_in),.vtc_en(vtc_en),.dvtc_a(dvtc_2a ),.dvtc_b(dvtc_2b ),.dvtc_c(dvtc_2c ),.ram_d(din02),.d_last(data_2d2));
data_cell2 data03(.clk(clk),.reset_n(reset_n),.fsm(fsm),.sin(sync_in[3]),.din(data_in),.vtc_en(vtc_en),.dvtc_a(dvtc_3a ),.dvtc_b(dvtc_3b ),.dvtc_c(dvtc_3c ),.ram_d(din03),.d_last(data_3d2));
data_cell2 data04(.clk(clk),.reset_n(reset_n),.fsm(fsm),.sin(sync_in[4]),.din(data_in),.vtc_en(vtc_en),.dvtc_a(dvtc_4a ),.dvtc_b(dvtc_4b ),.dvtc_c(dvtc_4c ),.ram_d(din04),.d_last(data_4d2));
data_cell2 data05(.clk(clk),.reset_n(reset_n),.fsm(fsm),.sin(sync_in[5]),.din(data_in),.vtc_en(vtc_en),.dvtc_a(dvtc_5a ),.dvtc_b(dvtc_5b ),.dvtc_c(dvtc_5c ),.ram_d(din05),.d_last(data_5d2));
data_cell2 data06(.clk(clk),.reset_n(reset_n),.fsm(fsm),.sin(sync_in[6]),.din(data_in),.vtc_en(vtc_en),.dvtc_a(dvtc_6a ),.dvtc_b(dvtc_6b ),.dvtc_c(dvtc_6c ),.ram_d(din06),.d_last(data_6d2));
data_cell2 data07(.clk(clk),.reset_n(reset_n),.fsm(fsm),.sin(sync_in[7]),.din(data_in),.vtc_en(vtc_en),.dvtc_a(dvtc_7a ),.dvtc_b(dvtc_7b ),.dvtc_c(dvtc_7c ),.ram_d(din07),.d_last(data_7d2));
data_cell1 data08(.clk(clk),.reset_n(reset_n),.fsm(fsm),.sin(sync_in[8]),.din(data_in),.vtc_en(vtc_en),.dvtc_a(dvtc_8a ),.dvtc_b(dvtc_8b ),.dvtc_c(dvtc_8c ),.ram_d(din08),.d_last(data_8d2));
data_cell data09(.clk(clk),.reset_n(reset_n),.fsm(fsm),.sin(sync_in[ 9]),.din(data_in),.vtc_en(vtc_en),.dvtc_a(dvtc_9a ),.dvtc_b(dvtc_9b ),.dvtc_c(dvtc_9c ),.ram_d(din09));
data_cell data10(.clk(clk),.reset_n(reset_n),.fsm(fsm),.sin(sync_in[10]),.din(data_in),.vtc_en(vtc_en),.dvtc_a(dvtc_10a),.dvtc_b(dvtc_10b),.dvtc_c(dvtc_10c),.ram_d(din10));
data_cell data11(.clk(clk),.reset_n(reset_n),.fsm(fsm),.sin(sync_in[11]),.din(data_in),.vtc_en(vtc_en),.dvtc_a(dvtc_11a),.dvtc_b(dvtc_11b),.dvtc_c(dvtc_11c),.ram_d(din11));
data_cell data12(.clk(clk),.reset_n(reset_n),.fsm(fsm),.sin(sync_in[12]),.din(data_in),.vtc_en(vtc_en),.dvtc_a(dvtc_12a),.dvtc_b(dvtc_12b),.dvtc_c(dvtc_12c),.ram_d(din12));
data_cell data13(.clk(clk),.reset_n(reset_n),.fsm(fsm),.sin(sync_in[13]),.din(data_in),.vtc_en(vtc_en),.dvtc_a(dvtc_13a),.dvtc_b(dvtc_13b),.dvtc_c(dvtc_13c),.ram_d(din13));
data_cell data14(.clk(clk),.reset_n(reset_n),.fsm(fsm),.sin(sync_in[14]),.din(data_in),.vtc_en(vtc_en),.dvtc_a(dvtc_14a),.dvtc_b(dvtc_14b),.dvtc_c(dvtc_14c),.ram_d(din14));
data_cell data15(.clk(clk),.reset_n(reset_n),.fsm(fsm),.sin(sync_in[15]),.din(data_in),.vtc_en(vtc_en),.dvtc_a(dvtc_15a),.dvtc_b(dvtc_15b),.dvtc_c(dvtc_15c),.ram_d(din15));
data_cell data16(.clk(clk),.reset_n(reset_n),.fsm(fsm),.sin(sync_in[16]),.din(data_in),.vtc_en(vtc_en),.dvtc_a(dvtc_16a),.dvtc_b(dvtc_16b),.dvtc_c(dvtc_16c),.ram_d(din16));
data_cell data17(.clk(clk),.reset_n(reset_n),.fsm(fsm),.sin(sync_in[17]),.din(data_in),.vtc_en(vtc_en),.dvtc_a(dvtc_17a),.dvtc_b(dvtc_17b),.dvtc_c(dvtc_17c),.ram_d(din17));
data_cell data18(.clk(clk),.reset_n(reset_n),.fsm(fsm),.sin(sync_in[18]),.din(data_in),.vtc_en(vtc_en),.dvtc_a(dvtc_18a),.dvtc_b(dvtc_18b),.dvtc_c(dvtc_18c),.ram_d(din18));
data_cell data19(.clk(clk),.reset_n(reset_n),.fsm(fsm),.sin(sync_in[19]),.din(data_in),.vtc_en(vtc_en),.dvtc_a(dvtc_19a),.dvtc_b(dvtc_19b),.dvtc_c(dvtc_19c),.ram_d(din19));
data_cell data20(.clk(clk),.reset_n(reset_n),.fsm(fsm),.sin(sync_in[20]),.din(data_in),.vtc_en(vtc_en),.dvtc_a(dvtc_20a),.dvtc_b(dvtc_20b),.dvtc_c(dvtc_20c),.ram_d(din20));
data_cell data21(.clk(clk),.reset_n(reset_n),.fsm(fsm),.sin(sync_in[21]),.din(data_in),.vtc_en(vtc_en),.dvtc_a(dvtc_21a),.dvtc_b(dvtc_21b),.dvtc_c(dvtc_21c),.ram_d(din21));
data_cell data22(.clk(clk),.reset_n(reset_n),.fsm(fsm),.sin(sync_in[22]),.din(data_in),.vtc_en(vtc_en),.dvtc_a(dvtc_22a),.dvtc_b(dvtc_22b),.dvtc_c(dvtc_22c),.ram_d(din22));
data_cell data23(.clk(clk),.reset_n(reset_n),.fsm(fsm),.sin(sync_in[23]),.din(data_in),.vtc_en(vtc_en),.dvtc_a(dvtc_23a),.dvtc_b(dvtc_23b),.dvtc_c(dvtc_23c),.ram_d(din23));
data_cell data24(.clk(clk),.reset_n(reset_n),.fsm(fsm),.sin(sync_in[24]),.din(data_in),.vtc_en(vtc_en),.dvtc_a(dvtc_24a),.dvtc_b(dvtc_24b),.dvtc_c(dvtc_24c),.ram_d(din24));
data_cell data25(.clk(clk),.reset_n(reset_n),.fsm(fsm),.sin(sync_in[25]),.din(data_in),.vtc_en(vtc_en),.dvtc_a(dvtc_25a),.dvtc_b(dvtc_25b),.dvtc_c(dvtc_25c),.ram_d(din25));
data_cell data26(.clk(clk),.reset_n(reset_n),.fsm(fsm),.sin(sync_in[26]),.din(data_in),.vtc_en(vtc_en),.dvtc_a(dvtc_26a),.dvtc_b(dvtc_26b),.dvtc_c(dvtc_26c),.ram_d(din26));
data_cell data27(.clk(clk),.reset_n(reset_n),.fsm(fsm),.sin(sync_in[27]),.din(data_in),.vtc_en(vtc_en),.dvtc_a(dvtc_27a),.dvtc_b(dvtc_27b),.dvtc_c(dvtc_27c),.ram_d(din27));
data_cell data28(.clk(clk),.reset_n(reset_n),.fsm(fsm),.sin(sync_in[28]),.din(data_in),.vtc_en(vtc_en),.dvtc_a(dvtc_28a),.dvtc_b(dvtc_28b),.dvtc_c(dvtc_28c),.ram_d(din28));
data_cell data29(.clk(clk),.reset_n(reset_n),.fsm(fsm),.sin(sync_in[29]),.din(data_in),.vtc_en(vtc_en),.dvtc_a(dvtc_29a),.dvtc_b(dvtc_29b),.dvtc_c(dvtc_29c),.ram_d(din29));
data_cell data30(.clk(clk),.reset_n(reset_n),.fsm(fsm),.sin(sync_in[30]),.din(data_in),.vtc_en(vtc_en),.dvtc_a(dvtc_30a),.dvtc_b(dvtc_30b),.dvtc_c(dvtc_30c),.ram_d(din30));
data_cell data31(.clk(clk),.reset_n(reset_n),.fsm(fsm),.sin(sync_in[31]),.din(data_in),.vtc_en(vtc_en),.dvtc_a(dvtc_31a),.dvtc_b(dvtc_31b),.dvtc_c(dvtc_31c),.ram_d(din31));
data_cell data32(.clk(clk),.reset_n(reset_n),.fsm(fsm),.sin(sync_in[32]),.din(data_in),.vtc_en(vtc_en),.dvtc_a(dvtc_32a),.dvtc_b(dvtc_32b),.dvtc_c(dvtc_32c),.ram_d(din32));
data_cell data33(.clk(clk),.reset_n(reset_n),.fsm(fsm),.sin(sync_in[33]),.din(data_in),.vtc_en(vtc_en),.dvtc_a(dvtc_33a),.dvtc_b(dvtc_33b),.dvtc_c(dvtc_33c),.ram_d(din33));
data_cell data34(.clk(clk),.reset_n(reset_n),.fsm(fsm),.sin(sync_in[34]),.din(data_in),.vtc_en(vtc_en),.dvtc_a(dvtc_34a),.dvtc_b(dvtc_34b),.dvtc_c(dvtc_34c),.ram_d(din34));
data_cell data35(.clk(clk),.reset_n(reset_n),.fsm(fsm),.sin(sync_in[35]),.din(data_in),.vtc_en(vtc_en),.dvtc_a(dvtc_35a),.dvtc_b(dvtc_35b),.dvtc_c(dvtc_35c),.ram_d(din35));

lr_cell lr0(
    .clk(clk),
    .reset_n(reset_n),
    .iter_0(iter_0),
    .cnu_in(cnu_in),
    .cycle (cycle_dly2),
    .cnu0_q(cnu0_q),
    .cnu1_q(cnu1_q),
    .cnu2_q(cnu2_q),
    .cnu3_q(cnu3_q),
    .cnu4_q(cnu4_q),
    .cnu5_q(cnu5_q),
    .mem_in(mem0_in),      
    .mem_out(mem0_out),     
    .cnu0_d(cnu0_d),
    .cnu1_d(cnu1_d),
    .cnu2_d(cnu2_d),
    .cnu3_d(cnu3_d),
    .cnu4_d(cnu4_d),
    .cnu5_d(cnu5_d)
);

lr_cell lr1(
    .clk(clk),
    .reset_n(reset_n),
    .iter_0(iter_0),
    .cnu_in(cnu_in),
    .cycle (cycle_dly2),
    .cnu0_q(cnu6_q),
    .cnu1_q(cnu7_q),
    .cnu2_q(cnu8_q),
    .cnu3_q(cnu9_q),
    .cnu4_q(cnua_q),
    .cnu5_q(cnub_q),
    .mem_in(mem1_in),      
    .mem_out(mem1_out),     
    .cnu0_d(cnu6_d),
    .cnu1_d(cnu7_d),
    .cnu2_d(cnu8_d),
    .cnu3_d(cnu9_d),
    .cnu4_d(cnua_d),
    .cnu5_d(cnub_d)
);

lr_cell lr2(
    .clk(clk),
    .reset_n(reset_n),
    .iter_0(iter_0),
    .cnu_in(cnu_in),
    .cycle (cycle_dly2),
    .cnu0_q(cnuc_q),
    .cnu1_q(cnud_q),
    .cnu2_q(cnue_q),
    .cnu3_q(cnuf_q),
    .cnu4_q(cnug_q),
    .cnu5_q(cnuh_q),
    .mem_in(mem2_in),      
    .mem_out(mem2_out),     
    .cnu0_d(cnuc_d),
    .cnu1_d(cnud_d),
    .cnu2_d(cnue_d),
    .cnu3_d(cnuf_d),
    .cnu4_d(cnug_d),
    .cnu5_d(cnuh_d)
);
endmodule 

                                      
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

//Module
`timescale 1 ns / 1 ps
module ldpc_ctrl(
    clk,
    reset_n,
    sync_in,
    rate,
    max_iter,
    ctv_out,
    sigma_vnu,

    fsm_state,
    cycle,
    finish,
    busy,
    iter_0,
    wr_lq,
    wr_lr,
    rd_lq,
    rd_lr,
    num_iter    
);

//Input ports
input                clk        ;
input                reset_n    ;
input                rate       ; // 0, 1/2 1, 3/4
input                sync_in    ;
input   [4:0]        max_iter   ;
input                ctv_out    ;
input                sigma_vnu  ;

//Output ports
output  [3:0]        fsm_state  ;
output  [3:0]        cycle      ;
output               finish     ;
output               busy       ;
output  [4:0]        num_iter   ;
output               iter_0     ;
output               wr_lq      ;
output               wr_lr      ;
output               rd_lq      ;
output               rd_lr      ;

//Paramter
parameter IDLE     = 5'b00001,
          DATA_I   = 5'b00010,
          CNU_U    = 5'b00100,
	  VNU_U    = 5'b01000,
          DATA_O   = 5'b10000;
//	  WAIT     = 5'b00001;

//Intenal Reg and Wires Definition
//reg     [3:0]        fsm_state  ;
reg                  finish     ;
reg                  busy       ;
reg     [4:0]        num_iter   ;
//reg     [3:0]        cycle      ;

reg                  sync_dly   ;
reg                  sync_dly2  ;
reg                  sync_out_d ;
//reg     [3:0]        next_state ;
reg    [12:0]        counter    ;
//reg                  wr_ena     ;
reg                  wr_lq      ;
//reg                  wr_lr      ;
reg                  rd_lq      ;
reg                  rd_lr      ;
//reg     [7:0]        rd_lq_cnt  ;
//reg     [7:0]        wr_lq_cnt  ;
reg     [6:0]        step       ;
reg                  iter_0     ;
reg                  rd_lq_ena  ;
reg                  wr_lq_ena  ;
reg                  wr_lr_ena  ;
reg                  error_det  ;
reg     [1:0]        rd_cycle   ;
reg     [1:0]        wr_cycle   ;
//////////////////////////////////
reg     [4:0]        fsm        ;
reg     [4:0]        next_fsm   ;

wire     [3:0]       cycle      ;
wire                 sync_end   ;
wire                 iter_end   ;
//wire                 vnu_end    ;
wire                 sync_out_end;
wire   [12:0]        counter_max;
//wire                 rd_ena     ;
wire                 fsm_cnu    ;
wire                 rd_lq_end  ;
wire                 wr_lq_end  ;
wire                 wr_lq_pre  ;

assign cycle = {rd_cycle, wr_cycle};
assign wr_lr = wr_lr_ena;
assign fsm_state = {fsm[4],fsm[3]|fsm[2],fsm[1],fsm[0]};
//assign rd_lr = rd_lq_ena & ( num_iter != 'd1);
assign counter_max = rate ? 'd6911 : 'd4607;
assign sync_end = sync_dly2 & (!sync_dly);
assign iter_end = (num_iter == max_iter); 
//assign vnu_end  = (rd_lq_cnt == 8'hff) & fsm[2];
assign sync_out_end = (counter == counter_max) & fsm[4];
//assign rd_ena = next_state == CNU;
//assign iter_0 = ( num_iter == 0);

// sync in delay register
always @ (posedge clk or negedge reset_n)
begin : sync_d1 
    if(!reset_n)
        sync_dly <= #1 1'b0;
    else
        sync_dly <= #1 sync_in;
end

always @ (posedge clk or negedge reset_n)
begin : sync_d2 
    if(!reset_n)
        sync_dly2 <= #1 1'b0;
    else
        sync_dly2 <= #1 sync_dly;
end

// ldpc_busy status
always @ (posedge clk or negedge reset_n)
begin : busy_r
    if(!reset_n)
        busy <= #1 1'b0;
    else if(finish)
        busy <= #1 1'b0;
    else if(sync_end)
        busy <= #1 1'b1;    
end     

always @ (posedge clk or negedge reset_n)
begin : finish_r
    if(!reset_n)
        finish <= #1 1'b0;
    else
	finish <= #1 sync_out_d;
end

always @ (posedge clk or negedge reset_n)
begin : sync_out_d1
    if(!reset_n)
        sync_out_d <= #1 1'b0;
    else
	sync_out_d <= sync_out_end;
end
// FSM
/*
always @ (posedge clk or negedge reset_n)
begin : fsm_state_r
    if(!reset_n)
        fsm_state <= #1 IDLE;
    else 
        fsm_state <= #1 next_state;
end

always @ (*)
begin : fsm_next_state_r
    case(fsm_state)
    IDLE: if(sync_in)
        next_state = DATA_IN;
    DATA_IN: if(sync_end)
        next_state = CNU;
    CNU: if(vnu_end)
             begin
                 if(iter_end)
                     next_state = DATA_OUT;
                 else 
                     next_state = CNU;
          end
     DATA_OUT: if(sync_out_end)
         next_state = IDLE;
     default:
         next_state = IDLE;
     endcase
end

//(*)
// Cycle 01->10->11
always @ (posedge clk or negedge reset_n)
begin : cycle0_r
    if(!reset_n)
        cycle[3:2] <= #1 2'b0;
    else if((next_state == CNU) & rd_ena ) begin
        if(cycle[3:2] == 2'b11)
        cycle[3:2] <= #1 2'b01;
        else
        cycle[3:2] <= #1 cycle[3:2] + 1'b1;
    end
    else
        cycle[3:2] <= #1 2'b0;
end
        
always @ (posedge clk or negedge reset_n)
begin : cycle1_r
    if(!reset_n)
        cycle[1:0] <= #1 2'b0;
    else if((next_state == CNU) & wr_ena) begin
        if(cycle[1:0] == 2'b11)
        cycle[1:0] <= #1 2'b01;
        else
        cycle[1:0] <= #1 cycle[1:0] + 1'b1;
    end
    else
        cycle[1:0] <= #1 2'b0;
end
*/
// Number of iteration
always @ (posedge clk or negedge reset_n)
begin: num_iter_r
    if(!reset_n)
        num_iter <= #1 5'h0;
    else if(sync_in)
        num_iter <= #1 5'h0;
    else if(fsm_cnu)
        num_iter <=#1 num_iter + 1'b1;
end

// This section is not implment in the end
//
always @ (posedge clk or negedge reset_n)
begin: counter_r
    if(!reset_n)
        counter <= #1 13'h0;
    else if(fsm[2] | fsm[3]) begin 
        if(wr_lq_end)   
            counter <= #1 13'h0;
        else
            counter <= #1 counter + 1'b1;
    end
    else if(fsm[4]) begin
        if(counter == counter_max)
            counter <= #1 13'h0;
        else
            counter <= #1 counter + 1'b1;  
    end  
end     
/*
always @ (posedge clk or negedge reset_n)
begin : wr_ena_r
    if(!reset_n)
        wr_ena <= #1 1'b0;
    else if(step[6])
        wr_ena <= #1 1'b1;
    else if(iter_end)
        wr_ena <= #1 1'b0;
end        
*/
always @ (posedge clk or negedge reset_n)
begin : wr_lq_r
    if(!reset_n)
        wr_lq <= #1 1'b0;
    else if(cycle[1:0] == 2'b10)
        wr_lq <= #1 1'b1;
    else
        wr_lq <= #1 1'b0;
end        

always @ (posedge clk or negedge reset_n)
begin : rd_lq_r
    if(!reset_n)
        rd_lq <= #1 1'b0;
    else if(cycle[3:2] == 2'b10)
        rd_lq <= #1 1'b1;
    else
        rd_lq <= #1 1'b0;
end
/*
always @ (posedge clk or negedge reset_n)
begin : wr_lr_r
    if(!reset_n)
        wr_lr<= #1 1'b0;
    else if(step[6])
        wr_lr <= #1 1'b1;
end  
*/
always @ (posedge clk or negedge reset_n)
begin : rd_lr_r
    if(!reset_n)
        rd_lr <= #1 1'b0;
    else 
        rd_lr <= #1 rd_lq_ena & (num_iter != 'd1);
end
/*
always @ (posedge clk or negedge reset_n)
begin : rd_lq_cnt_r
    if(!reset_n)
        rd_lq_cnt <= #1 8'h0;
    else if(step[3])
        rd_lq_cnt <= #1 rd_lq_cnt + 1'b1;
end

always @ (posedge clk or negedge reset_n)
begin : wr_lq_cnt_r
    if(!reset_n)
        wr_lq_cnt <= #1 8'h0;
    else if(step[10])
        wr_lq_cnt <= #1 wr_lq_cnt + 1'b1;
end
*/
always @ (posedge clk or negedge reset_n)
begin : step_r
    if(!reset_n)
        step <= #1 7'h0;
    else
        step <= #1 { step[5:0],rd_lq };
end        

always @ (posedge clk or negedge reset_n)
begin : iter_0r
    if(!reset_n)
        iter_0 <= #1 1'b0;
    else 
        iter_0 <= #1 (num_iter == 'd1);
end

assign fsm_cnu = (( fsm == DATA_I ) | fsm == VNU_U) & ( next_fsm == CNU_U );
assign rd_lq_end = (counter == 'd767);
assign wr_lq_end = (counter == 'd778);
assign wr_lq_pre = (counter == 'd777);

always @ (posedge clk or negedge reset_n)
begin : rd_lq_ena_r
    if(!reset_n)
        rd_lq_ena <= #1 1'b0;
    else if(fsm_cnu)
	rd_lq_ena <= #1 1'b1;
    else if(rd_lq_end)
	rd_lq_ena <= #1 1'b0;
end

always @ (posedge clk or negedge reset_n)
begin : wr_lq_ena_r
    if(!reset_n)
        wr_lq_ena <= #1 1'b0;
    else if(wr_lq_pre)
	wr_lq_ena <= #1 1'b0;
    else if(step[6] & rd_lq_ena)
	wr_lq_ena <= #1 1'b1;
end

always @ (posedge clk or negedge reset_n)
begin : wr_lr_ena_r
    if(!reset_n)
        wr_lr_ena <= #1 1'b0;
    else if(counter == 'd777)
	wr_lr_ena <= #1 1'b0;
    else if(step[6] & rd_lq_ena)
	wr_lr_ena <= #1 1'b1;
end

always @ (posedge clk or negedge reset_n)
begin : error_det_r
    if(!reset_n)
        error_det <= #1 1'b0;
    else if(fsm_cnu)
	error_det <= #1 1'b0;
    else if(sigma_vnu)
	error_det <= #1 1'b1;
end

always @ (posedge clk or negedge reset_n)
begin : fsm_r 
    if(!reset_n)
        fsm <= #1 IDLE;
    else
	fsm <= #1 next_fsm;
end

always @ (*)
begin
    case(fsm)
    IDLE: if(sync_in)
            next_fsm = DATA_I;
          else
            next_fsm = IDLE;
    DATA_I: if(sync_end)
	    next_fsm = CNU_U;
	    else
	    next_fsm = DATA_I;
    CNU_U: if(rd_lq_end)
	    next_fsm = VNU_U;
	    else
	    next_fsm = CNU_U;
    VNU_U: if(wr_lq_end) begin
	if(!error_det | iter_end)    
	    next_fsm = DATA_O;
        else 
            next_fsm = CNU_U;
        end
	else
	    next_fsm = VNU_U;
    DATA_O: if(sync_out_end)
	    next_fsm = IDLE;
	    else
	    next_fsm = DATA_O;
//    WAIT: 
//	next_fsm = IDLE;
    default:
	next_fsm = IDLE;
    endcase
end	

always @ (posedge clk or negedge reset_n)
begin : rd_cycle_r
    if(!reset_n)
        rd_cycle <= #1 2'b0;
    else if((fsm_cnu | rd_lq_ena) & (!rd_lq_end) ) begin
        if(rd_cycle == 2'b11)
        rd_cycle <= #1 2'b01;
        else
        rd_cycle <= #1 rd_cycle + 1'b1;
    end
    else
        rd_cycle <= #1 2'b0;
end

always @ (posedge clk or negedge reset_n)
begin : wr_cycle_r
    if(!reset_n)
        wr_cycle <= #1 2'h0;
    else if(wr_lq_ena) begin
	if(wr_cycle == 2'b11)
        wr_cycle <= #1 2'b01;
        else
        wr_cycle <= #1 wr_cycle + 1'b1;
    end
    else
	wr_cycle <= #1 2'b0;
end

endmodule
//Defines
//
//Module
`timescale 1 ns / 1 ps
module ldpc_dec(
    clk,
    reset_n,
    code_rate,
    data_in,
    sync_in,
    max_iter,

    data_out,
    sync_out,
    busy,
    num_iter,
);

parameter D_WID = 6;

//Input ports
input                clk        ;
input                reset_n    ;
input                code_rate  ; // 0, 1/2 1, 3/4
input   [D_WID-1:0]  data_in    ; // LLR input
input                sync_in    ;
input   [4:0]        max_iter   ;

//Output ports
output               data_out   ; 
output               sync_out   ;
output               busy       ; // ldpc is running
//output               finish     ; // ldpc decoder finish, can read new data
output  [4:0]        num_iter   ; // iteration number

//Internal wires definition
wire    [3:0]        fsm_state  ;

//Sub module body
//ldpc_ctv u_ldpc_ctv(   );

ldpc_ctrl u_ldpc_ctrl(
    .clk        (  clk        ),
    .reset_n    (  reset_n    ),
    .sync_in    (  sync_in    ),
    .code_rate  (  code_rate  ),
    .max_iter   (  max_iter   ),

    .fsm_state  (  fsm_state  ),
    .finish     (             ),
    .busy       (  busy       ),
    .num_iter   (  num_iter   ) 

);

//lr_decom u_lr_decom();

ldpc_vtc u_ldpc_vtc(
    .clk        ( clk        ),
    .reset_n    ( reset_n    ),
    .data_in    ( data_in    ),
    .sync_in    ( sync_in    ),
    .fsm_state  ( fsm_state  ),
    .code_rate  ( code_rate  ),

    .lq_dat_i   ( la_dat_i   ),
    .lq_dat_o   ( lq_dat_o   )
   
);

//ldpc_cnu u_ldpc_cnu();

endmodule

`timescale 1 ns / 1 ps //Module
module ldpc_vtc(
    clk,
    reset_n,
    data_in,
    sync_in,
    fsm_state,
    code_rate,

    lq_dat_i,
    lq_dat_o
);

//Parameter
parameter D_WID = 6;
parameter A_WID = 8;

//Input ports
input                 clk        ;
input                 reset_n    ;
input                 code_rate  ; // 0, 1/2 1, 3/4
input   [D_WID-1:0]   data_in    ; // LLR input
input                 sync_in    ;
input   [3:0]         fsm_state  ;
input  [12*D_WID-1:0] lq_dat_i   ;

//Output ports
output [12*D_WID-1:0] lq_dat_o   ;

//Internal Register and Wire definition

wire    [A_WID-1:0]   addr00     ;
wire    [A_WID-1:0]   addr01     ;
wire    [A_WID-1:0]   addr02     ;
wire    [A_WID-1:0]   addr03     ;
wire    [A_WID-1:0]   addr04     ;
wire    [A_WID-1:0]   addr05     ;
wire    [A_WID-1:0]   addr06     ;
wire    [A_WID-1:0]   addr07     ;
wire    [A_WID-1:0]   addr08     ;
wire    [A_WID-1:0]   addr09     ;
wire    [A_WID-1:0]   addr10     ;
wire    [A_WID-1:0]   addr11     ;
wire    [A_WID-1:0]   addr12     ;
wire    [A_WID-1:0]   addr13     ;
wire    [A_WID-1:0]   addr14     ;
wire    [A_WID-1:0]   addr15     ;
wire    [A_WID-1:0]   addr16     ;
wire    [A_WID-1:0]   addr17     ;
wire    [A_WID-1:0]   addr18     ;
wire    [A_WID-1:0]   addr19     ;
wire    [A_WID-1:0]   addr20     ;
wire    [A_WID-1:0]   addr21     ;
wire    [A_WID-1:0]   addr22     ;
wire    [A_WID-1:0]   addr23     ;
wire    [A_WID-1:0]   addr24     ;
wire    [A_WID-1:0]   addr25     ;
wire    [A_WID-1:0]   addr26     ;
wire    [A_WID-1:0]   addr27     ;
wire    [A_WID-1:0]   addr28     ;
wire    [A_WID-1:0]   addr29     ;
wire    [A_WID-1:0]   addr30     ;
wire    [A_WID-1:0]   addr31     ;
wire    [A_WID-1:0]   addr32     ;
wire    [A_WID-1:0]   addr33     ;
wire    [A_WID-1:0]   addr34     ;
wire    [A_WID-1:0]   addr35     ;

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

reg     [35:0]        sync_dly   ;
reg     [D_WID-1:0]   data_dly   ;
reg     [5:0]         sync_count ;

wire    [3:0]         fsm        ;
wire                  sync_in6   ;

assign fsm = fsm_state           ;
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
        data_dly <= #1 data_in;
end

vtc_cell cel_00(.clk(clk),.reset_n(reset_n),.sync_in(sync_dly[ 0]),.data_in(data_dly),.fsm(fsm),.ram_addr(addr00),.ram_wr(wr00),.ram_d(din00));
vtc_cell cel_01(.clk(clk),.reset_n(reset_n),.sync_in(sync_dly[ 1]),.data_in(data_dly),.fsm(fsm),.ram_addr(addr01),.ram_wr(wr01),.ram_d(din01));
vtc_cell cel_02(.clk(clk),.reset_n(reset_n),.sync_in(sync_dly[ 2]),.data_in(data_dly),.fsm(fsm),.ram_addr(addr02),.ram_wr(wr02),.ram_d(din02));
vtc_cell cel_03(.clk(clk),.reset_n(reset_n),.sync_in(sync_dly[ 3]),.data_in(data_dly),.fsm(fsm),.ram_addr(addr03),.ram_wr(wr03),.ram_d(din03));
vtc_cell cel_04(.clk(clk),.reset_n(reset_n),.sync_in(sync_dly[ 4]),.data_in(data_dly),.fsm(fsm),.ram_addr(addr04),.ram_wr(wr04),.ram_d(din04));
vtc_cell cel_05(.clk(clk),.reset_n(reset_n),.sync_in(sync_dly[ 5]),.data_in(data_dly),.fsm(fsm),.ram_addr(addr05),.ram_wr(wr05),.ram_d(din05));
vtc_cell cel_06(.clk(clk),.reset_n(reset_n),.sync_in(sync_dly[ 6]),.data_in(data_dly),.fsm(fsm),.ram_addr(addr06),.ram_wr(wr06),.ram_d(din06));
vtc_cell cel_07(.clk(clk),.reset_n(reset_n),.sync_in(sync_dly[ 7]),.data_in(data_dly),.fsm(fsm),.ram_addr(addr07),.ram_wr(wr07),.ram_d(din07));
vtc_cell cel_08(.clk(clk),.reset_n(reset_n),.sync_in(sync_dly[ 8]),.data_in(data_dly),.fsm(fsm),.ram_addr(addr08),.ram_wr(wr08),.ram_d(din08));
vtc_cell cel_09(.clk(clk),.reset_n(reset_n),.sync_in(sync_dly[ 9]),.data_in(data_dly),.fsm(fsm),.ram_addr(addr09),.ram_wr(wr09),.ram_d(din09));
vtc_cell cel_10(.clk(clk),.reset_n(reset_n),.sync_in(sync_dly[10]),.data_in(data_dly),.fsm(fsm),.ram_addr(addr10),.ram_wr(wr10),.ram_d(din10));
vtc_cell cel_11(.clk(clk),.reset_n(reset_n),.sync_in(sync_dly[11]),.data_in(data_dly),.fsm(fsm),.ram_addr(addr11),.ram_wr(wr11),.ram_d(din11));
vtc_cell cel_12(.clk(clk),.reset_n(reset_n),.sync_in(sync_dly[12]),.data_in(data_dly),.fsm(fsm),.ram_addr(addr12),.ram_wr(wr12),.ram_d(din12));
vtc_cell cel_13(.clk(clk),.reset_n(reset_n),.sync_in(sync_dly[13]),.data_in(data_dly),.fsm(fsm),.ram_addr(addr13),.ram_wr(wr13),.ram_d(din13));
vtc_cell cel_14(.clk(clk),.reset_n(reset_n),.sync_in(sync_dly[14]),.data_in(data_dly),.fsm(fsm),.ram_addr(addr14),.ram_wr(wr14),.ram_d(din14));
vtc_cell cel_15(.clk(clk),.reset_n(reset_n),.sync_in(sync_dly[15]),.data_in(data_dly),.fsm(fsm),.ram_addr(addr15),.ram_wr(wr15),.ram_d(din15));
vtc_cell cel_16(.clk(clk),.reset_n(reset_n),.sync_in(sync_dly[16]),.data_in(data_dly),.fsm(fsm),.ram_addr(addr16),.ram_wr(wr16),.ram_d(din16));
vtc_cell cel_17(.clk(clk),.reset_n(reset_n),.sync_in(sync_dly[17]),.data_in(data_dly),.fsm(fsm),.ram_addr(addr17),.ram_wr(wr17),.ram_d(din17));
vtc_cell cel_18(.clk(clk),.reset_n(reset_n),.sync_in(sync_dly[18]),.data_in(data_dly),.fsm(fsm),.ram_addr(addr18),.ram_wr(wr18),.ram_d(din18));
vtc_cell cel_19(.clk(clk),.reset_n(reset_n),.sync_in(sync_dly[19]),.data_in(data_dly),.fsm(fsm),.ram_addr(addr19),.ram_wr(wr19),.ram_d(din19));
vtc_cell cel_20(.clk(clk),.reset_n(reset_n),.sync_in(sync_dly[20]),.data_in(data_dly),.fsm(fsm),.ram_addr(addr20),.ram_wr(wr20),.ram_d(din20));
vtc_cell cel_21(.clk(clk),.reset_n(reset_n),.sync_in(sync_dly[21]),.data_in(data_dly),.fsm(fsm),.ram_addr(addr21),.ram_wr(wr21),.ram_d(din21));
vtc_cell cel_22(.clk(clk),.reset_n(reset_n),.sync_in(sync_dly[22]),.data_in(data_dly),.fsm(fsm),.ram_addr(addr22),.ram_wr(wr22),.ram_d(din22));
vtc_cell cel_23(.clk(clk),.reset_n(reset_n),.sync_in(sync_dly[23]),.data_in(data_dly),.fsm(fsm),.ram_addr(addr23),.ram_wr(wr23),.ram_d(din23));
vtc_cell cel_24(.clk(clk),.reset_n(reset_n),.sync_in(sync_dly[24]),.data_in(data_dly),.fsm(fsm),.ram_addr(addr24),.ram_wr(wr24),.ram_d(din24));
vtc_cell cel_25(.clk(clk),.reset_n(reset_n),.sync_in(sync_dly[25]),.data_in(data_dly),.fsm(fsm),.ram_addr(addr25),.ram_wr(wr25),.ram_d(din25));
vtc_cell cel_26(.clk(clk),.reset_n(reset_n),.sync_in(sync_dly[26]),.data_in(data_dly),.fsm(fsm),.ram_addr(addr26),.ram_wr(wr26),.ram_d(din26));
vtc_cell cel_27(.clk(clk),.reset_n(reset_n),.sync_in(sync_dly[27]),.data_in(data_dly),.fsm(fsm),.ram_addr(addr27),.ram_wr(wr27),.ram_d(din27));
vtc_cell cel_28(.clk(clk),.reset_n(reset_n),.sync_in(sync_dly[28]),.data_in(data_dly),.fsm(fsm),.ram_addr(addr28),.ram_wr(wr28),.ram_d(din28));
vtc_cell cel_29(.clk(clk),.reset_n(reset_n),.sync_in(sync_dly[29]),.data_in(data_dly),.fsm(fsm),.ram_addr(addr29),.ram_wr(wr29),.ram_d(din29));
vtc_cell cel_30(.clk(clk),.reset_n(reset_n),.sync_in(sync_dly[30]),.data_in(data_dly),.fsm(fsm),.ram_addr(addr30),.ram_wr(wr30),.ram_d(din30));
vtc_cell cel_31(.clk(clk),.reset_n(reset_n),.sync_in(sync_dly[31]),.data_in(data_dly),.fsm(fsm),.ram_addr(addr31),.ram_wr(wr31),.ram_d(din31));
vtc_cell cel_32(.clk(clk),.reset_n(reset_n),.sync_in(sync_dly[32]),.data_in(data_dly),.fsm(fsm),.ram_addr(addr32),.ram_wr(wr32),.ram_d(din32));
vtc_cell cel_33(.clk(clk),.reset_n(reset_n),.sync_in(sync_dly[33]),.data_in(data_dly),.fsm(fsm),.ram_addr(addr33),.ram_wr(wr33),.ram_d(din33));
vtc_cell cel_34(.clk(clk),.reset_n(reset_n),.sync_in(sync_dly[34]),.data_in(data_dly),.fsm(fsm),.ram_addr(addr34),.ram_wr(wr34),.ram_d(din34));
vtc_cell cel_35(.clk(clk),.reset_n(reset_n),.sync_in(sync_dly[35]),.data_in(data_dly),.fsm(fsm),.ram_addr(addr35),.ram_wr(wr35),.ram_d(din35));
//vtc_cell cel_06(.clk(clk),reset_n(reset_n),.sync_in(sync_dly[ 6]),.data_in(data_dly),.fsm(fsm),.ram_addr(addr06),.ram_wr(wr06),.ram_d(din06));
//vtc_cell cel_07(.clk(clk),reset_n(reset_n),.sync_in(sync_dly[ 7]),.data_in(data_dly),.fsm(fsm),.ram_addr(addr07),.ram_wr(wr07),.ram_d(din07));
//vtc_cell cel_08(.clk(clk),reset_n(reset_n),.sync_in(sync_dly[ 8]),.data_in(data_dly),.fsm(fsm),.ram_addr(addr08),.ram_wr(wr08),.ram_d(din08));
//vtc_cell cel_09(.clk(clk),reset_n(reset_n),.sync_in(sync_dly[ 9]),.data_in(data_dly),.fsm(fsm),.ram_addr(addr09),.ram_wr(wr09),.ram_d(din09));

sram256x8 u_ram00(.CLK(clk),.A(addr00),.CEN(1'b0),.WEN(wr00),.D(din00),.Q(dout00));
sram256x8 u_ram01(.CLK(clk),.A(addr01),.CEN(1'b0),.WEN(wr01),.D(din01),.Q(dout01));
sram256x8 u_ram02(.CLK(clk),.A(addr02),.CEN(1'b0),.WEN(wr02),.D(din02),.Q(dout02));
sram256x8 u_ram03(.CLK(clk),.A(addr03),.CEN(1'b0),.WEN(wr03),.D(din03),.Q(dout03));
sram256x8 u_ram04(.CLK(clk),.A(addr04),.CEN(1'b0),.WEN(wr04),.D(din04),.Q(dout04));
sram256x8 u_ram05(.CLK(clk),.A(addr05),.CEN(1'b0),.WEN(wr05),.D(din05),.Q(dout05));
sram256x8 u_ram06(.CLK(clk),.A(addr06),.CEN(1'b0),.WEN(wr06),.D(din06),.Q(dout06));
sram256x8 u_ram07(.CLK(clk),.A(addr07),.CEN(1'b0),.WEN(wr07),.D(din07),.Q(dout07));
sram256x8 u_ram08(.CLK(clk),.A(addr08),.CEN(1'b0),.WEN(wr08),.D(din08),.Q(dout08));
sram256x8 u_ram09(.CLK(clk),.A(addr09),.CEN(1'b0),.WEN(wr09),.D(din09),.Q(dout09));
sram256x8 u_ram10(.CLK(clk),.A(addr10),.CEN(1'b0),.WEN(wr10),.D(din00),.Q(dout10));
sram256x8 u_ram11(.CLK(clk),.A(addr11),.CEN(1'b0),.WEN(wr11),.D(din01),.Q(dout11));
sram256x8 u_ram12(.CLK(clk),.A(addr12),.CEN(1'b0),.WEN(wr12),.D(din02),.Q(dout12));
sram256x8 u_ram13(.CLK(clk),.A(addr13),.CEN(1'b0),.WEN(wr13),.D(din03),.Q(dout13));
sram256x8 u_ram14(.CLK(clk),.A(addr14),.CEN(1'b0),.WEN(wr14),.D(din04),.Q(dout14));
sram256x8 u_ram15(.CLK(clk),.A(addr15),.CEN(1'b0),.WEN(wr15),.D(din05),.Q(dout15));
sram256x8 u_ram16(.CLK(clk),.A(addr16),.CEN(1'b0),.WEN(wr16),.D(din06),.Q(dout16));
sram256x8 u_ram17(.CLK(clk),.A(addr17),.CEN(1'b0),.WEN(wr17),.D(din07),.Q(dout17));
sram256x8 u_ram18(.CLK(clk),.A(addr18),.CEN(1'b0),.WEN(wr18),.D(din08),.Q(dout18));
sram256x8 u_ram19(.CLK(clk),.A(addr19),.CEN(1'b0),.WEN(wr19),.D(din09),.Q(dout19));
sram256x8 u_ram20(.CLK(clk),.A(addr20),.CEN(1'b0),.WEN(wr20),.D(din00),.Q(dout20));
sram256x8 u_ram21(.CLK(clk),.A(addr21),.CEN(1'b0),.WEN(wr21),.D(din01),.Q(dout21));
sram256x8 u_ram22(.CLK(clk),.A(addr22),.CEN(1'b0),.WEN(wr22),.D(din02),.Q(dout22));
sram256x8 u_ram23(.CLK(clk),.A(addr23),.CEN(1'b0),.WEN(wr23),.D(din03),.Q(dout23));
sram256x8 u_ram24(.CLK(clk),.A(addr24),.CEN(1'b0),.WEN(wr24),.D(din04),.Q(dout24));
sram256x8 u_ram25(.CLK(clk),.A(addr25),.CEN(1'b0),.WEN(wr25),.D(din05),.Q(dout25));
sram256x8 u_ram26(.CLK(clk),.A(addr26),.CEN(1'b0),.WEN(wr26),.D(din06),.Q(dout26));
sram256x8 u_ram27(.CLK(clk),.A(addr27),.CEN(1'b0),.WEN(wr27),.D(din07),.Q(dout27));
sram256x8 u_ram28(.CLK(clk),.A(addr28),.CEN(1'b0),.WEN(wr28),.D(din08),.Q(dout28));
sram256x8 u_ram29(.CLK(clk),.A(addr29),.CEN(1'b0),.WEN(wr29),.D(din09),.Q(dout29));
sram256x8 u_ram30(.CLK(clk),.A(addr30),.CEN(1'b0),.WEN(wr30),.D(din30),.Q(dout30));
sram256x8 u_ram31(.CLK(clk),.A(addr31),.CEN(1'b0),.WEN(wr31),.D(din31),.Q(dout31));
sram256x8 u_ram32(.CLK(clk),.A(addr32),.CEN(1'b0),.WEN(wr32),.D(din32),.Q(dout32));
sram256x8 u_ram33(.CLK(clk),.A(addr33),.CEN(1'b0),.WEN(wr33),.D(din33),.Q(dout33));
sram256x8 u_ram34(.CLK(clk),.A(addr34),.CEN(1'b0),.WEN(wr34),.D(din34),.Q(dout34));
sram256x8 u_ram35(.CLK(clk),.A(addr35),.CEN(1'b0),.WEN(wr35),.D(din35),.Q(dout35));

endmodule

`timescale 1 ns / 1 ps
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

`timescale 1 ns / 1 ps
module out_table(
    clk,
    addr,
    q
);

input          clk ;
input [12:0]   addr;
output [13:0]  q;
reg   [13:0]  q;
always @ (addr)
case(addr)
13'd0     : q  = {   8'd36    ,  6'd16 };
13'd1     : q  = {   8'd128   ,  6'd1  };
13'd2     : q  = {   8'd40    ,  6'd21 };
13'd3     : q  = {   8'd128   ,  6'd3  };
13'd4     : q  = {   8'd128   ,  6'd4  };
13'd5     : q  = {   8'd128   ,  6'd5  };
13'd6     : q  = {   8'd128   ,  6'd6  };
13'd7     : q  = {   8'd68    ,  6'd35 };
13'd8     : q  = {   8'd128   ,  6'd8  };
13'd9     : q  = {   8'd125   ,  6'd30 };
13'd10    : q  = {   8'd6     ,  6'd21 };
13'd11    : q  = {   8'd40    ,  6'd23 };
13'd12    : q  = {   8'd39    ,  6'd25 };
13'd13    : q  = {   8'd14    ,  6'd14 };
13'd14    : q  = {   8'd128   ,  6'd14 };
13'd15    : q  = {   8'd128   ,  6'd15 };
13'd16    : q  = {   8'd99    ,  6'd11 };
13'd17    : q  = {   8'd74    ,  6'd15 };
13'd18    : q  = {   8'd38    ,  6'd26 };
13'd19    : q  = {   8'd23    ,  6'd15 };
13'd20    : q  = {   8'd40    ,  6'd24 };
13'd21    : q  = {   8'd40    ,  6'd25 };
13'd22    : q  = {   8'd40    ,  6'd26 };
13'd23    : q  = {   8'd30    ,  6'd3  };
13'd24    : q  = {   8'd40    ,  6'd28 };
13'd25    : q  = {   8'd36    ,  6'd34 };
13'd26    : q  = {   8'd34    ,  6'd9  };
13'd27    : q  = {   8'd128   ,  6'd27 };
13'd28    : q  = {   8'd128   ,  6'd28 };
13'd29    : q  = {   8'd128   ,  6'd29 };
13'd30    : q  = {   8'd113   ,  6'd11 };
13'd31    : q  = {   8'd40    ,  6'd29 };
13'd32    : q  = {   8'd128   ,  6'd32 };
13'd33    : q  = {   8'd124   ,  6'd11 };
13'd34    : q  = {   8'd69    ,  6'd1  };
13'd35    : q  = {   8'd34    ,  6'd8  };
13'd36    : q  = {   8'd40    ,  6'd30 };
13'd37    : q  = {   8'd129   ,  6'd1  };
13'd38    : q  = {   8'd40    ,  6'd31 };
13'd39    : q  = {   8'd125   ,  6'd1  };
13'd40    : q  = {   8'd39    ,  6'd19 };
13'd41    : q  = {   8'd116   ,  6'd23 };
13'd42    : q  = {   8'd129   ,  6'd6  };
13'd43    : q  = {   8'd32    ,  6'd32 };
13'd44    : q  = {   8'd116   ,  6'd3  };
13'd45    : q  = {   8'd129   ,  6'd9  };
13'd46    : q  = {   8'd40    ,  6'd32 };
13'd47    : q  = {   8'd14    ,  6'd28 };
13'd48    : q  = {   8'd129   ,  6'd12 };
13'd49    : q  = {   8'd78    ,  6'd4  };
13'd50    : q  = {   8'd129   ,  6'd14 };
13'd51    : q  = {   8'd129   ,  6'd15 };
13'd52    : q  = {   8'd129   ,  6'd16 };
13'd53    : q  = {   8'd129   ,  6'd17 };
13'd54    : q  = {   8'd126   ,  6'd15 };
13'd55    : q  = {   8'd81    ,  6'd13 };
13'd56    : q  = {   8'd68    ,  6'd18 };
13'd57    : q  = {   8'd104   ,  6'd3  };
13'd58    : q  = {   8'd41    ,  6'd0  };
13'd59    : q  = {   8'd129   ,  6'd23 };
13'd60    : q  = {   8'd73    ,  6'd9  };
13'd61    : q  = {   8'd129   ,  6'd25 };
13'd62    : q  = {   8'd11    ,  6'd16 };
13'd63    : q  = {   8'd129   ,  6'd27 };
13'd64    : q  = {   8'd129   ,  6'd28 };
13'd65    : q  = {   8'd126   ,  6'd6  };
13'd66    : q  = {   8'd129   ,  6'd30 };
13'd67    : q  = {   8'd3     ,  6'd18 };
13'd68    : q  = {   8'd85    ,  6'd18 };
13'd69    : q  = {   8'd129   ,  6'd33 };
13'd70    : q  = {   8'd69    ,  6'd2  };
13'd71    : q  = {   8'd129   ,  6'd35 };
13'd72    : q  = {   8'd14    ,  6'd32 };
13'd73    : q  = {   8'd130   ,  6'd1  };
13'd74    : q  = {   8'd5     ,  6'd7  };
13'd75    : q  = {   8'd5     ,  6'd12 };
13'd76    : q  = {   8'd105   ,  6'd30 };
13'd77    : q  = {   8'd130   ,  6'd5  };
13'd78    : q  = {   8'd130   ,  6'd6  };
13'd79    : q  = {   8'd81    ,  6'd15 };
13'd80    : q  = {   8'd130   ,  6'd8  };
13'd81    : q  = {   8'd130   ,  6'd9  };
13'd82    : q  = {   8'd41    ,  6'd5  };
13'd83    : q  = {   8'd41    ,  6'd6  };
13'd84    : q  = {   8'd130   ,  6'd12 };
13'd85    : q  = {   8'd81    ,  6'd8  };
13'd86    : q  = {   8'd130   ,  6'd14 };
13'd87    : q  = {   8'd130   ,  6'd15 };
13'd88    : q  = {   8'd130   ,  6'd16 };
13'd89    : q  = {   8'd27    ,  6'd13 };
13'd90    : q  = {   8'd113   ,  6'd23 };
13'd91    : q  = {   8'd69    ,  6'd3  };
13'd92    : q  = {   8'd14    ,  6'd33 };
13'd93    : q  = {   8'd41    ,  6'd8  };
13'd94    : q  = {   8'd74    ,  6'd16 };
13'd95    : q  = {   8'd34    ,  6'd23 };
13'd96    : q  = {   8'd130   ,  6'd24 };
13'd97    : q  = {   8'd130   ,  6'd25 };
13'd98    : q  = {   8'd100   ,  6'd25 };
13'd99    : q  = {   8'd126   ,  6'd23 };
13'd100   : q  = {   8'd130   ,  6'd28 };
13'd101   : q  = {   8'd118   ,  6'd1  };
13'd102   : q  = {   8'd130   ,  6'd30 };
13'd103   : q  = {   8'd41    ,  6'd10 };
13'd104   : q  = {   8'd36    ,  6'd32 };
13'd105   : q  = {   8'd130   ,  6'd33 };
13'd106   : q  = {   8'd69    ,  6'd4  };
13'd107   : q  = {   8'd130   ,  6'd35 };
13'd108   : q  = {   8'd6     ,  6'd24 };
13'd109   : q  = {   8'd131   ,  6'd1  };
13'd110   : q  = {   8'd6     ,  6'd25 };
13'd111   : q  = {   8'd40    ,  6'd15 };
13'd112   : q  = {   8'd121   ,  6'd16 };
13'd113   : q  = {   8'd131   ,  6'd5  };
13'd114   : q  = {   8'd131   ,  6'd6  };
13'd115   : q  = {   8'd69    ,  6'd5  };
13'd116   : q  = {   8'd131   ,  6'd8  };
13'd117   : q  = {   8'd131   ,  6'd9  };
13'd118   : q  = {   8'd109   ,  6'd15 };
13'd119   : q  = {   8'd41    ,  6'd14 };
13'd120   : q  = {   8'd117   ,  6'd1  };
13'd121   : q  = {   8'd73    ,  6'd12 };
13'd122   : q  = {   8'd131   ,  6'd14 };
13'd123   : q  = {   8'd131   ,  6'd15 };
13'd124   : q  = {   8'd131   ,  6'd16 };
13'd125   : q  = {   8'd131   ,  6'd17 };
13'd126   : q  = {   8'd95    ,  6'd18 };
13'd127   : q  = {   8'd90    ,  6'd0  };
13'd128   : q  = {   8'd111   ,  6'd18 };
13'd129   : q  = {   8'd15    ,  6'd1  };
13'd130   : q  = {   8'd41    ,  6'd17 };
13'd131   : q  = {   8'd131   ,  6'd23 };
13'd132   : q  = {   8'd26    ,  6'd9  };
13'd133   : q  = {   8'd131   ,  6'd25 };
13'd134   : q  = {   8'd41    ,  6'd18 };
13'd135   : q  = {   8'd131   ,  6'd27 };
13'd136   : q  = {   8'd81    ,  6'd17 };
13'd137   : q  = {   8'd131   ,  6'd29 };
13'd138   : q  = {   8'd118   ,  6'd31 };
13'd139   : q  = {   8'd41    ,  6'd19 };
13'd140   : q  = {   8'd90    ,  6'd2  };
13'd141   : q  = {   8'd131   ,  6'd33 };
13'd142   : q  = {   8'd41    ,  6'd20 };
13'd143   : q  = {   8'd131   ,  6'd35 };
13'd144   : q  = {   8'd94    ,  6'd20 };
13'd145   : q  = {   8'd14    ,  6'd17 };
13'd146   : q  = {   8'd15    ,  6'd2  };
13'd147   : q  = {   8'd30    ,  6'd6  };
13'd148   : q  = {   8'd6     ,  6'd5  };
13'd149   : q  = {   8'd103   ,  6'd12 };
13'd150   : q  = {   8'd132   ,  6'd6  };
13'd151   : q  = {   8'd69    ,  6'd6  };
13'd152   : q  = {   8'd132   ,  6'd8  };
13'd153   : q  = {   8'd132   ,  6'd9  };
13'd154   : q  = {   8'd41    ,  6'd24 };
13'd155   : q  = {   8'd41    ,  6'd25 };
13'd156   : q  = {   8'd132   ,  6'd12 };
13'd157   : q  = {   8'd132   ,  6'd13 };
13'd158   : q  = {   8'd132   ,  6'd14 };
13'd159   : q  = {   8'd132   ,  6'd15 };
13'd160   : q  = {   8'd32    ,  6'd7  };
13'd161   : q  = {   8'd81    ,  6'd18 };
13'd162   : q  = {   8'd102   ,  6'd5  };
13'd163   : q  = {   8'd90    ,  6'd4  };
13'd164   : q  = {   8'd41    ,  6'd26 };
13'd165   : q  = {   8'd114   ,  6'd27 };
13'd166   : q  = {   8'd41    ,  6'd28 };
13'd167   : q  = {   8'd132   ,  6'd23 };
13'd168   : q  = {   8'd132   ,  6'd24 };
13'd169   : q  = {   8'd132   ,  6'd25 };
13'd170   : q  = {   8'd41    ,  6'd29 };
13'd171   : q  = {   8'd132   ,  6'd27 };
13'd172   : q  = {   8'd132   ,  6'd28 };
13'd173   : q  = {   8'd132   ,  6'd29 };
13'd174   : q  = {   8'd110   ,  6'd8  };
13'd175   : q  = {   8'd41    ,  6'd30 };
13'd176   : q  = {   8'd92    ,  6'd4  };
13'd177   : q  = {   8'd9     ,  6'd22 };
13'd178   : q  = {   8'd41    ,  6'd31 };
13'd179   : q  = {   8'd132   ,  6'd35 };
13'd180   : q  = {   8'd27    ,  6'd5  };
13'd181   : q  = {   8'd133   ,  6'd1  };
13'd182   : q  = {   8'd41    ,  6'd32 };
13'd183   : q  = {   8'd15    ,  6'd4  };
13'd184   : q  = {   8'd133   ,  6'd4  };
13'd185   : q  = {   8'd133   ,  6'd5  };
13'd186   : q  = {   8'd133   ,  6'd6  };
13'd187   : q  = {   8'd2     ,  6'd5  };
13'd188   : q  = {   8'd97    ,  6'd23 };
13'd189   : q  = {   8'd133   ,  6'd9  };
13'd190   : q  = {   8'd15    ,  6'd6  };
13'd191   : q  = {   8'd110   ,  6'd3  };
13'd192   : q  = {   8'd32    ,  6'd18 };
13'd193   : q  = {   8'd133   ,  6'd13 };
13'd194   : q  = {   8'd133   ,  6'd14 };
13'd195   : q  = {   8'd133   ,  6'd15 };
13'd196   : q  = {   8'd133   ,  6'd16 };
13'd197   : q  = {   8'd81    ,  6'd19 };
13'd198   : q  = {   8'd74    ,  6'd18 };
13'd199   : q  = {   8'd133   ,  6'd19 };
13'd200   : q  = {   8'd133   ,  6'd20 };
13'd201   : q  = {   8'd30    ,  6'd7  };
13'd202   : q  = {   8'd15    ,  6'd9  };
13'd203   : q  = {   8'd133   ,  6'd23 };
13'd204   : q  = {   8'd133   ,  6'd24 };
13'd205   : q  = {   8'd133   ,  6'd25 };
13'd206   : q  = {   8'd42    ,  6'd4  };
13'd207   : q  = {   8'd133   ,  6'd27 };
13'd208   : q  = {   8'd133   ,  6'd28 };
13'd209   : q  = {   8'd133   ,  6'd29 };
13'd210   : q  = {   8'd12    ,  6'd18 };
13'd211   : q  = {   8'd114   ,  6'd33 };
13'd212   : q  = {   8'd133   ,  6'd32 };
13'd213   : q  = {   8'd133   ,  6'd33 };
13'd214   : q  = {   8'd106   ,  6'd18 };
13'd215   : q  = {   8'd73    ,  6'd32 };
13'd216   : q  = {   8'd107   ,  6'd24 };
13'd217   : q  = {   8'd134   ,  6'd1  };
13'd218   : q  = {   8'd38    ,  6'd6  };
13'd219   : q  = {   8'd100   ,  6'd26 };
13'd220   : q  = {   8'd134   ,  6'd4  };
13'd221   : q  = {   8'd134   ,  6'd5  };
13'd222   : q  = {   8'd134   ,  6'd6  };
13'd223   : q  = {   8'd120   ,  6'd25 };
13'd224   : q  = {   8'd134   ,  6'd8  };
13'd225   : q  = {   8'd134   ,  6'd9  };
13'd226   : q  = {   8'd15    ,  6'd11 };
13'd227   : q  = {   8'd42    ,  6'd10 };
13'd228   : q  = {   8'd15    ,  6'd12 };
13'd229   : q  = {   8'd9     ,  6'd17 };
13'd230   : q  = {   8'd134   ,  6'd14 };
13'd231   : q  = {   8'd40    ,  6'd13 };
13'd232   : q  = {   8'd134   ,  6'd16 };
13'd233   : q  = {   8'd134   ,  6'd17 };
13'd234   : q  = {   8'd124   ,  6'd2  };
13'd235   : q  = {   8'd134   ,  6'd19 };
13'd236   : q  = {   8'd110   ,  6'd31 };
13'd237   : q  = {   8'd6     ,  6'd28 };
13'd238   : q  = {   8'd68    ,  6'd8  };
13'd239   : q  = {   8'd134   ,  6'd23 };
13'd240   : q  = {   8'd134   ,  6'd24 };
13'd241   : q  = {   8'd134   ,  6'd25 };
13'd242   : q  = {   8'd28    ,  6'd23 };
13'd243   : q  = {   8'd134   ,  6'd27 };
13'd244   : q  = {   8'd134   ,  6'd28 };
13'd245   : q  = {   8'd119   ,  6'd23 };
13'd246   : q  = {   8'd134   ,  6'd30 };
13'd247   : q  = {   8'd125   ,  6'd28 };
13'd248   : q  = {   8'd12    ,  6'd15 };
13'd249   : q  = {   8'd134   ,  6'd33 };
13'd250   : q  = {   8'd134   ,  6'd34 };
13'd251   : q  = {   8'd134   ,  6'd35 };
13'd252   : q  = {   8'd107   ,  6'd19 };
13'd253   : q  = {   8'd135   ,  6'd1  };
13'd254   : q  = {   8'd101   ,  6'd15 };
13'd255   : q  = {   8'd10    ,  6'd8  };
13'd256   : q  = {   8'd120   ,  6'd21 };
13'd257   : q  = {   8'd92    ,  6'd5  };
13'd258   : q  = {   8'd135   ,  6'd6  };
13'd259   : q  = {   8'd100   ,  6'd21 };
13'd260   : q  = {   8'd135   ,  6'd8  };
13'd261   : q  = {   8'd135   ,  6'd9  };
13'd262   : q  = {   8'd113   ,  6'd17 };
13'd263   : q  = {   8'd42    ,  6'd17 };
13'd264   : q  = {   8'd42    ,  6'd18 };
13'd265   : q  = {   8'd135   ,  6'd13 };
13'd266   : q  = {   8'd135   ,  6'd14 };
13'd267   : q  = {   8'd135   ,  6'd15 };
13'd268   : q  = {   8'd135   ,  6'd16 };
13'd269   : q  = {   8'd116   ,  6'd14 };
13'd270   : q  = {   8'd24    ,  6'd28 };
13'd271   : q  = {   8'd81    ,  6'd20 };
13'd272   : q  = {   8'd135   ,  6'd20 };
13'd273   : q  = {   8'd85    ,  6'd23 };
13'd274   : q  = {   8'd90    ,  6'd8  };
13'd275   : q  = {   8'd135   ,  6'd23 };
13'd276   : q  = {   8'd135   ,  6'd24 };
13'd277   : q  = {   8'd135   ,  6'd25 };
13'd278   : q  = {   8'd34    ,  6'd14 };
13'd279   : q  = {   8'd135   ,  6'd27 };
13'd280   : q  = {   8'd30    ,  6'd26 };
13'd281   : q  = {   8'd114   ,  6'd18 };
13'd282   : q  = {   8'd33    ,  6'd13 };
13'd283   : q  = {   8'd30    ,  6'd9  };
13'd284   : q  = {   8'd28    ,  6'd24 };
13'd285   : q  = {   8'd135   ,  6'd33 };
13'd286   : q  = {   8'd135   ,  6'd34 };
13'd287   : q  = {   8'd135   ,  6'd35 };
13'd288   : q  = {   8'd136   ,  6'd0  };
13'd289   : q  = {   8'd119   ,  6'd30 };
13'd290   : q  = {   8'd15    ,  6'd15 };
13'd291   : q  = {   8'd74    ,  6'd21 };
13'd292   : q  = {   8'd90    ,  6'd11 };
13'd293   : q  = {   8'd113   ,  6'd3  };
13'd294   : q  = {   8'd136   ,  6'd6  };
13'd295   : q  = {   8'd125   ,  6'd6  };
13'd296   : q  = {   8'd136   ,  6'd8  };
13'd297   : q  = {   8'd136   ,  6'd9  };
13'd298   : q  = {   8'd42    ,  6'd24 };
13'd299   : q  = {   8'd42    ,  6'd25 };
13'd300   : q  = {   8'd32    ,  6'd20 };
13'd301   : q  = {   8'd34    ,  6'd29 };
13'd302   : q  = {   8'd27    ,  6'd6  };
13'd303   : q  = {   8'd109   ,  6'd5  };
13'd304   : q  = {   8'd136   ,  6'd16 };
13'd305   : q  = {   8'd25    ,  6'd3  };
13'd306   : q  = {   8'd136   ,  6'd18 };
13'd307   : q  = {   8'd136   ,  6'd19 };
13'd308   : q  = {   8'd136   ,  6'd20 };
13'd309   : q  = {   8'd84    ,  6'd15 };
13'd310   : q  = {   8'd11    ,  6'd27 };
13'd311   : q  = {   8'd136   ,  6'd23 };
13'd312   : q  = {   8'd33    ,  6'd28 };
13'd313   : q  = {   8'd136   ,  6'd25 };
13'd314   : q  = {   8'd85    ,  6'd25 };
13'd315   : q  = {   8'd42    ,  6'd28 };
13'd316   : q  = {   8'd123   ,  6'd14 };
13'd317   : q  = {   8'd136   ,  6'd29 };
13'd318   : q  = {   8'd136   ,  6'd30 };
13'd319   : q  = {   8'd42    ,  6'd29 };
13'd320   : q  = {   8'd136   ,  6'd32 };
13'd321   : q  = {   8'd136   ,  6'd33 };
13'd322   : q  = {   8'd11    ,  6'd1  };
13'd323   : q  = {   8'd74    ,  6'd23 };
13'd324   : q  = {   8'd106   ,  6'd6  };
13'd325   : q  = {   8'd137   ,  6'd1  };
13'd326   : q  = {   8'd137   ,  6'd2  };
13'd327   : q  = {   8'd42    ,  6'd30 };
13'd328   : q  = {   8'd42    ,  6'd31 };
13'd329   : q  = {   8'd92    ,  6'd6  };
13'd330   : q  = {   8'd127   ,  6'd17 };
13'd331   : q  = {   8'd137   ,  6'd7  };
13'd332   : q  = {   8'd137   ,  6'd8  };
13'd333   : q  = {   8'd137   ,  6'd9  };
13'd334   : q  = {   8'd137   ,  6'd10 };
13'd335   : q  = {   8'd42    ,  6'd32 };
13'd336   : q  = {   8'd15    ,  6'd17 };
13'd337   : q  = {   8'd137   ,  6'd13 };
13'd338   : q  = {   8'd137   ,  6'd14 };
13'd339   : q  = {   8'd137   ,  6'd15 };
13'd340   : q  = {   8'd110   ,  6'd10 };
13'd341   : q  = {   8'd0     ,  6'd28 };
13'd342   : q  = {   8'd137   ,  6'd18 };
13'd343   : q  = {   8'd137   ,  6'd19 };
13'd344   : q  = {   8'd137   ,  6'd20 };
13'd345   : q  = {   8'd137   ,  6'd21 };
13'd346   : q  = {   8'd15    ,  6'd18 };
13'd347   : q  = {   8'd14    ,  6'd25 };
13'd348   : q  = {   8'd99    ,  6'd14 };
13'd349   : q  = {   8'd137   ,  6'd25 };
13'd350   : q  = {   8'd2     ,  6'd6  };
13'd351   : q  = {   8'd113   ,  6'd31 };
13'd352   : q  = {   8'd85    ,  6'd26 };
13'd353   : q  = {   8'd137   ,  6'd29 };
13'd354   : q  = {   8'd137   ,  6'd30 };
13'd355   : q  = {   8'd6     ,  6'd30 };
13'd356   : q  = {   8'd137   ,  6'd32 };
13'd357   : q  = {   8'd137   ,  6'd33 };
13'd358   : q  = {   8'd37    ,  6'd6  };
13'd359   : q  = {   8'd3     ,  6'd21 };
13'd360   : q  = {   8'd138   ,  6'd0  };
13'd361   : q  = {   8'd138   ,  6'd1  };
13'd362   : q  = {   8'd80    ,  6'd33 };
13'd363   : q  = {   8'd43    ,  6'd4  };
13'd364   : q  = {   8'd138   ,  6'd4  };
13'd365   : q  = {   8'd138   ,  6'd5  };
13'd366   : q  = {   8'd138   ,  6'd6  };
13'd367   : q  = {   8'd43    ,  6'd5  };
13'd368   : q  = {   8'd138   ,  6'd8  };
13'd369   : q  = {   8'd138   ,  6'd9  };
13'd370   : q  = {   8'd110   ,  6'd21 };
13'd371   : q  = {   8'd95    ,  6'd20 };
13'd372   : q  = {   8'd15    ,  6'd23 };
13'd373   : q  = {   8'd68    ,  6'd6  };
13'd374   : q  = {   8'd138   ,  6'd14 };
13'd375   : q  = {   8'd31    ,  6'd14 };
13'd376   : q  = {   8'd100   ,  6'd18 };
13'd377   : q  = {   8'd138   ,  6'd17 };
13'd378   : q  = {   8'd138   ,  6'd18 };
13'd379   : q  = {   8'd112   ,  6'd34 };
13'd380   : q  = {   8'd138   ,  6'd20 };
13'd381   : q  = {   8'd138   ,  6'd21 };
13'd382   : q  = {   8'd6     ,  6'd32 };
13'd383   : q  = {   8'd126   ,  6'd8  };
13'd384   : q  = {   8'd138   ,  6'd24 };
13'd385   : q  = {   8'd138   ,  6'd25 };
13'd386   : q  = {   8'd43    ,  6'd10 };
13'd387   : q  = {   8'd138   ,  6'd27 };
13'd388   : q  = {   8'd85    ,  6'd27 };
13'd389   : q  = {   8'd138   ,  6'd29 };
13'd390   : q  = {   8'd138   ,  6'd30 };
13'd391   : q  = {   8'd15    ,  6'd25 };
13'd392   : q  = {   8'd93    ,  6'd10 };
13'd393   : q  = {   8'd138   ,  6'd33 };
13'd394   : q  = {   8'd138   ,  6'd34 };
13'd395   : q  = {   8'd6     ,  6'd33 };
13'd396   : q  = {   8'd126   ,  6'd1  };
13'd397   : q  = {   8'd139   ,  6'd1  };
13'd398   : q  = {   8'd35    ,  6'd7  };
13'd399   : q  = {   8'd139   ,  6'd3  };
13'd400   : q  = {   8'd40    ,  6'd0  };
13'd401   : q  = {   8'd95    ,  6'd21 };
13'd402   : q  = {   8'd112   ,  6'd10 };
13'd403   : q  = {   8'd118   ,  6'd21 };
13'd404   : q  = {   8'd139   ,  6'd8  };
13'd405   : q  = {   8'd139   ,  6'd9  };
13'd406   : q  = {   8'd89    ,  6'd0  };
13'd407   : q  = {   8'd114   ,  6'd24 };
13'd408   : q  = {   8'd113   ,  6'd0  };
13'd409   : q  = {   8'd139   ,  6'd13 };
13'd410   : q  = {   8'd38    ,  6'd9  };
13'd411   : q  = {   8'd139   ,  6'd15 };
13'd412   : q  = {   8'd139   ,  6'd16 };
13'd413   : q  = {   8'd90    ,  6'd13 };
13'd414   : q  = {   8'd139   ,  6'd18 };
13'd415   : q  = {   8'd36    ,  6'd4  };
13'd416   : q  = {   8'd139   ,  6'd20 };
13'd417   : q  = {   8'd38    ,  6'd29 };
13'd418   : q  = {   8'd15    ,  6'd27 };
13'd419   : q  = {   8'd139   ,  6'd23 };
13'd420   : q  = {   8'd105   ,  6'd24 };
13'd421   : q  = {   8'd139   ,  6'd25 };
13'd422   : q  = {   8'd39    ,  6'd20 };
13'd423   : q  = {   8'd119   ,  6'd24 };
13'd424   : q  = {   8'd85    ,  6'd28 };
13'd425   : q  = {   8'd101   ,  6'd17 };
13'd426   : q  = {   8'd139   ,  6'd30 };
13'd427   : q  = {   8'd28    ,  6'd25 };
13'd428   : q  = {   8'd34    ,  6'd1  };
13'd429   : q  = {   8'd139   ,  6'd33 };
13'd430   : q  = {   8'd139   ,  6'd34 };
13'd431   : q  = {   8'd92    ,  6'd7  };
13'd432   : q  = {   8'd90    ,  6'd14 };
13'd433   : q  = {   8'd140   ,  6'd1  };
13'd434   : q  = {   8'd15    ,  6'd28 };
13'd435   : q  = {   8'd24    ,  6'd25 };
13'd436   : q  = {   8'd98    ,  6'd34 };
13'd437   : q  = {   8'd140   ,  6'd5  };
13'd438   : q  = {   8'd140   ,  6'd6  };
13'd439   : q  = {   8'd98    ,  6'd1  };
13'd440   : q  = {   8'd43    ,  6'd24 };
13'd441   : q  = {   8'd140   ,  6'd9  };
13'd442   : q  = {   8'd140   ,  6'd10 };
13'd443   : q  = {   8'd114   ,  6'd29 };
13'd444   : q  = {   8'd140   ,  6'd12 };
13'd445   : q  = {   8'd102   ,  6'd33 };
13'd446   : q  = {   8'd140   ,  6'd14 };
13'd447   : q  = {   8'd88    ,  6'd31 };
13'd448   : q  = {   8'd140   ,  6'd16 };
13'd449   : q  = {   8'd140   ,  6'd17 };
13'd450   : q  = {   8'd140   ,  6'd18 };
13'd451   : q  = {   8'd140   ,  6'd19 };
13'd452   : q  = {   8'd125   ,  6'd31 };
13'd453   : q  = {   8'd28    ,  6'd20 };
13'd454   : q  = {   8'd79    ,  6'd35 };
13'd455   : q  = {   8'd140   ,  6'd23 };
13'd456   : q  = {   8'd140   ,  6'd24 };
13'd457   : q  = {   8'd140   ,  6'd25 };
13'd458   : q  = {   8'd140   ,  6'd26 };
13'd459   : q  = {   8'd140   ,  6'd27 };
13'd460   : q  = {   8'd11    ,  6'd15 };
13'd461   : q  = {   8'd140   ,  6'd29 };
13'd462   : q  = {   8'd140   ,  6'd30 };
13'd463   : q  = {   8'd43    ,  6'd29 };
13'd464   : q  = {   8'd38    ,  6'd1  };
13'd465   : q  = {   8'd140   ,  6'd33 };
13'd466   : q  = {   8'd140   ,  6'd34 };
13'd467   : q  = {   8'd115   ,  6'd21 };
13'd468   : q  = {   8'd141   ,  6'd0  };
13'd469   : q  = {   8'd141   ,  6'd1  };
13'd470   : q  = {   8'd31    ,  6'd3  };
13'd471   : q  = {   8'd85    ,  6'd31 };
13'd472   : q  = {   8'd141   ,  6'd4  };
13'd473   : q  = {   8'd141   ,  6'd5  };
13'd474   : q  = {   8'd141   ,  6'd6  };
13'd475   : q  = {   8'd121   ,  6'd14 };
13'd476   : q  = {   8'd141   ,  6'd8  };
13'd477   : q  = {   8'd141   ,  6'd9  };
13'd478   : q  = {   8'd141   ,  6'd10 };
13'd479   : q  = {   8'd43    ,  6'd31 };
13'd480   : q  = {   8'd43    ,  6'd32 };
13'd481   : q  = {   8'd141   ,  6'd13 };
13'd482   : q  = {   8'd141   ,  6'd14 };
13'd483   : q  = {   8'd141   ,  6'd15 };
13'd484   : q  = {   8'd74    ,  6'd27 };
13'd485   : q  = {   8'd141   ,  6'd17 };
13'd486   : q  = {   8'd141   ,  6'd18 };
13'd487   : q  = {   8'd100   ,  6'd30 };
13'd488   : q  = {   8'd141   ,  6'd20 };
13'd489   : q  = {   8'd141   ,  6'd21 };
13'd490   : q  = {   8'd74    ,  6'd8  };
13'd491   : q  = {   8'd69    ,  6'd8  };
13'd492   : q  = {   8'd108   ,  6'd5  };
13'd493   : q  = {   8'd141   ,  6'd25 };
13'd494   : q  = {   8'd120   ,  6'd11 };
13'd495   : q  = {   8'd141   ,  6'd27 };
13'd496   : q  = {   8'd85    ,  6'd32 };
13'd497   : q  = {   8'd141   ,  6'd29 };
13'd498   : q  = {   8'd141   ,  6'd30 };
13'd499   : q  = {   8'd15    ,  6'd32 };
13'd500   : q  = {   8'd141   ,  6'd32 };
13'd501   : q  = {   8'd141   ,  6'd33 };
13'd502   : q  = {   8'd141   ,  6'd34 };
13'd503   : q  = {   8'd44    ,  6'd0  };
13'd504   : q  = {   8'd112   ,  6'd12 };
13'd505   : q  = {   8'd142   ,  6'd1  };
13'd506   : q  = {   8'd15    ,  6'd33 };
13'd507   : q  = {   8'd142   ,  6'd3  };
13'd508   : q  = {   8'd142   ,  6'd4  };
13'd509   : q  = {   8'd142   ,  6'd5  };
13'd510   : q  = {   8'd108   ,  6'd1  };
13'd511   : q  = {   8'd107   ,  6'd30 };
13'd512   : q  = {   8'd125   ,  6'd33 };
13'd513   : q  = {   8'd142   ,  6'd9  };
13'd514   : q  = {   8'd142   ,  6'd10 };
13'd515   : q  = {   8'd108   ,  6'd17 };
13'd516   : q  = {   8'd6     ,  6'd35 };
13'd517   : q  = {   8'd127   ,  6'd33 };
13'd518   : q  = {   8'd99    ,  6'd22 };
13'd519   : q  = {   8'd122   ,  6'd31 };
13'd520   : q  = {   8'd74    ,  6'd29 };
13'd521   : q  = {   8'd142   ,  6'd17 };
13'd522   : q  = {   8'd142   ,  6'd18 };
13'd523   : q  = {   8'd13    ,  6'd33 };
13'd524   : q  = {   8'd142   ,  6'd20 };
13'd525   : q  = {   8'd11    ,  6'd29 };
13'd526   : q  = {   8'd44    ,  6'd6  };
13'd527   : q  = {   8'd142   ,  6'd23 };
13'd528   : q  = {   8'd77    ,  6'd23 };
13'd529   : q  = {   8'd142   ,  6'd25 };
13'd530   : q  = {   8'd96    ,  6'd29 };
13'd531   : q  = {   8'd142   ,  6'd27 };
13'd532   : q  = {   8'd85    ,  6'd35 };
13'd533   : q  = {   8'd142   ,  6'd29 };
13'd534   : q  = {   8'd142   ,  6'd30 };
13'd535   : q  = {   8'd1     ,  6'd14 };
13'd536   : q  = {   8'd100   ,  6'd6  };
13'd537   : q  = {   8'd142   ,  6'd33 };
13'd538   : q  = {   8'd142   ,  6'd34 };
13'd539   : q  = {   8'd107   ,  6'd25 };
13'd540   : q  = {   8'd98    ,  6'd2  };
13'd541   : q  = {   8'd123   ,  6'd1  };
13'd542   : q  = {   8'd16    ,  6'd1  };
13'd543   : q  = {   8'd143   ,  6'd3  };
13'd544   : q  = {   8'd30    ,  6'd29 };
13'd545   : q  = {   8'd143   ,  6'd5  };
13'd546   : q  = {   8'd104   ,  6'd10 };
13'd547   : q  = {   8'd143   ,  6'd7  };
13'd548   : q  = {   8'd143   ,  6'd8  };
13'd549   : q  = {   8'd143   ,  6'd9  };
13'd550   : q  = {   8'd143   ,  6'd10 };
13'd551   : q  = {   8'd16    ,  6'd2  };
13'd552   : q  = {   8'd16    ,  6'd3  };
13'd553   : q  = {   8'd143   ,  6'd13 };
13'd554   : q  = {   8'd92    ,  6'd10 };
13'd555   : q  = {   8'd143   ,  6'd15 };
13'd556   : q  = {   8'd109   ,  6'd8  };
13'd557   : q  = {   8'd143   ,  6'd17 };
13'd558   : q  = {   8'd143   ,  6'd18 };
13'd559   : q  = {   8'd108   ,  6'd21 };
13'd560   : q  = {   8'd143   ,  6'd20 };
13'd561   : q  = {   8'd143   ,  6'd21 };
13'd562   : q  = {   8'd44    ,  6'd14 };
13'd563   : q  = {   8'd143   ,  6'd23 };
13'd564   : q  = {   8'd143   ,  6'd24 };
13'd565   : q  = {   8'd143   ,  6'd25 };
13'd566   : q  = {   8'd44    ,  6'd15 };
13'd567   : q  = {   8'd143   ,  6'd27 };
13'd568   : q  = {   8'd86    ,  6'd0  };
13'd569   : q  = {   8'd143   ,  6'd29 };
13'd570   : q  = {   8'd120   ,  6'd29 };
13'd571   : q  = {   8'd16    ,  6'd4  };
13'd572   : q  = {   8'd125   ,  6'd18 };
13'd573   : q  = {   8'd143   ,  6'd33 };
13'd574   : q  = {   8'd44    ,  6'd17 };
13'd575   : q  = {   8'd44    ,  6'd18 };
13'd576   : q  = {   8'd95    ,  6'd24 };
13'd577   : q  = {   8'd144   ,  6'd1  };
13'd578   : q  = {   8'd44    ,  6'd19 };
13'd579   : q  = {   8'd144   ,  6'd3  };
13'd580   : q  = {   8'd103   ,  6'd17 };
13'd581   : q  = {   8'd144   ,  6'd5  };
13'd582   : q  = {   8'd144   ,  6'd6  };
13'd583   : q  = {   8'd106   ,  6'd22 };
13'd584   : q  = {   8'd144   ,  6'd8  };
13'd585   : q  = {   8'd108   ,  6'd6  };
13'd586   : q  = {   8'd144   ,  6'd10 };
13'd587   : q  = {   8'd92    ,  6'd11 };
13'd588   : q  = {   8'd93    ,  6'd14 };
13'd589   : q  = {   8'd144   ,  6'd13 };
13'd590   : q  = {   8'd144   ,  6'd14 };
13'd591   : q  = {   8'd144   ,  6'd15 };
13'd592   : q  = {   8'd99    ,  6'd23 };
13'd593   : q  = {   8'd144   ,  6'd17 };
13'd594   : q  = {   8'd144   ,  6'd18 };
13'd595   : q  = {   8'd110   ,  6'd12 };
13'd596   : q  = {   8'd144   ,  6'd20 };
13'd597   : q  = {   8'd144   ,  6'd21 };
13'd598   : q  = {   8'd108   ,  6'd18 };
13'd599   : q  = {   8'd144   ,  6'd23 };
13'd600   : q  = {   8'd144   ,  6'd24 };
13'd601   : q  = {   8'd144   ,  6'd25 };
13'd602   : q  = {   8'd44    ,  6'd24 };
13'd603   : q  = {   8'd44    ,  6'd25 };
13'd604   : q  = {   8'd144   ,  6'd28 };
13'd605   : q  = {   8'd144   ,  6'd29 };
13'd606   : q  = {   8'd144   ,  6'd30 };
13'd607   : q  = {   8'd44    ,  6'd26 };
13'd608   : q  = {   8'd144   ,  6'd32 };
13'd609   : q  = {   8'd144   ,  6'd33 };
13'd610   : q  = {   8'd16    ,  6'd6  };
13'd611   : q  = {   8'd126   ,  6'd35 };
13'd612   : q  = {   8'd73    ,  6'd31 };
13'd613   : q  = {   8'd44    ,  6'd29 };
13'd614   : q  = {   8'd44    ,  6'd30 };
13'd615   : q  = {   8'd145   ,  6'd3  };
13'd616   : q  = {   8'd145   ,  6'd4  };
13'd617   : q  = {   8'd145   ,  6'd5  };
13'd618   : q  = {   8'd44    ,  6'd31 };
13'd619   : q  = {   8'd145   ,  6'd7  };
13'd620   : q  = {   8'd145   ,  6'd8  };
13'd621   : q  = {   8'd145   ,  6'd9  };
13'd622   : q  = {   8'd145   ,  6'd10 };
13'd623   : q  = {   8'd44    ,  6'd32 };
13'd624   : q  = {   8'd1     ,  6'd30 };
13'd625   : q  = {   8'd145   ,  6'd13 };
13'd626   : q  = {   8'd28    ,  6'd3  };
13'd627   : q  = {   8'd145   ,  6'd15 };
13'd628   : q  = {   8'd111   ,  6'd29 };
13'd629   : q  = {   8'd111   ,  6'd21 };
13'd630   : q  = {   8'd145   ,  6'd18 };
13'd631   : q  = {   8'd145   ,  6'd19 };
13'd632   : q  = {   8'd103   ,  6'd18 };
13'd633   : q  = {   8'd16    ,  6'd8  };
13'd634   : q  = {   8'd16    ,  6'd9  };
13'd635   : q  = {   8'd45    ,  6'd0  };
13'd636   : q  = {   8'd145   ,  6'd24 };
13'd637   : q  = {   8'd145   ,  6'd25 };
13'd638   : q  = {   8'd3     ,  6'd23 };
13'd639   : q  = {   8'd145   ,  6'd27 };
13'd640   : q  = {   8'd30    ,  6'd30 };
13'd641   : q  = {   8'd145   ,  6'd29 };
13'd642   : q  = {   8'd36    ,  6'd7  };
13'd643   : q  = {   8'd16    ,  6'd11 };
13'd644   : q  = {   8'd145   ,  6'd32 };
13'd645   : q  = {   8'd145   ,  6'd33 };
13'd646   : q  = {   8'd37    ,  6'd34 };
13'd647   : q  = {   8'd73    ,  6'd26 };
13'd648   : q  = {   8'd146   ,  6'd0  };
13'd649   : q  = {   8'd45    ,  6'd5  };
13'd650   : q  = {   8'd120   ,  6'd5  };
13'd651   : q  = {   8'd146   ,  6'd3  };
13'd652   : q  = {   8'd146   ,  6'd4  };
13'd653   : q  = {   8'd146   ,  6'd5  };
13'd654   : q  = {   8'd45    ,  6'd6  };
13'd655   : q  = {   8'd146   ,  6'd7  };
13'd656   : q  = {   8'd146   ,  6'd8  };
13'd657   : q  = {   8'd120   ,  6'd8  };
13'd658   : q  = {   8'd7     ,  6'd3  };
13'd659   : q  = {   8'd45    ,  6'd8  };
13'd660   : q  = {   8'd36    ,  6'd6  };
13'd661   : q  = {   8'd146   ,  6'd13 };
13'd662   : q  = {   8'd100   ,  6'd31 };
13'd663   : q  = {   8'd146   ,  6'd15 };
13'd664   : q  = {   8'd1     ,  6'd25 };
13'd665   : q  = {   8'd45    ,  6'd10 };
13'd666   : q  = {   8'd146   ,  6'd18 };
13'd667   : q  = {   8'd146   ,  6'd19 };
13'd668   : q  = {   8'd146   ,  6'd20 };
13'd669   : q  = {   8'd16    ,  6'd15 };
13'd670   : q  = {   8'd28    ,  6'd28 };
13'd671   : q  = {   8'd146   ,  6'd23 };
13'd672   : q  = {   8'd146   ,  6'd24 };
13'd673   : q  = {   8'd33    ,  6'd25 };
13'd674   : q  = {   8'd90    ,  6'd19 };
13'd675   : q  = {   8'd146   ,  6'd27 };
13'd676   : q  = {   8'd32    ,  6'd8  };
13'd677   : q  = {   8'd45    ,  6'd13 };
13'd678   : q  = {   8'd31    ,  6'd18 };
13'd679   : q  = {   8'd45    ,  6'd14 };
13'd680   : q  = {   8'd146   ,  6'd32 };
13'd681   : q  = {   8'd146   ,  6'd33 };
13'd682   : q  = {   8'd14    ,  6'd5  };
13'd683   : q  = {   8'd16    ,  6'd17 };
13'd684   : q  = {   8'd84    ,  6'd3  };
13'd685   : q  = {   8'd147   ,  6'd1  };
13'd686   : q  = {   8'd45    ,  6'd17 };
13'd687   : q  = {   8'd147   ,  6'd3  };
13'd688   : q  = {   8'd147   ,  6'd4  };
13'd689   : q  = {   8'd147   ,  6'd5  };
13'd690   : q  = {   8'd99    ,  6'd18 };
13'd691   : q  = {   8'd147   ,  6'd7  };
13'd692   : q  = {   8'd147   ,  6'd8  };
13'd693   : q  = {   8'd147   ,  6'd9  };
13'd694   : q  = {   8'd147   ,  6'd10 };
13'd695   : q  = {   8'd45    ,  6'd18 };
13'd696   : q  = {   8'd45    ,  6'd19 };
13'd697   : q  = {   8'd147   ,  6'd13 };
13'd698   : q  = {   8'd147   ,  6'd14 };
13'd699   : q  = {   8'd147   ,  6'd15 };
13'd700   : q  = {   8'd147   ,  6'd16 };
13'd701   : q  = {   8'd74    ,  6'd31 };
13'd702   : q  = {   8'd147   ,  6'd18 };
13'd703   : q  = {   8'd147   ,  6'd19 };
13'd704   : q  = {   8'd147   ,  6'd20 };
13'd705   : q  = {   8'd147   ,  6'd21 };
13'd706   : q  = {   8'd45    ,  6'd20 };
13'd707   : q  = {   8'd45    ,  6'd21 };
13'd708   : q  = {   8'd81    ,  6'd23 };
13'd709   : q  = {   8'd147   ,  6'd25 };
13'd710   : q  = {   8'd16    ,  6'd18 };
13'd711   : q  = {   8'd5     ,  6'd21 };
13'd712   : q  = {   8'd147   ,  6'd28 };
13'd713   : q  = {   8'd115   ,  6'd18 };
13'd714   : q  = {   8'd147   ,  6'd30 };
13'd715   : q  = {   8'd45    ,  6'd24 };
13'd716   : q  = {   8'd74    ,  6'd32 };
13'd717   : q  = {   8'd147   ,  6'd33 };
13'd718   : q  = {   8'd45    ,  6'd25 };
13'd719   : q  = {   8'd45    ,  6'd26 };
13'd720   : q  = {   8'd148   ,  6'd0  };
13'd721   : q  = {   8'd7     ,  6'd4  };
13'd722   : q  = {   8'd26    ,  6'd27 };
13'd723   : q  = {   8'd148   ,  6'd3  };
13'd724   : q  = {   8'd108   ,  6'd24 };
13'd725   : q  = {   8'd106   ,  6'd31 };
13'd726   : q  = {   8'd45    ,  6'd29 };
13'd727   : q  = {   8'd124   ,  6'd23 };
13'd728   : q  = {   8'd148   ,  6'd8  };
13'd729   : q  = {   8'd148   ,  6'd9  };
13'd730   : q  = {   8'd45    ,  6'd30 };
13'd731   : q  = {   8'd45    ,  6'd31 };
13'd732   : q  = {   8'd148   ,  6'd12 };
13'd733   : q  = {   8'd148   ,  6'd13 };
13'd734   : q  = {   8'd45    ,  6'd32 };
13'd735   : q  = {   8'd148   ,  6'd15 };
13'd736   : q  = {   8'd111   ,  6'd7  };
13'd737   : q  = {   8'd7     ,  6'd5  };
13'd738   : q  = {   8'd27    ,  6'd9  };
13'd739   : q  = {   8'd45    ,  6'd34 };
13'd740   : q  = {   8'd148   ,  6'd20 };
13'd741   : q  = {   8'd108   ,  6'd25 };
13'd742   : q  = {   8'd46    ,  6'd0  };
13'd743   : q  = {   8'd16    ,  6'd22 };
13'd744   : q  = {   8'd16    ,  6'd23 };
13'd745   : q  = {   8'd148   ,  6'd25 };
13'd746   : q  = {   8'd2     ,  6'd8  };
13'd747   : q  = {   8'd148   ,  6'd27 };
13'd748   : q  = {   8'd122   ,  6'd21 };
13'd749   : q  = {   8'd148   ,  6'd29 };
13'd750   : q  = {   8'd148   ,  6'd30 };
13'd751   : q  = {   8'd46    ,  6'd4  };
13'd752   : q  = {   8'd148   ,  6'd32 };
13'd753   : q  = {   8'd38    ,  6'd28 };
13'd754   : q  = {   8'd46    ,  6'd5  };
13'd755   : q  = {   8'd46    ,  6'd6  };
13'd756   : q  = {   8'd149   ,  6'd0  };
13'd757   : q  = {   8'd38    ,  6'd30 };
13'd758   : q  = {   8'd79    ,  6'd18 };
13'd759   : q  = {   8'd35    ,  6'd4  };
13'd760   : q  = {   8'd149   ,  6'd4  };
13'd761   : q  = {   8'd5     ,  6'd1  };
13'd762   : q  = {   8'd16    ,  6'd25 };
13'd763   : q  = {   8'd124   ,  6'd30 };
13'd764   : q  = {   8'd149   ,  6'd8  };
13'd765   : q  = {   8'd149   ,  6'd9  };
13'd766   : q  = {   8'd120   ,  6'd2  };
13'd767   : q  = {   8'd126   ,  6'd3  };
13'd768   : q  = {   8'd149   ,  6'd12 };
13'd769   : q  = {   8'd149   ,  6'd13 };
13'd770   : q  = {   8'd46    ,  6'd10 };
13'd771   : q  = {   8'd16    ,  6'd27 };
13'd772   : q  = {   8'd106   ,  6'd4  };
13'd773   : q  = {   8'd3     ,  6'd25 };
13'd774   : q  = {   8'd149   ,  6'd18 };
13'd775   : q  = {   8'd149   ,  6'd19 };
13'd776   : q  = {   8'd149   ,  6'd20 };
13'd777   : q  = {   8'd127   ,  6'd27 };
13'd778   : q  = {   8'd46    ,  6'd14 };
13'd779   : q  = {   8'd121   ,  6'd23 };
13'd780   : q  = {   8'd149   ,  6'd24 };
13'd781   : q  = {   8'd149   ,  6'd25 };
13'd782   : q  = {   8'd16    ,  6'd29 };
13'd783   : q  = {   8'd149   ,  6'd27 };
13'd784   : q  = {   8'd149   ,  6'd28 };
13'd785   : q  = {   8'd149   ,  6'd29 };
13'd786   : q  = {   8'd149   ,  6'd30 };
13'd787   : q  = {   8'd107   ,  6'd17 };
13'd788   : q  = {   8'd149   ,  6'd32 };
13'd789   : q  = {   8'd149   ,  6'd33 };
13'd790   : q  = {   8'd31    ,  6'd28 };
13'd791   : q  = {   8'd46    ,  6'd18 };
13'd792   : q  = {   8'd46    ,  6'd19 };
13'd793   : q  = {   8'd150   ,  6'd1  };
13'd794   : q  = {   8'd112   ,  6'd5  };
13'd795   : q  = {   8'd110   ,  6'd18 };
13'd796   : q  = {   8'd150   ,  6'd4  };
13'd797   : q  = {   8'd102   ,  6'd3  };
13'd798   : q  = {   8'd127   ,  6'd28 };
13'd799   : q  = {   8'd150   ,  6'd7  };
13'd800   : q  = {   8'd46    ,  6'd21 };
13'd801   : q  = {   8'd150   ,  6'd9  };
13'd802   : q  = {   8'd150   ,  6'd10 };
13'd803   : q  = {   8'd32    ,  6'd29 };
13'd804   : q  = {   8'd150   ,  6'd12 };
13'd805   : q  = {   8'd90    ,  6'd20 };
13'd806   : q  = {   8'd101   ,  6'd18 };
13'd807   : q  = {   8'd150   ,  6'd15 };
13'd808   : q  = {   8'd150   ,  6'd16 };
13'd809   : q  = {   8'd150   ,  6'd17 };
13'd810   : q  = {   8'd150   ,  6'd18 };
13'd811   : q  = {   8'd150   ,  6'd19 };
13'd812   : q  = {   8'd46    ,  6'd24 };
13'd813   : q  = {   8'd46    ,  6'd25 };
13'd814   : q  = {   8'd46    ,  6'd26 };
13'd815   : q  = {   8'd127   ,  6'd3  };
13'd816   : q  = {   8'd150   ,  6'd24 };
13'd817   : q  = {   8'd150   ,  6'd25 };
13'd818   : q  = {   8'd46    ,  6'd28 };
13'd819   : q  = {   8'd46    ,  6'd29 };
13'd820   : q  = {   8'd150   ,  6'd28 };
13'd821   : q  = {   8'd150   ,  6'd29 };
13'd822   : q  = {   8'd30    ,  6'd0  };
13'd823   : q  = {   8'd46    ,  6'd30 };
13'd824   : q  = {   8'd46    ,  6'd31 };
13'd825   : q  = {   8'd150   ,  6'd33 };
13'd826   : q  = {   8'd34    ,  6'd15 };
13'd827   : q  = {   8'd46    ,  6'd32 };
13'd828   : q  = {   8'd0     ,  6'd7  };
13'd829   : q  = {   8'd151   ,  6'd1  };
13'd830   : q  = {   8'd26    ,  6'd28 };
13'd831   : q  = {   8'd151   ,  6'd3  };
13'd832   : q  = {   8'd37    ,  6'd9  };
13'd833   : q  = {   8'd69    ,  6'd11 };
13'd834   : q  = {   8'd95    ,  6'd28 };
13'd835   : q  = {   8'd86    ,  6'd3  };
13'd836   : q  = {   8'd86    ,  6'd4  };
13'd837   : q  = {   8'd151   ,  6'd9  };
13'd838   : q  = {   8'd16    ,  6'd32 };
13'd839   : q  = {   8'd47    ,  6'd0  };
13'd840   : q  = {   8'd151   ,  6'd12 };
13'd841   : q  = {   8'd69    ,  6'd12 };
13'd842   : q  = {   8'd74    ,  6'd33 };
13'd843   : q  = {   8'd151   ,  6'd15 };
13'd844   : q  = {   8'd151   ,  6'd16 };
13'd845   : q  = {   8'd16    ,  6'd33 };
13'd846   : q  = {   8'd151   ,  6'd18 };
13'd847   : q  = {   8'd151   ,  6'd19 };
13'd848   : q  = {   8'd47    ,  6'd2  };
13'd849   : q  = {   8'd47    ,  6'd3  };
13'd850   : q  = {   8'd35    ,  6'd20 };
13'd851   : q  = {   8'd151   ,  6'd23 };
13'd852   : q  = {   8'd47    ,  6'd5  };
13'd853   : q  = {   8'd151   ,  6'd25 };
13'd854   : q  = {   8'd47    ,  6'd6  };
13'd855   : q  = {   8'd151   ,  6'd27 };
13'd856   : q  = {   8'd151   ,  6'd28 };
13'd857   : q  = {   8'd89    ,  6'd22 };
13'd858   : q  = {   8'd151   ,  6'd30 };
13'd859   : q  = {   8'd74    ,  6'd34 };
13'd860   : q  = {   8'd151   ,  6'd32 };
13'd861   : q  = {   8'd151   ,  6'd33 };
13'd862   : q  = {   8'd47    ,  6'd8  };
13'd863   : q  = {   8'd16    ,  6'd35 };
13'd864   : q  = {   8'd3     ,  6'd27 };
13'd865   : q  = {   8'd152   ,  6'd1  };
13'd866   : q  = {   8'd26    ,  6'd12 };
13'd867   : q  = {   8'd152   ,  6'd3  };
13'd868   : q  = {   8'd152   ,  6'd4  };
13'd869   : q  = {   8'd10    ,  6'd27 };
13'd870   : q  = {   8'd152   ,  6'd6  };
13'd871   : q  = {   8'd152   ,  6'd7  };
13'd872   : q  = {   8'd152   ,  6'd8  };
13'd873   : q  = {   8'd77    ,  6'd35 };
13'd874   : q  = {   8'd47    ,  6'd11 };
13'd875   : q  = {   8'd17    ,  6'd1  };
13'd876   : q  = {   8'd109   ,  6'd12 };
13'd877   : q  = {   8'd152   ,  6'd13 };
13'd878   : q  = {   8'd152   ,  6'd14 };
13'd879   : q  = {   8'd110   ,  6'd33 };
13'd880   : q  = {   8'd113   ,  6'd19 };
13'd881   : q  = {   8'd124   ,  6'd27 };
13'd882   : q  = {   8'd152   ,  6'd18 };
13'd883   : q  = {   8'd152   ,  6'd19 };
13'd884   : q  = {   8'd47    ,  6'd14 };
13'd885   : q  = {   8'd47    ,  6'd15 };
13'd886   : q  = {   8'd123   ,  6'd26 };
13'd887   : q  = {   8'd152   ,  6'd23 };
13'd888   : q  = {   8'd152   ,  6'd24 };
13'd889   : q  = {   8'd152   ,  6'd25 };
13'd890   : q  = {   8'd47    ,  6'd17 };
13'd891   : q  = {   8'd152   ,  6'd27 };
13'd892   : q  = {   8'd92    ,  6'd0  };
13'd893   : q  = {   8'd152   ,  6'd29 };
13'd894   : q  = {   8'd152   ,  6'd30 };
13'd895   : q  = {   8'd47    ,  6'd18 };
13'd896   : q  = {   8'd152   ,  6'd32 };
13'd897   : q  = {   8'd152   ,  6'd33 };
13'd898   : q  = {   8'd123   ,  6'd17 };
13'd899   : q  = {   8'd47    ,  6'd19 };
13'd900   : q  = {   8'd104   ,  6'd11 };
13'd901   : q  = {   8'd153   ,  6'd1  };
13'd902   : q  = {   8'd78    ,  6'd12 };
13'd903   : q  = {   8'd153   ,  6'd3  };
13'd904   : q  = {   8'd81    ,  6'd26 };
13'd905   : q  = {   8'd47    ,  6'd21 };
13'd906   : q  = {   8'd153   ,  6'd6  };
13'd907   : q  = {   8'd153   ,  6'd7  };
13'd908   : q  = {   8'd105   ,  6'd33 };
13'd909   : q  = {   8'd153   ,  6'd9  };
13'd910   : q  = {   8'd39    ,  6'd26 };
13'd911   : q  = {   8'd47    ,  6'd23 };
13'd912   : q  = {   8'd153   ,  6'd12 };
13'd913   : q  = {   8'd153   ,  6'd13 };
13'd914   : q  = {   8'd153   ,  6'd14 };
13'd915   : q  = {   8'd153   ,  6'd15 };
13'd916   : q  = {   8'd153   ,  6'd16 };
13'd917   : q  = {   8'd47    ,  6'd24 };
13'd918   : q  = {   8'd153   ,  6'd18 };
13'd919   : q  = {   8'd153   ,  6'd19 };
13'd920   : q  = {   8'd29    ,  6'd31 };
13'd921   : q  = {   8'd81    ,  6'd27 };
13'd922   : q  = {   8'd47    ,  6'd27 };
13'd923   : q  = {   8'd47    ,  6'd28 };
13'd924   : q  = {   8'd153   ,  6'd24 };
13'd925   : q  = {   8'd153   ,  6'd25 };
13'd926   : q  = {   8'd93    ,  6'd17 };
13'd927   : q  = {   8'd153   ,  6'd27 };
13'd928   : q  = {   8'd123   ,  6'd31 };
13'd929   : q  = {   8'd153   ,  6'd29 };
13'd930   : q  = {   8'd153   ,  6'd30 };
13'd931   : q  = {   8'd73    ,  6'd18 };
13'd932   : q  = {   8'd47    ,  6'd30 };
13'd933   : q  = {   8'd153   ,  6'd33 };
13'd934   : q  = {   8'd153   ,  6'd34 };
13'd935   : q  = {   8'd68    ,  6'd25 };
13'd936   : q  = {   8'd47    ,  6'd32 };
13'd937   : q  = {   8'd154   ,  6'd1  };
13'd938   : q  = {   8'd67    ,  6'd18 };
13'd939   : q  = {   8'd154   ,  6'd3  };
13'd940   : q  = {   8'd67    ,  6'd11 };
13'd941   : q  = {   8'd154   ,  6'd5  };
13'd942   : q  = {   8'd154   ,  6'd6  };
13'd943   : q  = {   8'd89    ,  6'd25 };
13'd944   : q  = {   8'd154   ,  6'd8  };
13'd945   : q  = {   8'd154   ,  6'd9  };
13'd946   : q  = {   8'd100   ,  6'd23 };
13'd947   : q  = {   8'd17    ,  6'd4  };
13'd948   : q  = {   8'd154   ,  6'd12 };
13'd949   : q  = {   8'd154   ,  6'd13 };
13'd950   : q  = {   8'd154   ,  6'd14 };
13'd951   : q  = {   8'd154   ,  6'd15 };
13'd952   : q  = {   8'd154   ,  6'd16 };
13'd953   : q  = {   8'd48    ,  6'd0  };
13'd954   : q  = {   8'd154   ,  6'd18 };
13'd955   : q  = {   8'd154   ,  6'd19 };
13'd956   : q  = {   8'd17    ,  6'd5  };
13'd957   : q  = {   8'd48    ,  6'd2  };
13'd958   : q  = {   8'd154   ,  6'd22 };
13'd959   : q  = {   8'd154   ,  6'd23 };
13'd960   : q  = {   8'd154   ,  6'd24 };
13'd961   : q  = {   8'd154   ,  6'd25 };
13'd962   : q  = {   8'd86    ,  6'd6  };
13'd963   : q  = {   8'd154   ,  6'd27 };
13'd964   : q  = {   8'd126   ,  6'd32 };
13'd965   : q  = {   8'd110   ,  6'd1  };
13'd966   : q  = {   8'd154   ,  6'd30 };
13'd967   : q  = {   8'd48    ,  6'd3  };
13'd968   : q  = {   8'd37    ,  6'd30 };
13'd969   : q  = {   8'd154   ,  6'd33 };
13'd970   : q  = {   8'd154   ,  6'd34 };
13'd971   : q  = {   8'd154   ,  6'd35 };
13'd972   : q  = {   8'd48    ,  6'd4  };
13'd973   : q  = {   8'd155   ,  6'd1  };
13'd974   : q  = {   8'd124   ,  6'd14 };
13'd975   : q  = {   8'd155   ,  6'd3  };
13'd976   : q  = {   8'd9     ,  6'd24 };
13'd977   : q  = {   8'd155   ,  6'd5  };
13'd978   : q  = {   8'd86    ,  6'd7  };
13'd979   : q  = {   8'd48    ,  6'd6  };
13'd980   : q  = {   8'd155   ,  6'd8  };
13'd981   : q  = {   8'd155   ,  6'd9  };
13'd982   : q  = {   8'd155   ,  6'd10 };
13'd983   : q  = {   8'd110   ,  6'd4  };
13'd984   : q  = {   8'd155   ,  6'd12 };
13'd985   : q  = {   8'd155   ,  6'd13 };
13'd986   : q  = {   8'd155   ,  6'd14 };
13'd987   : q  = {   8'd155   ,  6'd15 };
13'd988   : q  = {   8'd155   ,  6'd16 };
13'd989   : q  = {   8'd80    ,  6'd32 };
13'd990   : q  = {   8'd155   ,  6'd18 };
13'd991   : q  = {   8'd155   ,  6'd19 };
13'd992   : q  = {   8'd35    ,  6'd15 };
13'd993   : q  = {   8'd39    ,  6'd32 };
13'd994   : q  = {   8'd155   ,  6'd22 };
13'd995   : q  = {   8'd74    ,  6'd35 };
13'd996   : q  = {   8'd155   ,  6'd24 };
13'd997   : q  = {   8'd155   ,  6'd25 };
13'd998   : q  = {   8'd155   ,  6'd26 };
13'd999   : q  = {   8'd155   ,  6'd27 };
13'd1000  : q  = {   8'd109   ,  6'd10 };
13'd1001  : q  = {   8'd155   ,  6'd29 };
13'd1002  : q  = {   8'd155   ,  6'd30 };
13'd1003  : q  = {   8'd155   ,  6'd31 };
13'd1004  : q  = {   8'd155   ,  6'd32 };
13'd1005  : q  = {   8'd155   ,  6'd33 };
13'd1006  : q  = {   8'd155   ,  6'd34 };
13'd1007  : q  = {   8'd3     ,  6'd28 };
13'd1008  : q  = {   8'd17    ,  6'd8  };
13'd1009  : q  = {   8'd156   ,  6'd1  };
13'd1010  : q  = {   8'd48    ,  6'd11 };
13'd1011  : q  = {   8'd156   ,  6'd3  };
13'd1012  : q  = {   8'd156   ,  6'd4  };
13'd1013  : q  = {   8'd156   ,  6'd5  };
13'd1014  : q  = {   8'd156   ,  6'd6  };
13'd1015  : q  = {   8'd40    ,  6'd10 };
13'd1016  : q  = {   8'd156   ,  6'd8  };
13'd1017  : q  = {   8'd156   ,  6'd9  };
13'd1018  : q  = {   8'd156   ,  6'd10 };
13'd1019  : q  = {   8'd48    ,  6'd13 };
13'd1020  : q  = {   8'd156   ,  6'd12 };
13'd1021  : q  = {   8'd156   ,  6'd13 };
13'd1022  : q  = {   8'd156   ,  6'd14 };
13'd1023  : q  = {   8'd156   ,  6'd15 };
13'd1024  : q  = {   8'd156   ,  6'd16 };
13'd1025  : q  = {   8'd156   ,  6'd17 };
13'd1026  : q  = {   8'd156   ,  6'd18 };
13'd1027  : q  = {   8'd156   ,  6'd19 };
13'd1028  : q  = {   8'd48    ,  6'd14 };
13'd1029  : q  = {   8'd73    ,  6'd34 };
13'd1030  : q  = {   8'd107   ,  6'd18 };
13'd1031  : q  = {   8'd156   ,  6'd23 };
13'd1032  : q  = {   8'd95    ,  6'd30 };
13'd1033  : q  = {   8'd156   ,  6'd25 };
13'd1034  : q  = {   8'd48    ,  6'd17 };
13'd1035  : q  = {   8'd156   ,  6'd27 };
13'd1036  : q  = {   8'd156   ,  6'd28 };
13'd1037  : q  = {   8'd5     ,  6'd32 };
13'd1038  : q  = {   8'd156   ,  6'd30 };
13'd1039  : q  = {   8'd48    ,  6'd18 };
13'd1040  : q  = {   8'd125   ,  6'd26 };
13'd1041  : q  = {   8'd156   ,  6'd33 };
13'd1042  : q  = {   8'd156   ,  6'd34 };
13'd1043  : q  = {   8'd48    ,  6'd19 };
13'd1044  : q  = {   8'd48    ,  6'd20 };
13'd1045  : q  = {   8'd157   ,  6'd1  };
13'd1046  : q  = {   8'd48    ,  6'd21 };
13'd1047  : q  = {   8'd157   ,  6'd3  };
13'd1048  : q  = {   8'd97    ,  6'd22 };
13'd1049  : q  = {   8'd157   ,  6'd5  };
13'd1050  : q  = {   8'd157   ,  6'd6  };
13'd1051  : q  = {   8'd48    ,  6'd23 };
13'd1052  : q  = {   8'd157   ,  6'd8  };
13'd1053  : q  = {   8'd157   ,  6'd9  };
13'd1054  : q  = {   8'd157   ,  6'd10 };
13'd1055  : q  = {   8'd10    ,  6'd2  };
13'd1056  : q  = {   8'd157   ,  6'd12 };
13'd1057  : q  = {   8'd157   ,  6'd13 };
13'd1058  : q  = {   8'd157   ,  6'd14 };
13'd1059  : q  = {   8'd157   ,  6'd15 };
13'd1060  : q  = {   8'd73    ,  6'd7  };
13'd1061  : q  = {   8'd157   ,  6'd17 };
13'd1062  : q  = {   8'd157   ,  6'd18 };
13'd1063  : q  = {   8'd157   ,  6'd19 };
13'd1064  : q  = {   8'd48    ,  6'd25 };
13'd1065  : q  = {   8'd48    ,  6'd26 };
13'd1066  : q  = {   8'd48    ,  6'd27 };
13'd1067  : q  = {   8'd157   ,  6'd23 };
13'd1068  : q  = {   8'd83    ,  6'd32 };
13'd1069  : q  = {   8'd157   ,  6'd25 };
13'd1070  : q  = {   8'd30    ,  6'd31 };
13'd1071  : q  = {   8'd157   ,  6'd27 };
13'd1072  : q  = {   8'd157   ,  6'd28 };
13'd1073  : q  = {   8'd95    ,  6'd31 };
13'd1074  : q  = {   8'd157   ,  6'd30 };
13'd1075  : q  = {   8'd48    ,  6'd29 };
13'd1076  : q  = {   8'd157   ,  6'd32 };
13'd1077  : q  = {   8'd157   ,  6'd33 };
13'd1078  : q  = {   8'd157   ,  6'd34 };
13'd1079  : q  = {   8'd48    ,  6'd30 };
13'd1080  : q  = {   8'd158   ,  6'd0  };
13'd1081  : q  = {   8'd126   ,  6'd12 };
13'd1082  : q  = {   8'd48    ,  6'd31 };
13'd1083  : q  = {   8'd158   ,  6'd3  };
13'd1084  : q  = {   8'd99    ,  6'd24 };
13'd1085  : q  = {   8'd103   ,  6'd6  };
13'd1086  : q  = {   8'd115   ,  6'd1  };
13'd1087  : q  = {   8'd158   ,  6'd7  };
13'd1088  : q  = {   8'd89    ,  6'd30 };
13'd1089  : q  = {   8'd75    ,  6'd1  };
13'd1090  : q  = {   8'd124   ,  6'd18 };
13'd1091  : q  = {   8'd38    ,  6'd15 };
13'd1092  : q  = {   8'd158   ,  6'd12 };
13'd1093  : q  = {   8'd158   ,  6'd13 };
13'd1094  : q  = {   8'd158   ,  6'd14 };
13'd1095  : q  = {   8'd39    ,  6'd13 };
13'd1096  : q  = {   8'd5     ,  6'd25 };
13'd1097  : q  = {   8'd158   ,  6'd17 };
13'd1098  : q  = {   8'd158   ,  6'd18 };
13'd1099  : q  = {   8'd158   ,  6'd19 };
13'd1100  : q  = {   8'd158   ,  6'd20 };
13'd1101  : q  = {   8'd28    ,  6'd30 };
13'd1102  : q  = {   8'd111   ,  6'd34 };
13'd1103  : q  = {   8'd31    ,  6'd29 };
13'd1104  : q  = {   8'd158   ,  6'd24 };
13'd1105  : q  = {   8'd158   ,  6'd25 };
13'd1106  : q  = {   8'd126   ,  6'd31 };
13'd1107  : q  = {   8'd117   ,  6'd3  };
13'd1108  : q  = {   8'd158   ,  6'd28 };
13'd1109  : q  = {   8'd158   ,  6'd29 };
13'd1110  : q  = {   8'd158   ,  6'd30 };
13'd1111  : q  = {   8'd158   ,  6'd31 };
13'd1112  : q  = {   8'd158   ,  6'd32 };
13'd1113  : q  = {   8'd158   ,  6'd33 };
13'd1114  : q  = {   8'd77    ,  6'd30 };
13'd1115  : q  = {   8'd33    ,  6'd14 };
13'd1116  : q  = {   8'd159   ,  6'd0  };
13'd1117  : q  = {   8'd127   ,  6'd30 };
13'd1118  : q  = {   8'd84    ,  6'd14 };
13'd1119  : q  = {   8'd73    ,  6'd35 };
13'd1120  : q  = {   8'd159   ,  6'd4  };
13'd1121  : q  = {   8'd126   ,  6'd18 };
13'd1122  : q  = {   8'd32    ,  6'd9  };
13'd1123  : q  = {   8'd81    ,  6'd31 };
13'd1124  : q  = {   8'd159   ,  6'd8  };
13'd1125  : q  = {   8'd111   ,  6'd8  };
13'd1126  : q  = {   8'd159   ,  6'd10 };
13'd1127  : q  = {   8'd49    ,  6'd5  };
13'd1128  : q  = {   8'd89    ,  6'd28 };
13'd1129  : q  = {   8'd159   ,  6'd13 };
13'd1130  : q  = {   8'd159   ,  6'd14 };
13'd1131  : q  = {   8'd159   ,  6'd15 };
13'd1132  : q  = {   8'd159   ,  6'd16 };
13'd1133  : q  = {   8'd40    ,  6'd4  };
13'd1134  : q  = {   8'd159   ,  6'd18 };
13'd1135  : q  = {   8'd159   ,  6'd19 };
13'd1136  : q  = {   8'd159   ,  6'd20 };
13'd1137  : q  = {   8'd33    ,  6'd29 };
13'd1138  : q  = {   8'd67    ,  6'd23 };
13'd1139  : q  = {   8'd159   ,  6'd23 };
13'd1140  : q  = {   8'd85    ,  6'd0  };
13'd1141  : q  = {   8'd159   ,  6'd25 };
13'd1142  : q  = {   8'd159   ,  6'd26 };
13'd1143  : q  = {   8'd159   ,  6'd27 };
13'd1144  : q  = {   8'd121   ,  6'd10 };
13'd1145  : q  = {   8'd159   ,  6'd29 };
13'd1146  : q  = {   8'd159   ,  6'd30 };
13'd1147  : q  = {   8'd159   ,  6'd31 };
13'd1148  : q  = {   8'd159   ,  6'd32 };
13'd1149  : q  = {   8'd159   ,  6'd33 };
13'd1150  : q  = {   8'd92    ,  6'd17 };
13'd1151  : q  = {   8'd17    ,  6'd14 };
13'd1152  : q  = {   8'd160   ,  6'd0  };
13'd1153  : q  = {   8'd160   ,  6'd1  };
13'd1154  : q  = {   8'd100   ,  6'd33 };
13'd1155  : q  = {   8'd160   ,  6'd3  };
13'd1156  : q  = {   8'd160   ,  6'd4  };
13'd1157  : q  = {   8'd160   ,  6'd5  };
13'd1158  : q  = {   8'd17    ,  6'd15 };
13'd1159  : q  = {   8'd93    ,  6'd18 };
13'd1160  : q  = {   8'd160   ,  6'd8  };
13'd1161  : q  = {   8'd160   ,  6'd9  };
13'd1162  : q  = {   8'd49    ,  6'd11 };
13'd1163  : q  = {   8'd126   ,  6'd25 };
13'd1164  : q  = {   8'd112   ,  6'd8  };
13'd1165  : q  = {   8'd160   ,  6'd13 };
13'd1166  : q  = {   8'd160   ,  6'd14 };
13'd1167  : q  = {   8'd160   ,  6'd15 };
13'd1168  : q  = {   8'd160   ,  6'd16 };
13'd1169  : q  = {   8'd3     ,  6'd30 };
13'd1170  : q  = {   8'd160   ,  6'd18 };
13'd1171  : q  = {   8'd160   ,  6'd19 };
13'd1172  : q  = {   8'd75    ,  6'd3  };
13'd1173  : q  = {   8'd13    ,  6'd28 };
13'd1174  : q  = {   8'd80    ,  6'd6  };
13'd1175  : q  = {   8'd160   ,  6'd23 };
13'd1176  : q  = {   8'd160   ,  6'd24 };
13'd1177  : q  = {   8'd160   ,  6'd25 };
13'd1178  : q  = {   8'd160   ,  6'd26 };
13'd1179  : q  = {   8'd160   ,  6'd27 };
13'd1180  : q  = {   8'd117   ,  6'd10 };
13'd1181  : q  = {   8'd160   ,  6'd29 };
13'd1182  : q  = {   8'd160   ,  6'd30 };
13'd1183  : q  = {   8'd160   ,  6'd31 };
13'd1184  : q  = {   8'd160   ,  6'd32 };
13'd1185  : q  = {   8'd160   ,  6'd33 };
13'd1186  : q  = {   8'd160   ,  6'd34 };
13'd1187  : q  = {   8'd49    ,  6'd14 };
13'd1188  : q  = {   8'd49    ,  6'd15 };
13'd1189  : q  = {   8'd161   ,  6'd1  };
13'd1190  : q  = {   8'd17    ,  6'd18 };
13'd1191  : q  = {   8'd161   ,  6'd3  };
13'd1192  : q  = {   8'd161   ,  6'd4  };
13'd1193  : q  = {   8'd161   ,  6'd5  };
13'd1194  : q  = {   8'd28    ,  6'd31 };
13'd1195  : q  = {   8'd49    ,  6'd17 };
13'd1196  : q  = {   8'd49    ,  6'd18 };
13'd1197  : q  = {   8'd161   ,  6'd9  };
13'd1198  : q  = {   8'd161   ,  6'd10 };
13'd1199  : q  = {   8'd69    ,  6'd15 };
13'd1200  : q  = {   8'd161   ,  6'd12 };
13'd1201  : q  = {   8'd81    ,  6'd32 };
13'd1202  : q  = {   8'd161   ,  6'd14 };
13'd1203  : q  = {   8'd161   ,  6'd15 };
13'd1204  : q  = {   8'd94    ,  6'd10 };
13'd1205  : q  = {   8'd161   ,  6'd17 };
13'd1206  : q  = {   8'd106   ,  6'd29 };
13'd1207  : q  = {   8'd49    ,  6'd19 };
13'd1208  : q  = {   8'd91    ,  6'd34 };
13'd1209  : q  = {   8'd49    ,  6'd21 };
13'd1210  : q  = {   8'd161   ,  6'd22 };
13'd1211  : q  = {   8'd161   ,  6'd23 };
13'd1212  : q  = {   8'd161   ,  6'd24 };
13'd1213  : q  = {   8'd161   ,  6'd25 };
13'd1214  : q  = {   8'd161   ,  6'd26 };
13'd1215  : q  = {   8'd75    ,  6'd4  };
13'd1216  : q  = {   8'd31    ,  6'd31 };
13'd1217  : q  = {   8'd161   ,  6'd29 };
13'd1218  : q  = {   8'd161   ,  6'd30 };
13'd1219  : q  = {   8'd22    ,  6'd34 };
13'd1220  : q  = {   8'd37    ,  6'd5  };
13'd1221  : q  = {   8'd161   ,  6'd33 };
13'd1222  : q  = {   8'd161   ,  6'd34 };
13'd1223  : q  = {   8'd49    ,  6'd25 };
13'd1224  : q  = {   8'd114   ,  6'd5  };
13'd1225  : q  = {   8'd120   ,  6'd22 };
13'd1226  : q  = {   8'd119   ,  6'd33 };
13'd1227  : q  = {   8'd162   ,  6'd3  };
13'd1228  : q  = {   8'd127   ,  6'd14 };
13'd1229  : q  = {   8'd162   ,  6'd5  };
13'd1230  : q  = {   8'd162   ,  6'd6  };
13'd1231  : q  = {   8'd49    ,  6'd28 };
13'd1232  : q  = {   8'd49    ,  6'd29 };
13'd1233  : q  = {   8'd162   ,  6'd9  };
13'd1234  : q  = {   8'd162   ,  6'd10 };
13'd1235  : q  = {   8'd69    ,  6'd16 };
13'd1236  : q  = {   8'd162   ,  6'd12 };
13'd1237  : q  = {   8'd162   ,  6'd13 };
13'd1238  : q  = {   8'd162   ,  6'd14 };
13'd1239  : q  = {   8'd162   ,  6'd15 };
13'd1240  : q  = {   8'd162   ,  6'd16 };
13'd1241  : q  = {   8'd162   ,  6'd17 };
13'd1242  : q  = {   8'd162   ,  6'd18 };
13'd1243  : q  = {   8'd49    ,  6'd30 };
13'd1244  : q  = {   8'd49    ,  6'd31 };
13'd1245  : q  = {   8'd104   ,  6'd1  };
13'd1246  : q  = {   8'd162   ,  6'd22 };
13'd1247  : q  = {   8'd162   ,  6'd23 };
13'd1248  : q  = {   8'd162   ,  6'd24 };
13'd1249  : q  = {   8'd162   ,  6'd25 };
13'd1250  : q  = {   8'd162   ,  6'd26 };
13'd1251  : q  = {   8'd0     ,  6'd35 };
13'd1252  : q  = {   8'd81    ,  6'd33 };
13'd1253  : q  = {   8'd162   ,  6'd29 };
13'd1254  : q  = {   8'd162   ,  6'd30 };
13'd1255  : q  = {   8'd3     ,  6'd32 };
13'd1256  : q  = {   8'd162   ,  6'd32 };
13'd1257  : q  = {   8'd26    ,  6'd35 };
13'd1258  : q  = {   8'd162   ,  6'd34 };
13'd1259  : q  = {   8'd50    ,  6'd0  };
13'd1260  : q  = {   8'd7     ,  6'd21 };
13'd1261  : q  = {   8'd163   ,  6'd1  };
13'd1262  : q  = {   8'd50    ,  6'd2  };
13'd1263  : q  = {   8'd163   ,  6'd3  };
13'd1264  : q  = {   8'd163   ,  6'd4  };
13'd1265  : q  = {   8'd163   ,  6'd5  };
13'd1266  : q  = {   8'd163   ,  6'd6  };
13'd1267  : q  = {   8'd89    ,  6'd8  };
13'd1268  : q  = {   8'd125   ,  6'd4  };
13'd1269  : q  = {   8'd163   ,  6'd9  };
13'd1270  : q  = {   8'd99    ,  6'd26 };
13'd1271  : q  = {   8'd100   ,  6'd5  };
13'd1272  : q  = {   8'd109   ,  6'd16 };
13'd1273  : q  = {   8'd163   ,  6'd13 };
13'd1274  : q  = {   8'd163   ,  6'd14 };
13'd1275  : q  = {   8'd163   ,  6'd15 };
13'd1276  : q  = {   8'd163   ,  6'd16 };
13'd1277  : q  = {   8'd163   ,  6'd17 };
13'd1278  : q  = {   8'd101   ,  6'd29 };
13'd1279  : q  = {   8'd50    ,  6'd5  };
13'd1280  : q  = {   8'd89    ,  6'd13 };
13'd1281  : q  = {   8'd17    ,  6'd23 };
13'd1282  : q  = {   8'd1     ,  6'd27 };
13'd1283  : q  = {   8'd105   ,  6'd25 };
13'd1284  : q  = {   8'd163   ,  6'd24 };
13'd1285  : q  = {   8'd163   ,  6'd25 };
13'd1286  : q  = {   8'd92    ,  6'd20 };
13'd1287  : q  = {   8'd17    ,  6'd24 };
13'd1288  : q  = {   8'd103   ,  6'd11 };
13'd1289  : q  = {   8'd163   ,  6'd29 };
13'd1290  : q  = {   8'd39    ,  6'd29 };
13'd1291  : q  = {   8'd30    ,  6'd13 };
13'd1292  : q  = {   8'd27    ,  6'd4  };
13'd1293  : q  = {   8'd31    ,  6'd33 };
13'd1294  : q  = {   8'd163   ,  6'd34 };
13'd1295  : q  = {   8'd98    ,  6'd30 };
13'd1296  : q  = {   8'd164   ,  6'd0  };
13'd1297  : q  = {   8'd164   ,  6'd1  };
13'd1298  : q  = {   8'd50    ,  6'd13 };
13'd1299  : q  = {   8'd164   ,  6'd3  };
13'd1300  : q  = {   8'd164   ,  6'd4  };
13'd1301  : q  = {   8'd164   ,  6'd5  };
13'd1302  : q  = {   8'd114   ,  6'd8  };
13'd1303  : q  = {   8'd50    ,  6'd15 };
13'd1304  : q  = {   8'd164   ,  6'd8  };
13'd1305  : q  = {   8'd164   ,  6'd9  };
13'd1306  : q  = {   8'd164   ,  6'd10 };
13'd1307  : q  = {   8'd17    ,  6'd27 };
13'd1308  : q  = {   8'd75    ,  6'd6  };
13'd1309  : q  = {   8'd164   ,  6'd13 };
13'd1310  : q  = {   8'd164   ,  6'd14 };
13'd1311  : q  = {   8'd164   ,  6'd15 };
13'd1312  : q  = {   8'd164   ,  6'd16 };
13'd1313  : q  = {   8'd164   ,  6'd17 };
13'd1314  : q  = {   8'd164   ,  6'd18 };
13'd1315  : q  = {   8'd164   ,  6'd19 };
13'd1316  : q  = {   8'd164   ,  6'd20 };
13'd1317  : q  = {   8'd50    ,  6'd17 };
13'd1318  : q  = {   8'd50    ,  6'd18 };
13'd1319  : q  = {   8'd164   ,  6'd23 };
13'd1320  : q  = {   8'd164   ,  6'd24 };
13'd1321  : q  = {   8'd164   ,  6'd25 };
13'd1322  : q  = {   8'd164   ,  6'd26 };
13'd1323  : q  = {   8'd164   ,  6'd27 };
13'd1324  : q  = {   8'd50    ,  6'd19 };
13'd1325  : q  = {   8'd14    ,  6'd2  };
13'd1326  : q  = {   8'd164   ,  6'd30 };
13'd1327  : q  = {   8'd164   ,  6'd31 };
13'd1328  : q  = {   8'd164   ,  6'd32 };
13'd1329  : q  = {   8'd164   ,  6'd33 };
13'd1330  : q  = {   8'd164   ,  6'd34 };
13'd1331  : q  = {   8'd50    ,  6'd20 };
13'd1332  : q  = {   8'd165   ,  6'd0  };
13'd1333  : q  = {   8'd165   ,  6'd1  };
13'd1334  : q  = {   8'd96    ,  6'd4  };
13'd1335  : q  = {   8'd165   ,  6'd3  };
13'd1336  : q  = {   8'd165   ,  6'd4  };
13'd1337  : q  = {   8'd165   ,  6'd5  };
13'd1338  : q  = {   8'd105   ,  6'd3  };
13'd1339  : q  = {   8'd17    ,  6'd28 };
13'd1340  : q  = {   8'd165   ,  6'd8  };
13'd1341  : q  = {   8'd115   ,  6'd15 };
13'd1342  : q  = {   8'd165   ,  6'd10 };
13'd1343  : q  = {   8'd165   ,  6'd11 };
13'd1344  : q  = {   8'd96    ,  6'd5  };
13'd1345  : q  = {   8'd165   ,  6'd13 };
13'd1346  : q  = {   8'd165   ,  6'd14 };
13'd1347  : q  = {   8'd165   ,  6'd15 };
13'd1348  : q  = {   8'd33    ,  6'd15 };
13'd1349  : q  = {   8'd165   ,  6'd17 };
13'd1350  : q  = {   8'd165   ,  6'd18 };
13'd1351  : q  = {   8'd165   ,  6'd19 };
13'd1352  : q  = {   8'd165   ,  6'd20 };
13'd1353  : q  = {   8'd50    ,  6'd24 };
13'd1354  : q  = {   8'd9     ,  6'd25 };
13'd1355  : q  = {   8'd165   ,  6'd23 };
13'd1356  : q  = {   8'd165   ,  6'd24 };
13'd1357  : q  = {   8'd165   ,  6'd25 };
13'd1358  : q  = {   8'd165   ,  6'd26 };
13'd1359  : q  = {   8'd165   ,  6'd27 };
13'd1360  : q  = {   8'd50    ,  6'd25 };
13'd1361  : q  = {   8'd165   ,  6'd29 };
13'd1362  : q  = {   8'd105   ,  6'd5  };
13'd1363  : q  = {   8'd165   ,  6'd31 };
13'd1364  : q  = {   8'd32    ,  6'd15 };
13'd1365  : q  = {   8'd165   ,  6'd33 };
13'd1366  : q  = {   8'd165   ,  6'd34 };
13'd1367  : q  = {   8'd50    ,  6'd26 };
13'd1368  : q  = {   8'd166   ,  6'd0  };
13'd1369  : q  = {   8'd166   ,  6'd1  };
13'd1370  : q  = {   8'd17    ,  6'd29 };
13'd1371  : q  = {   8'd166   ,  6'd3  };
13'd1372  : q  = {   8'd166   ,  6'd4  };
13'd1373  : q  = {   8'd38    ,  6'd5  };
13'd1374  : q  = {   8'd108   ,  6'd30 };
13'd1375  : q  = {   8'd0     ,  6'd21 };
13'd1376  : q  = {   8'd166   ,  6'd8  };
13'd1377  : q  = {   8'd166   ,  6'd9  };
13'd1378  : q  = {   8'd166   ,  6'd10 };
13'd1379  : q  = {   8'd166   ,  6'd11 };
13'd1380  : q  = {   8'd166   ,  6'd12 };
13'd1381  : q  = {   8'd166   ,  6'd13 };
13'd1382  : q  = {   8'd92    ,  6'd21 };
13'd1383  : q  = {   8'd166   ,  6'd15 };
13'd1384  : q  = {   8'd166   ,  6'd16 };
13'd1385  : q  = {   8'd123   ,  6'd12 };
13'd1386  : q  = {   8'd166   ,  6'd18 };
13'd1387  : q  = {   8'd166   ,  6'd19 };
13'd1388  : q  = {   8'd166   ,  6'd20 };
13'd1389  : q  = {   8'd50    ,  6'd30 };
13'd1390  : q  = {   8'd69    ,  6'd18 };
13'd1391  : q  = {   8'd25    ,  6'd8  };
13'd1392  : q  = {   8'd166   ,  6'd24 };
13'd1393  : q  = {   8'd166   ,  6'd25 };
13'd1394  : q  = {   8'd166   ,  6'd26 };
13'd1395  : q  = {   8'd166   ,  6'd27 };
13'd1396  : q  = {   8'd166   ,  6'd28 };
13'd1397  : q  = {   8'd166   ,  6'd29 };
13'd1398  : q  = {   8'd166   ,  6'd30 };
13'd1399  : q  = {   8'd166   ,  6'd31 };
13'd1400  : q  = {   8'd166   ,  6'd32 };
13'd1401  : q  = {   8'd166   ,  6'd33 };
13'd1402  : q  = {   8'd166   ,  6'd34 };
13'd1403  : q  = {   8'd166   ,  6'd35 };
13'd1404  : q  = {   8'd50    ,  6'd31 };
13'd1405  : q  = {   8'd50    ,  6'd32 };
13'd1406  : q  = {   8'd17    ,  6'd30 };
13'd1407  : q  = {   8'd167   ,  6'd3  };
13'd1408  : q  = {   8'd167   ,  6'd4  };
13'd1409  : q  = {   8'd167   ,  6'd5  };
13'd1410  : q  = {   8'd167   ,  6'd6  };
13'd1411  : q  = {   8'd50    ,  6'd34 };
13'd1412  : q  = {   8'd86    ,  6'd13 };
13'd1413  : q  = {   8'd167   ,  6'd9  };
13'd1414  : q  = {   8'd167   ,  6'd10 };
13'd1415  : q  = {   8'd167   ,  6'd11 };
13'd1416  : q  = {   8'd33    ,  6'd16 };
13'd1417  : q  = {   8'd81    ,  6'd34 };
13'd1418  : q  = {   8'd167   ,  6'd14 };
13'd1419  : q  = {   8'd167   ,  6'd15 };
13'd1420  : q  = {   8'd167   ,  6'd16 };
13'd1421  : q  = {   8'd167   ,  6'd17 };
13'd1422  : q  = {   8'd167   ,  6'd18 };
13'd1423  : q  = {   8'd51    ,  6'd0  };
13'd1424  : q  = {   8'd103   ,  6'd26 };
13'd1425  : q  = {   8'd167   ,  6'd21 };
13'd1426  : q  = {   8'd51    ,  6'd2  };
13'd1427  : q  = {   8'd75    ,  6'd8  };
13'd1428  : q  = {   8'd125   ,  6'd27 };
13'd1429  : q  = {   8'd167   ,  6'd25 };
13'd1430  : q  = {   8'd107   ,  6'd3  };
13'd1431  : q  = {   8'd167   ,  6'd27 };
13'd1432  : q  = {   8'd51    ,  6'd3  };
13'd1433  : q  = {   8'd167   ,  6'd29 };
13'd1434  : q  = {   8'd86    ,  6'd14 };
13'd1435  : q  = {   8'd86    ,  6'd15 };
13'd1436  : q  = {   8'd39    ,  6'd18 };
13'd1437  : q  = {   8'd81    ,  6'd35 };
13'd1438  : q  = {   8'd51    ,  6'd5  };
13'd1439  : q  = {   8'd96    ,  6'd6  };
13'd1440  : q  = {   8'd17    ,  6'd33 };
13'd1441  : q  = {   8'd168   ,  6'd1  };
13'd1442  : q  = {   8'd51    ,  6'd8  };
13'd1443  : q  = {   8'd168   ,  6'd3  };
13'd1444  : q  = {   8'd168   ,  6'd4  };
13'd1445  : q  = {   8'd168   ,  6'd5  };
13'd1446  : q  = {   8'd84    ,  6'd32 };
13'd1447  : q  = {   8'd25    ,  6'd9  };
13'd1448  : q  = {   8'd17    ,  6'd35 };
13'd1449  : q  = {   8'd5     ,  6'd29 };
13'd1450  : q  = {   8'd51    ,  6'd11 };
13'd1451  : q  = {   8'd31    ,  6'd5  };
13'd1452  : q  = {   8'd4     ,  6'd30 };
13'd1453  : q  = {   8'd168   ,  6'd13 };
13'd1454  : q  = {   8'd168   ,  6'd14 };
13'd1455  : q  = {   8'd168   ,  6'd15 };
13'd1456  : q  = {   8'd168   ,  6'd16 };
13'd1457  : q  = {   8'd78    ,  6'd15 };
13'd1458  : q  = {   8'd32    ,  6'd6  };
13'd1459  : q  = {   8'd115   ,  6'd27 };
13'd1460  : q  = {   8'd3     ,  6'd35 };
13'd1461  : q  = {   8'd51    ,  6'd13 };
13'd1462  : q  = {   8'd82    ,  6'd0  };
13'd1463  : q  = {   8'd168   ,  6'd23 };
13'd1464  : q  = {   8'd168   ,  6'd24 };
13'd1465  : q  = {   8'd73    ,  6'd15 };
13'd1466  : q  = {   8'd5     ,  6'd24 };
13'd1467  : q  = {   8'd168   ,  6'd27 };
13'd1468  : q  = {   8'd84    ,  6'd28 };
13'd1469  : q  = {   8'd168   ,  6'd29 };
13'd1470  : q  = {   8'd105   ,  6'd8  };
13'd1471  : q  = {   8'd104   ,  6'd8  };
13'd1472  : q  = {   8'd51    ,  6'd14 };
13'd1473  : q  = {   8'd168   ,  6'd33 };
13'd1474  : q  = {   8'd168   ,  6'd34 };
13'd1475  : q  = {   8'd168   ,  6'd35 };
13'd1476  : q  = {   8'd82    ,  6'd1  };
13'd1477  : q  = {   8'd169   ,  6'd1  };
13'd1478  : q  = {   8'd169   ,  6'd2  };
13'd1479  : q  = {   8'd169   ,  6'd3  };
13'd1480  : q  = {   8'd67    ,  6'd33 };
13'd1481  : q  = {   8'd169   ,  6'd5  };
13'd1482  : q  = {   8'd169   ,  6'd6  };
13'd1483  : q  = {   8'd18    ,  6'd1  };
13'd1484  : q  = {   8'd169   ,  6'd8  };
13'd1485  : q  = {   8'd169   ,  6'd9  };
13'd1486  : q  = {   8'd169   ,  6'd10 };
13'd1487  : q  = {   8'd169   ,  6'd11 };
13'd1488  : q  = {   8'd169   ,  6'd12 };
13'd1489  : q  = {   8'd78    ,  6'd16 };
13'd1490  : q  = {   8'd169   ,  6'd14 };
13'd1491  : q  = {   8'd169   ,  6'd15 };
13'd1492  : q  = {   8'd169   ,  6'd16 };
13'd1493  : q  = {   8'd169   ,  6'd17 };
13'd1494  : q  = {   8'd118   ,  6'd2  };
13'd1495  : q  = {   8'd28    ,  6'd34 };
13'd1496  : q  = {   8'd51    ,  6'd17 };
13'd1497  : q  = {   8'd169   ,  6'd21 };
13'd1498  : q  = {   8'd51    ,  6'd18 };
13'd1499  : q  = {   8'd169   ,  6'd23 };
13'd1500  : q  = {   8'd169   ,  6'd24 };
13'd1501  : q  = {   8'd169   ,  6'd25 };
13'd1502  : q  = {   8'd169   ,  6'd26 };
13'd1503  : q  = {   8'd169   ,  6'd27 };
13'd1504  : q  = {   8'd169   ,  6'd28 };
13'd1505  : q  = {   8'd36    ,  6'd26 };
13'd1506  : q  = {   8'd119   ,  6'd17 };
13'd1507  : q  = {   8'd169   ,  6'd31 };
13'd1508  : q  = {   8'd169   ,  6'd32 };
13'd1509  : q  = {   8'd169   ,  6'd33 };
13'd1510  : q  = {   8'd169   ,  6'd34 };
13'd1511  : q  = {   8'd169   ,  6'd35 };
13'd1512  : q  = {   8'd170   ,  6'd0  };
13'd1513  : q  = {   8'd170   ,  6'd1  };
13'd1514  : q  = {   8'd51    ,  6'd19 };
13'd1515  : q  = {   8'd170   ,  6'd3  };
13'd1516  : q  = {   8'd170   ,  6'd4  };
13'd1517  : q  = {   8'd170   ,  6'd5  };
13'd1518  : q  = {   8'd51    ,  6'd20 };
13'd1519  : q  = {   8'd51    ,  6'd21 };
13'd1520  : q  = {   8'd170   ,  6'd8  };
13'd1521  : q  = {   8'd170   ,  6'd9  };
13'd1522  : q  = {   8'd14    ,  6'd18 };
13'd1523  : q  = {   8'd90    ,  6'd25 };
13'd1524  : q  = {   8'd170   ,  6'd12 };
13'd1525  : q  = {   8'd170   ,  6'd13 };
13'd1526  : q  = {   8'd170   ,  6'd14 };
13'd1527  : q  = {   8'd170   ,  6'd15 };
13'd1528  : q  = {   8'd170   ,  6'd16 };
13'd1529  : q  = {   8'd26    ,  6'd15 };
13'd1530  : q  = {   8'd170   ,  6'd18 };
13'd1531  : q  = {   8'd170   ,  6'd19 };
13'd1532  : q  = {   8'd170   ,  6'd20 };
13'd1533  : q  = {   8'd7     ,  6'd25 };
13'd1534  : q  = {   8'd10    ,  6'd11 };
13'd1535  : q  = {   8'd170   ,  6'd23 };
13'd1536  : q  = {   8'd170   ,  6'd24 };
13'd1537  : q  = {   8'd170   ,  6'd25 };
13'd1538  : q  = {   8'd170   ,  6'd26 };
13'd1539  : q  = {   8'd170   ,  6'd27 };
13'd1540  : q  = {   8'd125   ,  6'd5  };
13'd1541  : q  = {   8'd113   ,  6'd18 };
13'd1542  : q  = {   8'd170   ,  6'd30 };
13'd1543  : q  = {   8'd170   ,  6'd31 };
13'd1544  : q  = {   8'd170   ,  6'd32 };
13'd1545  : q  = {   8'd170   ,  6'd33 };
13'd1546  : q  = {   8'd170   ,  6'd34 };
13'd1547  : q  = {   8'd170   ,  6'd35 };
13'd1548  : q  = {   8'd171   ,  6'd0  };
13'd1549  : q  = {   8'd171   ,  6'd1  };
13'd1550  : q  = {   8'd14    ,  6'd15 };
13'd1551  : q  = {   8'd171   ,  6'd3  };
13'd1552  : q  = {   8'd37    ,  6'd15 };
13'd1553  : q  = {   8'd171   ,  6'd5  };
13'd1554  : q  = {   8'd51    ,  6'd26 };
13'd1555  : q  = {   8'd18    ,  6'd3  };
13'd1556  : q  = {   8'd171   ,  6'd8  };
13'd1557  : q  = {   8'd171   ,  6'd9  };
13'd1558  : q  = {   8'd51    ,  6'd28 };
13'd1559  : q  = {   8'd171   ,  6'd11 };
13'd1560  : q  = {   8'd171   ,  6'd12 };
13'd1561  : q  = {   8'd90    ,  6'd26 };
13'd1562  : q  = {   8'd14    ,  6'd8  };
13'd1563  : q  = {   8'd171   ,  6'd15 };
13'd1564  : q  = {   8'd97    ,  6'd27 };
13'd1565  : q  = {   8'd26    ,  6'd29 };
13'd1566  : q  = {   8'd171   ,  6'd18 };
13'd1567  : q  = {   8'd171   ,  6'd19 };
13'd1568  : q  = {   8'd171   ,  6'd20 };
13'd1569  : q  = {   8'd51    ,  6'd30 };
13'd1570  : q  = {   8'd75    ,  6'd12 };
13'd1571  : q  = {   8'd171   ,  6'd23 };
13'd1572  : q  = {   8'd5     ,  6'd30 };
13'd1573  : q  = {   8'd171   ,  6'd25 };
13'd1574  : q  = {   8'd171   ,  6'd26 };
13'd1575  : q  = {   8'd171   ,  6'd27 };
13'd1576  : q  = {   8'd106   ,  6'd12 };
13'd1577  : q  = {   8'd171   ,  6'd29 };
13'd1578  : q  = {   8'd90    ,  6'd27 };
13'd1579  : q  = {   8'd171   ,  6'd31 };
13'd1580  : q  = {   8'd171   ,  6'd32 };
13'd1581  : q  = {   8'd171   ,  6'd33 };
13'd1582  : q  = {   8'd51    ,  6'd31 };
13'd1583  : q  = {   8'd171   ,  6'd35 };
13'd1584  : q  = {   8'd172   ,  6'd0  };
13'd1585  : q  = {   8'd104   ,  6'd16 };
13'd1586  : q  = {   8'd51    ,  6'd32 };
13'd1587  : q  = {   8'd172   ,  6'd3  };
13'd1588  : q  = {   8'd172   ,  6'd4  };
13'd1589  : q  = {   8'd106   ,  6'd15 };
13'd1590  : q  = {   8'd18    ,  6'd4  };
13'd1591  : q  = {   8'd172   ,  6'd7  };
13'd1592  : q  = {   8'd86    ,  6'd18 };
13'd1593  : q  = {   8'd122   ,  6'd23 };
13'd1594  : q  = {   8'd22    ,  6'd35 };
13'd1595  : q  = {   8'd28    ,  6'd35 };
13'd1596  : q  = {   8'd25    ,  6'd12 };
13'd1597  : q  = {   8'd102   ,  6'd1  };
13'd1598  : q  = {   8'd51    ,  6'd34 };
13'd1599  : q  = {   8'd172   ,  6'd15 };
13'd1600  : q  = {   8'd78    ,  6'd18 };
13'd1601  : q  = {   8'd86    ,  6'd20 };
13'd1602  : q  = {   8'd35    ,  6'd26 };
13'd1603  : q  = {   8'd18    ,  6'd5  };
13'd1604  : q  = {   8'd172   ,  6'd20 };
13'd1605  : q  = {   8'd52    ,  6'd0  };
13'd1606  : q  = {   8'd75    ,  6'd15 };
13'd1607  : q  = {   8'd18    ,  6'd6  };
13'd1608  : q  = {   8'd121   ,  6'd30 };
13'd1609  : q  = {   8'd172   ,  6'd25 };
13'd1610  : q  = {   8'd172   ,  6'd26 };
13'd1611  : q  = {   8'd172   ,  6'd27 };
13'd1612  : q  = {   8'd172   ,  6'd28 };
13'd1613  : q  = {   8'd172   ,  6'd29 };
13'd1614  : q  = {   8'd82    ,  6'd4  };
13'd1615  : q  = {   8'd172   ,  6'd31 };
13'd1616  : q  = {   8'd172   ,  6'd32 };
13'd1617  : q  = {   8'd172   ,  6'd33 };
13'd1618  : q  = {   8'd52    ,  6'd2  };
13'd1619  : q  = {   8'd172   ,  6'd35 };
13'd1620  : q  = {   8'd173   ,  6'd0  };
13'd1621  : q  = {   8'd52    ,  6'd3  };
13'd1622  : q  = {   8'd52    ,  6'd4  };
13'd1623  : q  = {   8'd173   ,  6'd3  };
13'd1624  : q  = {   8'd173   ,  6'd4  };
13'd1625  : q  = {   8'd73    ,  6'd27 };
13'd1626  : q  = {   8'd173   ,  6'd6  };
13'd1627  : q  = {   8'd173   ,  6'd7  };
13'd1628  : q  = {   8'd10    ,  6'd12 };
13'd1629  : q  = {   8'd173   ,  6'd9  };
13'd1630  : q  = {   8'd117   ,  6'd17 };
13'd1631  : q  = {   8'd173   ,  6'd11 };
13'd1632  : q  = {   8'd52    ,  6'd6  };
13'd1633  : q  = {   8'd101   ,  6'd1  };
13'd1634  : q  = {   8'd108   ,  6'd3  };
13'd1635  : q  = {   8'd2     ,  6'd12 };
13'd1636  : q  = {   8'd103   ,  6'd27 };
13'd1637  : q  = {   8'd173   ,  6'd17 };
13'd1638  : q  = {   8'd173   ,  6'd18 };
13'd1639  : q  = {   8'd52    ,  6'd8  };
13'd1640  : q  = {   8'd173   ,  6'd20 };
13'd1641  : q  = {   8'd173   ,  6'd21 };
13'd1642  : q  = {   8'd32    ,  6'd13 };
13'd1643  : q  = {   8'd18    ,  6'd8  };
13'd1644  : q  = {   8'd173   ,  6'd24 };
13'd1645  : q  = {   8'd173   ,  6'd25 };
13'd1646  : q  = {   8'd173   ,  6'd26 };
13'd1647  : q  = {   8'd173   ,  6'd27 };
13'd1648  : q  = {   8'd173   ,  6'd28 };
13'd1649  : q  = {   8'd173   ,  6'd29 };
13'd1650  : q  = {   8'd173   ,  6'd30 };
13'd1651  : q  = {   8'd173   ,  6'd31 };
13'd1652  : q  = {   8'd111   ,  6'd12 };
13'd1653  : q  = {   8'd0     ,  6'd14 };
13'd1654  : q  = {   8'd173   ,  6'd34 };
13'd1655  : q  = {   8'd173   ,  6'd35 };
13'd1656  : q  = {   8'd174   ,  6'd0  };
13'd1657  : q  = {   8'd174   ,  6'd1  };
13'd1658  : q  = {   8'd18    ,  6'd9  };
13'd1659  : q  = {   8'd174   ,  6'd3  };
13'd1660  : q  = {   8'd174   ,  6'd4  };
13'd1661  : q  = {   8'd174   ,  6'd5  };
13'd1662  : q  = {   8'd174   ,  6'd6  };
13'd1663  : q  = {   8'd174   ,  6'd7  };
13'd1664  : q  = {   8'd174   ,  6'd8  };
13'd1665  : q  = {   8'd174   ,  6'd9  };
13'd1666  : q  = {   8'd52    ,  6'd11 };
13'd1667  : q  = {   8'd9     ,  6'd27 };
13'd1668  : q  = {   8'd5     ,  6'd35 };
13'd1669  : q  = {   8'd174   ,  6'd13 };
13'd1670  : q  = {   8'd174   ,  6'd14 };
13'd1671  : q  = {   8'd174   ,  6'd15 };
13'd1672  : q  = {   8'd32    ,  6'd14 };
13'd1673  : q  = {   8'd174   ,  6'd17 };
13'd1674  : q  = {   8'd174   ,  6'd18 };
13'd1675  : q  = {   8'd12    ,  6'd35 };
13'd1676  : q  = {   8'd174   ,  6'd20 };
13'd1677  : q  = {   8'd52    ,  6'd14 };
13'd1678  : q  = {   8'd83    ,  6'd31 };
13'd1679  : q  = {   8'd174   ,  6'd23 };
13'd1680  : q  = {   8'd174   ,  6'd24 };
13'd1681  : q  = {   8'd174   ,  6'd25 };
13'd1682  : q  = {   8'd110   ,  6'd24 };
13'd1683  : q  = {   8'd174   ,  6'd27 };
13'd1684  : q  = {   8'd174   ,  6'd28 };
13'd1685  : q  = {   8'd174   ,  6'd29 };
13'd1686  : q  = {   8'd174   ,  6'd30 };
13'd1687  : q  = {   8'd174   ,  6'd31 };
13'd1688  : q  = {   8'd174   ,  6'd32 };
13'd1689  : q  = {   8'd174   ,  6'd33 };
13'd1690  : q  = {   8'd174   ,  6'd34 };
13'd1691  : q  = {   8'd174   ,  6'd35 };
13'd1692  : q  = {   8'd175   ,  6'd0  };
13'd1693  : q  = {   8'd124   ,  6'd1  };
13'd1694  : q  = {   8'd175   ,  6'd2  };
13'd1695  : q  = {   8'd175   ,  6'd3  };
13'd1696  : q  = {   8'd175   ,  6'd4  };
13'd1697  : q  = {   8'd175   ,  6'd5  };
13'd1698  : q  = {   8'd124   ,  6'd25 };
13'd1699  : q  = {   8'd175   ,  6'd7  };
13'd1700  : q  = {   8'd125   ,  6'd25 };
13'd1701  : q  = {   8'd175   ,  6'd9  };
13'd1702  : q  = {   8'd28    ,  6'd13 };
13'd1703  : q  = {   8'd90    ,  6'd29 };
13'd1704  : q  = {   8'd2     ,  6'd27 };
13'd1705  : q  = {   8'd104   ,  6'd27 };
13'd1706  : q  = {   8'd114   ,  6'd12 };
13'd1707  : q  = {   8'd113   ,  6'd12 };
13'd1708  : q  = {   8'd29    ,  6'd0  };
13'd1709  : q  = {   8'd175   ,  6'd17 };
13'd1710  : q  = {   8'd175   ,  6'd18 };
13'd1711  : q  = {   8'd175   ,  6'd19 };
13'd1712  : q  = {   8'd67    ,  6'd29 };
13'd1713  : q  = {   8'd52    ,  6'd17 };
13'd1714  : q  = {   8'd175   ,  6'd22 };
13'd1715  : q  = {   8'd52    ,  6'd18 };
13'd1716  : q  = {   8'd175   ,  6'd24 };
13'd1717  : q  = {   8'd175   ,  6'd25 };
13'd1718  : q  = {   8'd82    ,  6'd6  };
13'd1719  : q  = {   8'd175   ,  6'd27 };
13'd1720  : q  = {   8'd175   ,  6'd28 };
13'd1721  : q  = {   8'd175   ,  6'd29 };
13'd1722  : q  = {   8'd175   ,  6'd30 };
13'd1723  : q  = {   8'd175   ,  6'd31 };
13'd1724  : q  = {   8'd175   ,  6'd32 };
13'd1725  : q  = {   8'd124   ,  6'd8  };
13'd1726  : q  = {   8'd175   ,  6'd34 };
13'd1727  : q  = {   8'd27    ,  6'd18 };
13'd1728  : q  = {   8'd176   ,  6'd0  };
13'd1729  : q  = {   8'd176   ,  6'd1  };
13'd1730  : q  = {   8'd3     ,  6'd6  };
13'd1731  : q  = {   8'd176   ,  6'd3  };
13'd1732  : q  = {   8'd176   ,  6'd4  };
13'd1733  : q  = {   8'd176   ,  6'd5  };
13'd1734  : q  = {   8'd176   ,  6'd6  };
13'd1735  : q  = {   8'd176   ,  6'd7  };
13'd1736  : q  = {   8'd176   ,  6'd8  };
13'd1737  : q  = {   8'd176   ,  6'd9  };
13'd1738  : q  = {   8'd52    ,  6'd21 };
13'd1739  : q  = {   8'd127   ,  6'd23 };
13'd1740  : q  = {   8'd52    ,  6'd22 };
13'd1741  : q  = {   8'd176   ,  6'd13 };
13'd1742  : q  = {   8'd36    ,  6'd23 };
13'd1743  : q  = {   8'd52    ,  6'd24 };
13'd1744  : q  = {   8'd104   ,  6'd22 };
13'd1745  : q  = {   8'd176   ,  6'd17 };
13'd1746  : q  = {   8'd176   ,  6'd18 };
13'd1747  : q  = {   8'd176   ,  6'd19 };
13'd1748  : q  = {   8'd176   ,  6'd20 };
13'd1749  : q  = {   8'd176   ,  6'd21 };
13'd1750  : q  = {   8'd33    ,  6'd3  };
13'd1751  : q  = {   8'd52    ,  6'd25 };
13'd1752  : q  = {   8'd176   ,  6'd24 };
13'd1753  : q  = {   8'd176   ,  6'd25 };
13'd1754  : q  = {   8'd52    ,  6'd26 };
13'd1755  : q  = {   8'd176   ,  6'd27 };
13'd1756  : q  = {   8'd176   ,  6'd28 };
13'd1757  : q  = {   8'd119   ,  6'd31 };
13'd1758  : q  = {   8'd176   ,  6'd30 };
13'd1759  : q  = {   8'd176   ,  6'd31 };
13'd1760  : q  = {   8'd176   ,  6'd32 };
13'd1761  : q  = {   8'd33    ,  6'd4  };
13'd1762  : q  = {   8'd176   ,  6'd34 };
13'd1763  : q  = {   8'd176   ,  6'd35 };
13'd1764  : q  = {   8'd177   ,  6'd0  };
13'd1765  : q  = {   8'd52    ,  6'd27 };
13'd1766  : q  = {   8'd75    ,  6'd18 };
13'd1767  : q  = {   8'd177   ,  6'd3  };
13'd1768  : q  = {   8'd177   ,  6'd4  };
13'd1769  : q  = {   8'd177   ,  6'd5  };
13'd1770  : q  = {   8'd177   ,  6'd6  };
13'd1771  : q  = {   8'd111   ,  6'd9  };
13'd1772  : q  = {   8'd177   ,  6'd8  };
13'd1773  : q  = {   8'd177   ,  6'd9  };
13'd1774  : q  = {   8'd52    ,  6'd29 };
13'd1775  : q  = {   8'd80    ,  6'd23 };
13'd1776  : q  = {   8'd28    ,  6'd4  };
13'd1777  : q  = {   8'd11    ,  6'd7  };
13'd1778  : q  = {   8'd177   ,  6'd14 };
13'd1779  : q  = {   8'd69    ,  6'd23 };
13'd1780  : q  = {   8'd69    ,  6'd24 };
13'd1781  : q  = {   8'd90    ,  6'd30 };
13'd1782  : q  = {   8'd177   ,  6'd18 };
13'd1783  : q  = {   8'd52    ,  6'd31 };
13'd1784  : q  = {   8'd177   ,  6'd20 };
13'd1785  : q  = {   8'd177   ,  6'd21 };
13'd1786  : q  = {   8'd27    ,  6'd20 };
13'd1787  : q  = {   8'd52    ,  6'd32 };
13'd1788  : q  = {   8'd177   ,  6'd24 };
13'd1789  : q  = {   8'd177   ,  6'd25 };
13'd1790  : q  = {   8'd89    ,  6'd9  };
13'd1791  : q  = {   8'd89    ,  6'd2  };
13'd1792  : q  = {   8'd177   ,  6'd28 };
13'd1793  : q  = {   8'd122   ,  6'd17 };
13'd1794  : q  = {   8'd177   ,  6'd30 };
13'd1795  : q  = {   8'd177   ,  6'd31 };
13'd1796  : q  = {   8'd177   ,  6'd32 };
13'd1797  : q  = {   8'd106   ,  6'd23 };
13'd1798  : q  = {   8'd177   ,  6'd34 };
13'd1799  : q  = {   8'd177   ,  6'd35 };
13'd1800  : q  = {   8'd178   ,  6'd0  };
13'd1801  : q  = {   8'd4     ,  6'd1  };
13'd1802  : q  = {   8'd52    ,  6'd34 };
13'd1803  : q  = {   8'd178   ,  6'd3  };
13'd1804  : q  = {   8'd118   ,  6'd17 };
13'd1805  : q  = {   8'd178   ,  6'd5  };
13'd1806  : q  = {   8'd178   ,  6'd6  };
13'd1807  : q  = {   8'd111   ,  6'd27 };
13'd1808  : q  = {   8'd178   ,  6'd8  };
13'd1809  : q  = {   8'd178   ,  6'd9  };
13'd1810  : q  = {   8'd18    ,  6'd14 };
13'd1811  : q  = {   8'd69    ,  6'd25 };
13'd1812  : q  = {   8'd14    ,  6'd3  };
13'd1813  : q  = {   8'd90    ,  6'd31 };
13'd1814  : q  = {   8'd178   ,  6'd14 };
13'd1815  : q  = {   8'd86    ,  6'd25 };
13'd1816  : q  = {   8'd79    ,  6'd21 };
13'd1817  : q  = {   8'd90    ,  6'd32 };
13'd1818  : q  = {   8'd178   ,  6'd18 };
13'd1819  : q  = {   8'd99    ,  6'd33 };
13'd1820  : q  = {   8'd178   ,  6'd20 };
13'd1821  : q  = {   8'd178   ,  6'd21 };
13'd1822  : q  = {   8'd30    ,  6'd14 };
13'd1823  : q  = {   8'd178   ,  6'd23 };
13'd1824  : q  = {   8'd96    ,  6'd10 };
13'd1825  : q  = {   8'd178   ,  6'd25 };
13'd1826  : q  = {   8'd18    ,  6'd15 };
13'd1827  : q  = {   8'd53    ,  6'd2  };
13'd1828  : q  = {   8'd178   ,  6'd28 };
13'd1829  : q  = {   8'd178   ,  6'd29 };
13'd1830  : q  = {   8'd178   ,  6'd30 };
13'd1831  : q  = {   8'd178   ,  6'd31 };
13'd1832  : q  = {   8'd178   ,  6'd32 };
13'd1833  : q  = {   8'd69    ,  6'd26 };
13'd1834  : q  = {   8'd93    ,  6'd20 };
13'd1835  : q  = {   8'd178   ,  6'd35 };
13'd1836  : q  = {   8'd179   ,  6'd0  };
13'd1837  : q  = {   8'd179   ,  6'd1  };
13'd1838  : q  = {   8'd53    ,  6'd4  };
13'd1839  : q  = {   8'd179   ,  6'd3  };
13'd1840  : q  = {   8'd179   ,  6'd4  };
13'd1841  : q  = {   8'd179   ,  6'd5  };
13'd1842  : q  = {   8'd111   ,  6'd5  };
13'd1843  : q  = {   8'd179   ,  6'd7  };
13'd1844  : q  = {   8'd179   ,  6'd8  };
13'd1845  : q  = {   8'd179   ,  6'd9  };
13'd1846  : q  = {   8'd114   ,  6'd4  };
13'd1847  : q  = {   8'd69    ,  6'd27 };
13'd1848  : q  = {   8'd53    ,  6'd6  };
13'd1849  : q  = {   8'd179   ,  6'd13 };
13'd1850  : q  = {   8'd93    ,  6'd21 };
13'd1851  : q  = {   8'd121   ,  6'd34 };
13'd1852  : q  = {   8'd179   ,  6'd16 };
13'd1853  : q  = {   8'd7     ,  6'd30 };
13'd1854  : q  = {   8'd179   ,  6'd18 };
13'd1855  : q  = {   8'd31    ,  6'd24 };
13'd1856  : q  = {   8'd179   ,  6'd20 };
13'd1857  : q  = {   8'd179   ,  6'd21 };
13'd1858  : q  = {   8'd99    ,  6'd34 };
13'd1859  : q  = {   8'd179   ,  6'd23 };
13'd1860  : q  = {   8'd179   ,  6'd24 };
13'd1861  : q  = {   8'd25    ,  6'd15 };
13'd1862  : q  = {   8'd113   ,  6'd5  };
13'd1863  : q  = {   8'd179   ,  6'd27 };
13'd1864  : q  = {   8'd179   ,  6'd28 };
13'd1865  : q  = {   8'd68    ,  6'd31 };
13'd1866  : q  = {   8'd86    ,  6'd27 };
13'd1867  : q  = {   8'd179   ,  6'd31 };
13'd1868  : q  = {   8'd179   ,  6'd32 };
13'd1869  : q  = {   8'd179   ,  6'd33 };
13'd1870  : q  = {   8'd179   ,  6'd34 };
13'd1871  : q  = {   8'd37    ,  6'd8  };
13'd1872  : q  = {   8'd53    ,  6'd11 };
13'd1873  : q  = {   8'd1     ,  6'd18 };
13'd1874  : q  = {   8'd180   ,  6'd2  };
13'd1875  : q  = {   8'd180   ,  6'd3  };
13'd1876  : q  = {   8'd180   ,  6'd4  };
13'd1877  : q  = {   8'd180   ,  6'd5  };
13'd1878  : q  = {   8'd180   ,  6'd6  };
13'd1879  : q  = {   8'd107   ,  6'd31 };
13'd1880  : q  = {   8'd34    ,  6'd18 };
13'd1881  : q  = {   8'd180   ,  6'd9  };
13'd1882  : q  = {   8'd53    ,  6'd14 };
13'd1883  : q  = {   8'd180   ,  6'd11 };
13'd1884  : q  = {   8'd80    ,  6'd30 };
13'd1885  : q  = {   8'd111   ,  6'd15 };
13'd1886  : q  = {   8'd180   ,  6'd14 };
13'd1887  : q  = {   8'd23    ,  6'd24 };
13'd1888  : q  = {   8'd99    ,  6'd8  };
13'd1889  : q  = {   8'd86    ,  6'd30 };
13'd1890  : q  = {   8'd180   ,  6'd18 };
13'd1891  : q  = {   8'd69    ,  6'd29 };
13'd1892  : q  = {   8'd7     ,  6'd33 };
13'd1893  : q  = {   8'd180   ,  6'd21 };
13'd1894  : q  = {   8'd180   ,  6'd22 };
13'd1895  : q  = {   8'd180   ,  6'd23 };
13'd1896  : q  = {   8'd29    ,  6'd4  };
13'd1897  : q  = {   8'd180   ,  6'd25 };
13'd1898  : q  = {   8'd86    ,  6'd32 };
13'd1899  : q  = {   8'd53    ,  6'd18 };
13'd1900  : q  = {   8'd105   ,  6'd11 };
13'd1901  : q  = {   8'd29    ,  6'd5  };
13'd1902  : q  = {   8'd127   ,  6'd1  };
13'd1903  : q  = {   8'd67    ,  6'd30 };
13'd1904  : q  = {   8'd180   ,  6'd32 };
13'd1905  : q  = {   8'd69    ,  6'd30 };
13'd1906  : q  = {   8'd53    ,  6'd19 };
13'd1907  : q  = {   8'd69    ,  6'd31 };
13'd1908  : q  = {   8'd23    ,  6'd9  };
13'd1909  : q  = {   8'd119   ,  6'd3  };
13'd1910  : q  = {   8'd11    ,  6'd30 };
13'd1911  : q  = {   8'd181   ,  6'd3  };
13'd1912  : q  = {   8'd181   ,  6'd4  };
13'd1913  : q  = {   8'd84    ,  6'd23 };
13'd1914  : q  = {   8'd101   ,  6'd2  };
13'd1915  : q  = {   8'd35    ,  6'd6  };
13'd1916  : q  = {   8'd53    ,  6'd21 };
13'd1917  : q  = {   8'd181   ,  6'd9  };
13'd1918  : q  = {   8'd53    ,  6'd22 };
13'd1919  : q  = {   8'd87    ,  6'd0  };
13'd1920  : q  = {   8'd181   ,  6'd12 };
13'd1921  : q  = {   8'd7     ,  6'd34 };
13'd1922  : q  = {   8'd53    ,  6'd24 };
13'd1923  : q  = {   8'd82    ,  6'd13 };
13'd1924  : q  = {   8'd181   ,  6'd16 };
13'd1925  : q  = {   8'd181   ,  6'd17 };
13'd1926  : q  = {   8'd37    ,  6'd14 };
13'd1927  : q  = {   8'd53    ,  6'd25 };
13'd1928  : q  = {   8'd53    ,  6'd26 };
13'd1929  : q  = {   8'd181   ,  6'd21 };
13'd1930  : q  = {   8'd181   ,  6'd22 };
13'd1931  : q  = {   8'd181   ,  6'd23 };
13'd1932  : q  = {   8'd53    ,  6'd27 };
13'd1933  : q  = {   8'd181   ,  6'd25 };
13'd1934  : q  = {   8'd53    ,  6'd28 };
13'd1935  : q  = {   8'd26    ,  6'd6  };
13'd1936  : q  = {   8'd118   ,  6'd16 };
13'd1937  : q  = {   8'd181   ,  6'd29 };
13'd1938  : q  = {   8'd181   ,  6'd30 };
13'd1939  : q  = {   8'd87    ,  6'd1  };
13'd1940  : q  = {   8'd181   ,  6'd32 };
13'd1941  : q  = {   8'd35    ,  6'd0  };
13'd1942  : q  = {   8'd53    ,  6'd29 };
13'd1943  : q  = {   8'd113   ,  6'd20 };
13'd1944  : q  = {   8'd116   ,  6'd30 };
13'd1945  : q  = {   8'd182   ,  6'd1  };
13'd1946  : q  = {   8'd182   ,  6'd2  };
13'd1947  : q  = {   8'd182   ,  6'd3  };
13'd1948  : q  = {   8'd182   ,  6'd4  };
13'd1949  : q  = {   8'd69    ,  6'd32 };
13'd1950  : q  = {   8'd182   ,  6'd6  };
13'd1951  : q  = {   8'd116   ,  6'd34 };
13'd1952  : q  = {   8'd36    ,  6'd8  };
13'd1953  : q  = {   8'd182   ,  6'd9  };
13'd1954  : q  = {   8'd53    ,  6'd31 };
13'd1955  : q  = {   8'd33    ,  6'd6  };
13'd1956  : q  = {   8'd89    ,  6'd14 };
13'd1957  : q  = {   8'd103   ,  6'd25 };
13'd1958  : q  = {   8'd69    ,  6'd33 };
13'd1959  : q  = {   8'd182   ,  6'd15 };
13'd1960  : q  = {   8'd182   ,  6'd16 };
13'd1961  : q  = {   8'd182   ,  6'd17 };
13'd1962  : q  = {   8'd3     ,  6'd8  };
13'd1963  : q  = {   8'd69    ,  6'd34 };
13'd1964  : q  = {   8'd91    ,  6'd0  };
13'd1965  : q  = {   8'd182   ,  6'd21 };
13'd1966  : q  = {   8'd82    ,  6'd14 };
13'd1967  : q  = {   8'd182   ,  6'd23 };
13'd1968  : q  = {   8'd18    ,  6'd24 };
13'd1969  : q  = {   8'd182   ,  6'd25 };
13'd1970  : q  = {   8'd34    ,  6'd5  };
13'd1971  : q  = {   8'd182   ,  6'd27 };
13'd1972  : q  = {   8'd182   ,  6'd28 };
13'd1973  : q  = {   8'd182   ,  6'd29 };
13'd1974  : q  = {   8'd182   ,  6'd30 };
13'd1975  : q  = {   8'd7     ,  6'd35 };
13'd1976  : q  = {   8'd82    ,  6'd15 };
13'd1977  : q  = {   8'd12    ,  6'd4  };
13'd1978  : q  = {   8'd54    ,  6'd2  };
13'd1979  : q  = {   8'd111   ,  6'd33 };
13'd1980  : q  = {   8'd183   ,  6'd0  };
13'd1981  : q  = {   8'd183   ,  6'd1  };
13'd1982  : q  = {   8'd13    ,  6'd3  };
13'd1983  : q  = {   8'd183   ,  6'd3  };
13'd1984  : q  = {   8'd183   ,  6'd4  };
13'd1985  : q  = {   8'd183   ,  6'd5  };
13'd1986  : q  = {   8'd54    ,  6'd3  };
13'd1987  : q  = {   8'd104   ,  6'd17 };
13'd1988  : q  = {   8'd183   ,  6'd8  };
13'd1989  : q  = {   8'd183   ,  6'd9  };
13'd1990  : q  = {   8'd54    ,  6'd4  };
13'd1991  : q  = {   8'd183   ,  6'd11 };
13'd1992  : q  = {   8'd183   ,  6'd12 };
13'd1993  : q  = {   8'd183   ,  6'd13 };
13'd1994  : q  = {   8'd54    ,  6'd5  };
13'd1995  : q  = {   8'd183   ,  6'd15 };
13'd1996  : q  = {   8'd183   ,  6'd16 };
13'd1997  : q  = {   8'd109   ,  6'd31 };
13'd1998  : q  = {   8'd183   ,  6'd18 };
13'd1999  : q  = {   8'd69    ,  6'd35 };
13'd2000  : q  = {   8'd183   ,  6'd20 };
13'd2001  : q  = {   8'd54    ,  6'd6  };
13'd2002  : q  = {   8'd98    ,  6'd5  };
13'd2003  : q  = {   8'd183   ,  6'd23 };
13'd2004  : q  = {   8'd75    ,  6'd21 };
13'd2005  : q  = {   8'd183   ,  6'd25 };
13'd2006  : q  = {   8'd18    ,  6'd27 };
13'd2007  : q  = {   8'd112   ,  6'd4  };
13'd2008  : q  = {   8'd183   ,  6'd28 };
13'd2009  : q  = {   8'd183   ,  6'd29 };
13'd2010  : q  = {   8'd183   ,  6'd30 };
13'd2011  : q  = {   8'd18    ,  6'd28 };
13'd2012  : q  = {   8'd183   ,  6'd32 };
13'd2013  : q  = {   8'd115   ,  6'd6  };
13'd2014  : q  = {   8'd18    ,  6'd29 };
13'd2015  : q  = {   8'd183   ,  6'd35 };
13'd2016  : q  = {   8'd184   ,  6'd0  };
13'd2017  : q  = {   8'd184   ,  6'd1  };
13'd2018  : q  = {   8'd184   ,  6'd2  };
13'd2019  : q  = {   8'd112   ,  6'd28 };
13'd2020  : q  = {   8'd184   ,  6'd4  };
13'd2021  : q  = {   8'd184   ,  6'd5  };
13'd2022  : q  = {   8'd108   ,  6'd23 };
13'd2023  : q  = {   8'd23    ,  6'd25 };
13'd2024  : q  = {   8'd184   ,  6'd8  };
13'd2025  : q  = {   8'd184   ,  6'd9  };
13'd2026  : q  = {   8'd54    ,  6'd11 };
13'd2027  : q  = {   8'd184   ,  6'd11 };
13'd2028  : q  = {   8'd184   ,  6'd12 };
13'd2029  : q  = {   8'd184   ,  6'd13 };
13'd2030  : q  = {   8'd184   ,  6'd14 };
13'd2031  : q  = {   8'd23    ,  6'd3  };
13'd2032  : q  = {   8'd184   ,  6'd16 };
13'd2033  : q  = {   8'd184   ,  6'd17 };
13'd2034  : q  = {   8'd184   ,  6'd18 };
13'd2035  : q  = {   8'd117   ,  6'd8  };
13'd2036  : q  = {   8'd184   ,  6'd20 };
13'd2037  : q  = {   8'd123   ,  6'd28 };
13'd2038  : q  = {   8'd101   ,  6'd3  };
13'd2039  : q  = {   8'd184   ,  6'd23 };
13'd2040  : q  = {   8'd184   ,  6'd24 };
13'd2041  : q  = {   8'd184   ,  6'd25 };
13'd2042  : q  = {   8'd1     ,  6'd12 };
13'd2043  : q  = {   8'd75    ,  6'd23 };
13'd2044  : q  = {   8'd184   ,  6'd28 };
13'd2045  : q  = {   8'd184   ,  6'd29 };
13'd2046  : q  = {   8'd184   ,  6'd30 };
13'd2047  : q  = {   8'd54    ,  6'd12 };
13'd2048  : q  = {   8'd184   ,  6'd32 };
13'd2049  : q  = {   8'd102   ,  6'd11 };
13'd2050  : q  = {   8'd33    ,  6'd33 };
13'd2051  : q  = {   8'd127   ,  6'd6  };
13'd2052  : q  = {   8'd54    ,  6'd14 };
13'd2053  : q  = {   8'd185   ,  6'd1  };
13'd2054  : q  = {   8'd185   ,  6'd2  };
13'd2055  : q  = {   8'd87    ,  6'd4  };
13'd2056  : q  = {   8'd54    ,  6'd15 };
13'd2057  : q  = {   8'd70    ,  6'd1  };
13'd2058  : q  = {   8'd185   ,  6'd6  };
13'd2059  : q  = {   8'd185   ,  6'd7  };
13'd2060  : q  = {   8'd94    ,  6'd27 };
13'd2061  : q  = {   8'd185   ,  6'd9  };
13'd2062  : q  = {   8'd54    ,  6'd17 };
13'd2063  : q  = {   8'd87    ,  6'd5  };
13'd2064  : q  = {   8'd185   ,  6'd12 };
13'd2065  : q  = {   8'd54    ,  6'd18 };
13'd2066  : q  = {   8'd185   ,  6'd14 };
13'd2067  : q  = {   8'd185   ,  6'd15 };
13'd2068  : q  = {   8'd185   ,  6'd16 };
13'd2069  : q  = {   8'd25    ,  6'd18 };
13'd2070  : q  = {   8'd185   ,  6'd18 };
13'd2071  : q  = {   8'd3     ,  6'd1  };
13'd2072  : q  = {   8'd18    ,  6'd33 };
13'd2073  : q  = {   8'd75    ,  6'd25 };
13'd2074  : q  = {   8'd5     ,  6'd33 };
13'd2075  : q  = {   8'd54    ,  6'd21 };
13'd2076  : q  = {   8'd104   ,  6'd23 };
13'd2077  : q  = {   8'd185   ,  6'd25 };
13'd2078  : q  = {   8'd185   ,  6'd26 };
13'd2079  : q  = {   8'd185   ,  6'd27 };
13'd2080  : q  = {   8'd185   ,  6'd28 };
13'd2081  : q  = {   8'd87    ,  6'd6  };
13'd2082  : q  = {   8'd185   ,  6'd30 };
13'd2083  : q  = {   8'd18    ,  6'd35 };
13'd2084  : q  = {   8'd185   ,  6'd32 };
13'd2085  : q  = {   8'd30    ,  6'd18 };
13'd2086  : q  = {   8'd54    ,  6'd24 };
13'd2087  : q  = {   8'd185   ,  6'd35 };
13'd2088  : q  = {   8'd108   ,  6'd15 };
13'd2089  : q  = {   8'd80    ,  6'd15 };
13'd2090  : q  = {   8'd24    ,  6'd29 };
13'd2091  : q  = {   8'd186   ,  6'd3  };
13'd2092  : q  = {   8'd186   ,  6'd4  };
13'd2093  : q  = {   8'd118   ,  6'd30 };
13'd2094  : q  = {   8'd29    ,  6'd7  };
13'd2095  : q  = {   8'd186   ,  6'd7  };
13'd2096  : q  = {   8'd54    ,  6'd27 };
13'd2097  : q  = {   8'd186   ,  6'd9  };
13'd2098  : q  = {   8'd38    ,  6'd19 };
13'd2099  : q  = {   8'd89    ,  6'd20 };
13'd2100  : q  = {   8'd186   ,  6'd12 };
13'd2101  : q  = {   8'd186   ,  6'd13 };
13'd2102  : q  = {   8'd125   ,  6'd23 };
13'd2103  : q  = {   8'd35    ,  6'd8  };
13'd2104  : q  = {   8'd186   ,  6'd16 };
13'd2105  : q  = {   8'd186   ,  6'd17 };
13'd2106  : q  = {   8'd101   ,  6'd4  };
13'd2107  : q  = {   8'd70    ,  6'd2  };
13'd2108  : q  = {   8'd54    ,  6'd29 };
13'd2109  : q  = {   8'd186   ,  6'd21 };
13'd2110  : q  = {   8'd35    ,  6'd9  };
13'd2111  : q  = {   8'd186   ,  6'd23 };
13'd2112  : q  = {   8'd186   ,  6'd24 };
13'd2113  : q  = {   8'd186   ,  6'd25 };
13'd2114  : q  = {   8'd186   ,  6'd26 };
13'd2115  : q  = {   8'd75    ,  6'd29 };
13'd2116  : q  = {   8'd70    ,  6'd3  };
13'd2117  : q  = {   8'd186   ,  6'd29 };
13'd2118  : q  = {   8'd5     ,  6'd8  };
13'd2119  : q  = {   8'd19    ,  6'd1  };
13'd2120  : q  = {   8'd9     ,  6'd28 };
13'd2121  : q  = {   8'd91    ,  6'd4  };
13'd2122  : q  = {   8'd186   ,  6'd34 };
13'd2123  : q  = {   8'd77    ,  6'd31 };
13'd2124  : q  = {   8'd8     ,  6'd2  };
13'd2125  : q  = {   8'd187   ,  6'd1  };
13'd2126  : q  = {   8'd54    ,  6'd34 };
13'd2127  : q  = {   8'd87    ,  6'd9  };
13'd2128  : q  = {   8'd187   ,  6'd4  };
13'd2129  : q  = {   8'd187   ,  6'd5  };
13'd2130  : q  = {   8'd29    ,  6'd8  };
13'd2131  : q  = {   8'd103   ,  6'd29 };
13'd2132  : q  = {   8'd187   ,  6'd8  };
13'd2133  : q  = {   8'd187   ,  6'd9  };
13'd2134  : q  = {   8'd187   ,  6'd10 };
13'd2135  : q  = {   8'd5     ,  6'd3  };
13'd2136  : q  = {   8'd187   ,  6'd12 };
13'd2137  : q  = {   8'd187   ,  6'd13 };
13'd2138  : q  = {   8'd96    ,  6'd30 };
13'd2139  : q  = {   8'd187   ,  6'd15 };
13'd2140  : q  = {   8'd187   ,  6'd16 };
13'd2141  : q  = {   8'd75    ,  6'd30 };
13'd2142  : q  = {   8'd187   ,  6'd18 };
13'd2143  : q  = {   8'd117   ,  6'd29 };
13'd2144  : q  = {   8'd19    ,  6'd5  };
13'd2145  : q  = {   8'd14    ,  6'd23 };
13'd2146  : q  = {   8'd19    ,  6'd6  };
13'd2147  : q  = {   8'd187   ,  6'd23 };
13'd2148  : q  = {   8'd187   ,  6'd24 };
13'd2149  : q  = {   8'd187   ,  6'd25 };
13'd2150  : q  = {   8'd114   ,  6'd21 };
13'd2151  : q  = {   8'd75    ,  6'd31 };
13'd2152  : q  = {   8'd187   ,  6'd28 };
13'd2153  : q  = {   8'd187   ,  6'd29 };
13'd2154  : q  = {   8'd187   ,  6'd30 };
13'd2155  : q  = {   8'd34    ,  6'd33 };
13'd2156  : q  = {   8'd55    ,  6'd5  };
13'd2157  : q  = {   8'd112   ,  6'd30 };
13'd2158  : q  = {   8'd187   ,  6'd34 };
13'd2159  : q  = {   8'd187   ,  6'd35 };
13'd2160  : q  = {   8'd55    ,  6'd6  };
13'd2161  : q  = {   8'd188   ,  6'd1  };
13'd2162  : q  = {   8'd55    ,  6'd7  };
13'd2163  : q  = {   8'd8     ,  6'd3  };
13'd2164  : q  = {   8'd188   ,  6'd4  };
13'd2165  : q  = {   8'd102   ,  6'd12 };
13'd2166  : q  = {   8'd188   ,  6'd6  };
13'd2167  : q  = {   8'd98    ,  6'd6  };
13'd2168  : q  = {   8'd120   ,  6'd15 };
13'd2169  : q  = {   8'd188   ,  6'd9  };
13'd2170  : q  = {   8'd188   ,  6'd10 };
13'd2171  : q  = {   8'd3     ,  6'd4  };
13'd2172  : q  = {   8'd188   ,  6'd12 };
13'd2173  : q  = {   8'd188   ,  6'd13 };
13'd2174  : q  = {   8'd114   ,  6'd23 };
13'd2175  : q  = {   8'd188   ,  6'd15 };
13'd2176  : q  = {   8'd188   ,  6'd16 };
13'd2177  : q  = {   8'd75    ,  6'd32 };
13'd2178  : q  = {   8'd188   ,  6'd18 };
13'd2179  : q  = {   8'd55    ,  6'd11 };
13'd2180  : q  = {   8'd55    ,  6'd12 };
13'd2181  : q  = {   8'd4     ,  6'd4  };
13'd2182  : q  = {   8'd55    ,  6'd14 };
13'd2183  : q  = {   8'd188   ,  6'd23 };
13'd2184  : q  = {   8'd55    ,  6'd15 };
13'd2185  : q  = {   8'd188   ,  6'd25 };
13'd2186  : q  = {   8'd29    ,  6'd9  };
13'd2187  : q  = {   8'd75    ,  6'd33 };
13'd2188  : q  = {   8'd188   ,  6'd28 };
13'd2189  : q  = {   8'd188   ,  6'd29 };
13'd2190  : q  = {   8'd188   ,  6'd30 };
13'd2191  : q  = {   8'd8     ,  6'd5  };
13'd2192  : q  = {   8'd121   ,  6'd31 };
13'd2193  : q  = {   8'd24    ,  6'd27 };
13'd2194  : q  = {   8'd188   ,  6'd34 };
13'd2195  : q  = {   8'd188   ,  6'd35 };
13'd2196  : q  = {   8'd55    ,  6'd18 };
13'd2197  : q  = {   8'd85    ,  6'd4  };
13'd2198  : q  = {   8'd70    ,  6'd6  };
13'd2199  : q  = {   8'd127   ,  6'd5  };
13'd2200  : q  = {   8'd189   ,  6'd4  };
13'd2201  : q  = {   8'd189   ,  6'd5  };
13'd2202  : q  = {   8'd89    ,  6'd26 };
13'd2203  : q  = {   8'd1     ,  6'd7  };
13'd2204  : q  = {   8'd113   ,  6'd30 };
13'd2205  : q  = {   8'd24    ,  6'd32 };
13'd2206  : q  = {   8'd116   ,  6'd6  };
13'd2207  : q  = {   8'd26    ,  6'd18 };
13'd2208  : q  = {   8'd36    ,  6'd33 };
13'd2209  : q  = {   8'd189   ,  6'd13 };
13'd2210  : q  = {   8'd55    ,  6'd21 };
13'd2211  : q  = {   8'd124   ,  6'd22 };
13'd2212  : q  = {   8'd89    ,  6'd11 };
13'd2213  : q  = {   8'd94    ,  6'd30 };
13'd2214  : q  = {   8'd189   ,  6'd18 };
13'd2215  : q  = {   8'd91    ,  6'd6  };
13'd2216  : q  = {   8'd55    ,  6'd22 };
13'd2217  : q  = {   8'd8     ,  6'd7  };
13'd2218  : q  = {   8'd55    ,  6'd24 };
13'd2219  : q  = {   8'd122   ,  6'd35 };
13'd2220  : q  = {   8'd189   ,  6'd24 };
13'd2221  : q  = {   8'd106   ,  6'd2  };
13'd2222  : q  = {   8'd97    ,  6'd2  };
13'd2223  : q  = {   8'd10    ,  6'd15 };
13'd2224  : q  = {   8'd189   ,  6'd28 };
13'd2225  : q  = {   8'd37    ,  6'd33 };
13'd2226  : q  = {   8'd85    ,  6'd3  };
13'd2227  : q  = {   8'd55    ,  6'd25 };
13'd2228  : q  = {   8'd19    ,  6'd15 };
13'd2229  : q  = {   8'd93    ,  6'd25 };
13'd2230  : q  = {   8'd93    ,  6'd26 };
13'd2231  : q  = {   8'd36    ,  6'd30 };
13'd2232  : q  = {   8'd109   ,  6'd29 };
13'd2233  : q  = {   8'd190   ,  6'd1  };
13'd2234  : q  = {   8'd70    ,  6'd8  };
13'd2235  : q  = {   8'd77    ,  6'd29 };
13'd2236  : q  = {   8'd190   ,  6'd4  };
13'd2237  : q  = {   8'd70    ,  6'd9  };
13'd2238  : q  = {   8'd126   ,  6'd9  };
13'd2239  : q  = {   8'd55    ,  6'd28 };
13'd2240  : q  = {   8'd67    ,  6'd31 };
13'd2241  : q  = {   8'd190   ,  6'd9  };
13'd2242  : q  = {   8'd38    ,  6'd31 };
13'd2243  : q  = {   8'd23    ,  6'd27 };
13'd2244  : q  = {   8'd119   ,  6'd1  };
13'd2245  : q  = {   8'd112   ,  6'd27 };
13'd2246  : q  = {   8'd117   ,  6'd6  };
13'd2247  : q  = {   8'd190   ,  6'd15 };
13'd2248  : q  = {   8'd190   ,  6'd16 };
13'd2249  : q  = {   8'd190   ,  6'd17 };
13'd2250  : q  = {   8'd98    ,  6'd33 };
13'd2251  : q  = {   8'd8     ,  6'd8  };
13'd2252  : q  = {   8'd190   ,  6'd20 };
13'd2253  : q  = {   8'd190   ,  6'd21 };
13'd2254  : q  = {   8'd78    ,  6'd23 };
13'd2255  : q  = {   8'd36    ,  6'd0  };
13'd2256  : q  = {   8'd19    ,  6'd18 };
13'd2257  : q  = {   8'd97    ,  6'd24 };
13'd2258  : q  = {   8'd91    ,  6'd7  };
13'd2259  : q  = {   8'd75    ,  6'd35 };
13'd2260  : q  = {   8'd190   ,  6'd28 };
13'd2261  : q  = {   8'd107   ,  6'd14 };
13'd2262  : q  = {   8'd104   ,  6'd30 };
13'd2263  : q  = {   8'd55    ,  6'd34 };
13'd2264  : q  = {   8'd190   ,  6'd32 };
13'd2265  : q  = {   8'd89    ,  6'd31 };
13'd2266  : q  = {   8'd4     ,  6'd5  };
13'd2267  : q  = {   8'd96    ,  6'd28 };
13'd2268  : q  = {   8'd4     ,  6'd6  };
13'd2269  : q  = {   8'd191   ,  6'd1  };
13'd2270  : q  = {   8'd8     ,  6'd11 };
13'd2271  : q  = {   8'd122   ,  6'd18 };
13'd2272  : q  = {   8'd191   ,  6'd4  };
13'd2273  : q  = {   8'd79    ,  6'd23 };
13'd2274  : q  = {   8'd68    ,  6'd15 };
13'd2275  : q  = {   8'd87    ,  6'd13 };
13'd2276  : q  = {   8'd107   ,  6'd15 };
13'd2277  : q  = {   8'd191   ,  6'd9  };
13'd2278  : q  = {   8'd125   ,  6'd12 };
13'd2279  : q  = {   8'd70    ,  6'd12 };
13'd2280  : q  = {   8'd191   ,  6'd12 };
13'd2281  : q  = {   8'd82    ,  6'd17 };
13'd2282  : q  = {   8'd191   ,  6'd14 };
13'd2283  : q  = {   8'd191   ,  6'd15 };
13'd2284  : q  = {   8'd191   ,  6'd16 };
13'd2285  : q  = {   8'd191   ,  6'd17 };
13'd2286  : q  = {   8'd101   ,  6'd5  };
13'd2287  : q  = {   8'd67    ,  6'd12 };
13'd2288  : q  = {   8'd56    ,  6'd3  };
13'd2289  : q  = {   8'd191   ,  6'd21 };
13'd2290  : q  = {   8'd56    ,  6'd4  };
13'd2291  : q  = {   8'd191   ,  6'd23 };
13'd2292  : q  = {   8'd56    ,  6'd5  };
13'd2293  : q  = {   8'd80    ,  6'd17 };
13'd2294  : q  = {   8'd82    ,  6'd18 };
13'd2295  : q  = {   8'd82    ,  6'd19 };
13'd2296  : q  = {   8'd37    ,  6'd16 };
13'd2297  : q  = {   8'd191   ,  6'd29 };
13'd2298  : q  = {   8'd191   ,  6'd30 };
13'd2299  : q  = {   8'd56    ,  6'd6  };
13'd2300  : q  = {   8'd56    ,  6'd7  };
13'd2301  : q  = {   8'd191   ,  6'd33 };
13'd2302  : q  = {   8'd191   ,  6'd34 };
13'd2303  : q  = {   8'd112   ,  6'd23 };
13'd2304  : q  = {   8'd56    ,  6'd8  };
13'd2305  : q  = {   8'd192   ,  6'd1  };
13'd2306  : q  = {   8'd78    ,  6'd24 };
13'd2307  : q  = {   8'd39    ,  6'd5  };
13'd2308  : q  = {   8'd192   ,  6'd4  };
13'd2309  : q  = {   8'd5     ,  6'd5  };
13'd2310  : q  = {   8'd192   ,  6'd6  };
13'd2311  : q  = {   8'd23    ,  6'd28 };
13'd2312  : q  = {   8'd8     ,  6'd12 };
13'd2313  : q  = {   8'd192   ,  6'd9  };
13'd2314  : q  = {   8'd39    ,  6'd8  };
13'd2315  : q  = {   8'd23    ,  6'd29 };
13'd2316  : q  = {   8'd192   ,  6'd12 };
13'd2317  : q  = {   8'd82    ,  6'd20 };
13'd2318  : q  = {   8'd192   ,  6'd14 };
13'd2319  : q  = {   8'd192   ,  6'd15 };
13'd2320  : q  = {   8'd192   ,  6'd16 };
13'd2321  : q  = {   8'd56    ,  6'd11 };
13'd2322  : q  = {   8'd192   ,  6'd18 };
13'd2323  : q  = {   8'd109   ,  6'd4  };
13'd2324  : q  = {   8'd56    ,  6'd12 };
13'd2325  : q  = {   8'd192   ,  6'd21 };
13'd2326  : q  = {   8'd19    ,  6'd24 };
13'd2327  : q  = {   8'd192   ,  6'd23 };
13'd2328  : q  = {   8'd56    ,  6'd14 };
13'd2329  : q  = {   8'd192   ,  6'd25 };
13'd2330  : q  = {   8'd31    ,  6'd7  };
13'd2331  : q  = {   8'd104   ,  6'd2  };
13'd2332  : q  = {   8'd192   ,  6'd28 };
13'd2333  : q  = {   8'd192   ,  6'd29 };
13'd2334  : q  = {   8'd192   ,  6'd30 };
13'd2335  : q  = {   8'd56    ,  6'd15 };
13'd2336  : q  = {   8'd192   ,  6'd32 };
13'd2337  : q  = {   8'd2     ,  6'd3  };
13'd2338  : q  = {   8'd192   ,  6'd34 };
13'd2339  : q  = {   8'd192   ,  6'd35 };
13'd2340  : q  = {   8'd19    ,  6'd25 };
13'd2341  : q  = {   8'd193   ,  6'd1  };
13'd2342  : q  = {   8'd70    ,  6'd18 };
13'd2343  : q  = {   8'd79    ,  6'd25 };
13'd2344  : q  = {   8'd193   ,  6'd4  };
13'd2345  : q  = {   8'd104   ,  6'd25 };
13'd2346  : q  = {   8'd193   ,  6'd6  };
13'd2347  : q  = {   8'd2     ,  6'd14 };
13'd2348  : q  = {   8'd114   ,  6'd10 };
13'd2349  : q  = {   8'd193   ,  6'd9  };
13'd2350  : q  = {   8'd56    ,  6'd18 };
13'd2351  : q  = {   8'd27    ,  6'd23 };
13'd2352  : q  = {   8'd193   ,  6'd12 };
13'd2353  : q  = {   8'd193   ,  6'd13 };
13'd2354  : q  = {   8'd193   ,  6'd14 };
13'd2355  : q  = {   8'd193   ,  6'd15 };
13'd2356  : q  = {   8'd193   ,  6'd16 };
13'd2357  : q  = {   8'd56    ,  6'd19 };
13'd2358  : q  = {   8'd193   ,  6'd18 };
13'd2359  : q  = {   8'd9     ,  6'd29 };
13'd2360  : q  = {   8'd19    ,  6'd27 };
13'd2361  : q  = {   8'd193   ,  6'd21 };
13'd2362  : q  = {   8'd193   ,  6'd22 };
13'd2363  : q  = {   8'd56    ,  6'd21 };
13'd2364  : q  = {   8'd109   ,  6'd17 };
13'd2365  : q  = {   8'd193   ,  6'd25 };
13'd2366  : q  = {   8'd19    ,  6'd28 };
13'd2367  : q  = {   8'd76    ,  6'd1  };
13'd2368  : q  = {   8'd193   ,  6'd28 };
13'd2369  : q  = {   8'd193   ,  6'd29 };
13'd2370  : q  = {   8'd193   ,  6'd30 };
13'd2371  : q  = {   8'd56    ,  6'd24 };
13'd2372  : q  = {   8'd193   ,  6'd32 };
13'd2373  : q  = {   8'd193   ,  6'd33 };
13'd2374  : q  = {   8'd193   ,  6'd34 };
13'd2375  : q  = {   8'd193   ,  6'd35 };
13'd2376  : q  = {   8'd56    ,  6'd25 };
13'd2377  : q  = {   8'd194   ,  6'd1  };
13'd2378  : q  = {   8'd194   ,  6'd2  };
13'd2379  : q  = {   8'd91    ,  6'd9  };
13'd2380  : q  = {   8'd194   ,  6'd4  };
13'd2381  : q  = {   8'd194   ,  6'd5  };
13'd2382  : q  = {   8'd194   ,  6'd6  };
13'd2383  : q  = {   8'd19    ,  6'd29 };
13'd2384  : q  = {   8'd107   ,  6'd4  };
13'd2385  : q  = {   8'd194   ,  6'd9  };
13'd2386  : q  = {   8'd112   ,  6'd31 };
13'd2387  : q  = {   8'd27    ,  6'd24 };
13'd2388  : q  = {   8'd108   ,  6'd7  };
13'd2389  : q  = {   8'd23    ,  6'd32 };
13'd2390  : q  = {   8'd194   ,  6'd14 };
13'd2391  : q  = {   8'd85    ,  6'd15 };
13'd2392  : q  = {   8'd194   ,  6'd16 };
13'd2393  : q  = {   8'd194   ,  6'd17 };
13'd2394  : q  = {   8'd14    ,  6'd22 };
13'd2395  : q  = {   8'd70    ,  6'd21 };
13'd2396  : q  = {   8'd56    ,  6'd28 };
13'd2397  : q  = {   8'd194   ,  6'd21 };
13'd2398  : q  = {   8'd194   ,  6'd22 };
13'd2399  : q  = {   8'd56    ,  6'd29 };
13'd2400  : q  = {   8'd56    ,  6'd30 };
13'd2401  : q  = {   8'd28    ,  6'd9  };
13'd2402  : q  = {   8'd56    ,  6'd31 };
13'd2403  : q  = {   8'd10    ,  6'd17 };
13'd2404  : q  = {   8'd103   ,  6'd8  };
13'd2405  : q  = {   8'd34    ,  6'd4  };
13'd2406  : q  = {   8'd68    ,  6'd2  };
13'd2407  : q  = {   8'd56    ,  6'd32 };
13'd2408  : q  = {   8'd33    ,  6'd30 };
13'd2409  : q  = {   8'd0     ,  6'd29 };
13'd2410  : q  = {   8'd4     ,  6'd8  };
13'd2411  : q  = {   8'd87    ,  6'd14 };
13'd2412  : q  = {   8'd104   ,  6'd5  };
13'd2413  : q  = {   8'd195   ,  6'd1  };
13'd2414  : q  = {   8'd195   ,  6'd2  };
13'd2415  : q  = {   8'd123   ,  6'd6  };
13'd2416  : q  = {   8'd110   ,  6'd27 };
13'd2417  : q  = {   8'd195   ,  6'd5  };
13'd2418  : q  = {   8'd195   ,  6'd6  };
13'd2419  : q  = {   8'd37    ,  6'd31 };
13'd2420  : q  = {   8'd195   ,  6'd8  };
13'd2421  : q  = {   8'd195   ,  6'd9  };
13'd2422  : q  = {   8'd19    ,  6'd33 };
13'd2423  : q  = {   8'd195   ,  6'd11 };
13'd2424  : q  = {   8'd3     ,  6'd15 };
13'd2425  : q  = {   8'd70    ,  6'd22 };
13'd2426  : q  = {   8'd96    ,  6'd12 };
13'd2427  : q  = {   8'd195   ,  6'd15 };
13'd2428  : q  = {   8'd195   ,  6'd16 };
13'd2429  : q  = {   8'd87    ,  6'd15 };
13'd2430  : q  = {   8'd195   ,  6'd18 };
13'd2431  : q  = {   8'd57    ,  6'd1  };
13'd2432  : q  = {   8'd99    ,  6'd2  };
13'd2433  : q  = {   8'd195   ,  6'd21 };
13'd2434  : q  = {   8'd195   ,  6'd22 };
13'd2435  : q  = {   8'd57    ,  6'd3  };
13'd2436  : q  = {   8'd57    ,  6'd4  };
13'd2437  : q  = {   8'd195   ,  6'd25 };
13'd2438  : q  = {   8'd121   ,  6'd12 };
13'd2439  : q  = {   8'd76    ,  6'd3  };
13'd2440  : q  = {   8'd195   ,  6'd28 };
13'd2441  : q  = {   8'd114   ,  6'd28 };
13'd2442  : q  = {   8'd103   ,  6'd21 };
13'd2443  : q  = {   8'd76    ,  6'd4  };
13'd2444  : q  = {   8'd195   ,  6'd32 };
13'd2445  : q  = {   8'd98    ,  6'd24 };
13'd2446  : q  = {   8'd57    ,  6'd7  };
13'd2447  : q  = {   8'd87    ,  6'd16 };
13'd2448  : q  = {   8'd93    ,  6'd7  };
13'd2449  : q  = {   8'd196   ,  6'd1  };
13'd2450  : q  = {   8'd2     ,  6'd35 };
13'd2451  : q  = {   8'd79    ,  6'd28 };
13'd2452  : q  = {   8'd196   ,  6'd4  };
13'd2453  : q  = {   8'd80    ,  6'd9  };
13'd2454  : q  = {   8'd196   ,  6'd6  };
13'd2455  : q  = {   8'd76    ,  6'd5  };
13'd2456  : q  = {   8'd196   ,  6'd8  };
13'd2457  : q  = {   8'd196   ,  6'd9  };
13'd2458  : q  = {   8'd19    ,  6'd35 };
13'd2459  : q  = {   8'd76    ,  6'd6  };
13'd2460  : q  = {   8'd196   ,  6'd12 };
13'd2461  : q  = {   8'd127   ,  6'd12 };
13'd2462  : q  = {   8'd196   ,  6'd14 };
13'd2463  : q  = {   8'd196   ,  6'd15 };
13'd2464  : q  = {   8'd196   ,  6'd16 };
13'd2465  : q  = {   8'd196   ,  6'd17 };
13'd2466  : q  = {   8'd196   ,  6'd18 };
13'd2467  : q  = {   8'd23    ,  6'd33 };
13'd2468  : q  = {   8'd196   ,  6'd20 };
13'd2469  : q  = {   8'd196   ,  6'd21 };
13'd2470  : q  = {   8'd196   ,  6'd22 };
13'd2471  : q  = {   8'd70    ,  6'd25 };
13'd2472  : q  = {   8'd57    ,  6'd11 };
13'd2473  : q  = {   8'd196   ,  6'd25 };
13'd2474  : q  = {   8'd98    ,  6'd10 };
13'd2475  : q  = {   8'd196   ,  6'd27 };
13'd2476  : q  = {   8'd196   ,  6'd28 };
13'd2477  : q  = {   8'd103   ,  6'd30 };
13'd2478  : q  = {   8'd196   ,  6'd30 };
13'd2479  : q  = {   8'd196   ,  6'd31 };
13'd2480  : q  = {   8'd196   ,  6'd32 };
13'd2481  : q  = {   8'd196   ,  6'd33 };
13'd2482  : q  = {   8'd8     ,  6'd15 };
13'd2483  : q  = {   8'd114   ,  6'd6  };
13'd2484  : q  = {   8'd68    ,  6'd27 };
13'd2485  : q  = {   8'd197   ,  6'd1  };
13'd2486  : q  = {   8'd115   ,  6'd33 };
13'd2487  : q  = {   8'd197   ,  6'd3  };
13'd2488  : q  = {   8'd197   ,  6'd4  };
13'd2489  : q  = {   8'd30    ,  6'd35 };
13'd2490  : q  = {   8'd197   ,  6'd6  };
13'd2491  : q  = {   8'd57    ,  6'd15 };
13'd2492  : q  = {   8'd197   ,  6'd8  };
13'd2493  : q  = {   8'd197   ,  6'd9  };
13'd2494  : q  = {   8'd57    ,  6'd16 };
13'd2495  : q  = {   8'd20    ,  6'd1  };
13'd2496  : q  = {   8'd197   ,  6'd12 };
13'd2497  : q  = {   8'd197   ,  6'd13 };
13'd2498  : q  = {   8'd80    ,  6'd26 };
13'd2499  : q  = {   8'd87    ,  6'd19 };
13'd2500  : q  = {   8'd10    ,  6'd18 };
13'd2501  : q  = {   8'd57    ,  6'd18 };
13'd2502  : q  = {   8'd197   ,  6'd18 };
13'd2503  : q  = {   8'd70    ,  6'd26 };
13'd2504  : q  = {   8'd197   ,  6'd20 };
13'd2505  : q  = {   8'd197   ,  6'd21 };
13'd2506  : q  = {   8'd197   ,  6'd22 };
13'd2507  : q  = {   8'd31    ,  6'd26 };
13'd2508  : q  = {   8'd102   ,  6'd14 };
13'd2509  : q  = {   8'd197   ,  6'd25 };
13'd2510  : q  = {   8'd57    ,  6'd21 };
13'd2511  : q  = {   8'd27    ,  6'd25 };
13'd2512  : q  = {   8'd197   ,  6'd28 };
13'd2513  : q  = {   8'd197   ,  6'd29 };
13'd2514  : q  = {   8'd197   ,  6'd30 };
13'd2515  : q  = {   8'd197   ,  6'd31 };
13'd2516  : q  = {   8'd24    ,  6'd35 };
13'd2517  : q  = {   8'd197   ,  6'd33 };
13'd2518  : q  = {   8'd197   ,  6'd34 };
13'd2519  : q  = {   8'd101   ,  6'd6  };
13'd2520  : q  = {   8'd57    ,  6'd22 };
13'd2521  : q  = {   8'd198   ,  6'd1  };
13'd2522  : q  = {   8'd23    ,  6'd34 };
13'd2523  : q  = {   8'd117   ,  6'd23 };
13'd2524  : q  = {   8'd198   ,  6'd4  };
13'd2525  : q  = {   8'd198   ,  6'd5  };
13'd2526  : q  = {   8'd198   ,  6'd6  };
13'd2527  : q  = {   8'd70    ,  6'd29 };
13'd2528  : q  = {   8'd198   ,  6'd8  };
13'd2529  : q  = {   8'd198   ,  6'd9  };
13'd2530  : q  = {   8'd87    ,  6'd20 };
13'd2531  : q  = {   8'd36    ,  6'd1  };
13'd2532  : q  = {   8'd198   ,  6'd12 };
13'd2533  : q  = {   8'd5     ,  6'd15 };
13'd2534  : q  = {   8'd198   ,  6'd14 };
13'd2535  : q  = {   8'd101   ,  6'd34 };
13'd2536  : q  = {   8'd126   ,  6'd14 };
13'd2537  : q  = {   8'd20    ,  6'd3  };
13'd2538  : q  = {   8'd198   ,  6'd18 };
13'd2539  : q  = {   8'd126   ,  6'd16 };
13'd2540  : q  = {   8'd84    ,  6'd4  };
13'd2541  : q  = {   8'd198   ,  6'd21 };
13'd2542  : q  = {   8'd198   ,  6'd22 };
13'd2543  : q  = {   8'd4     ,  6'd33 };
13'd2544  : q  = {   8'd57    ,  6'd29 };
13'd2545  : q  = {   8'd198   ,  6'd25 };
13'd2546  : q  = {   8'd35    ,  6'd33 };
13'd2547  : q  = {   8'd38    ,  6'd35 };
13'd2548  : q  = {   8'd198   ,  6'd28 };
13'd2549  : q  = {   8'd198   ,  6'd29 };
13'd2550  : q  = {   8'd40    ,  6'd6  };
13'd2551  : q  = {   8'd122   ,  6'd6  };
13'd2552  : q  = {   8'd198   ,  6'd32 };
13'd2553  : q  = {   8'd198   ,  6'd33 };
13'd2554  : q  = {   8'd198   ,  6'd34 };
13'd2555  : q  = {   8'd198   ,  6'd35 };
13'd2556  : q  = {   8'd57    ,  6'd31 };
13'd2557  : q  = {   8'd199   ,  6'd1  };
13'd2558  : q  = {   8'd123   ,  6'd3  };
13'd2559  : q  = {   8'd29    ,  6'd13 };
13'd2560  : q  = {   8'd199   ,  6'd4  };
13'd2561  : q  = {   8'd93    ,  6'd30 };
13'd2562  : q  = {   8'd199   ,  6'd6  };
13'd2563  : q  = {   8'd57    ,  6'd33 };
13'd2564  : q  = {   8'd13    ,  6'd15 };
13'd2565  : q  = {   8'd199   ,  6'd9  };
13'd2566  : q  = {   8'd57    ,  6'd34 };
13'd2567  : q  = {   8'd20    ,  6'd4  };
13'd2568  : q  = {   8'd199   ,  6'd12 };
13'd2569  : q  = {   8'd88    ,  6'd32 };
13'd2570  : q  = {   8'd101   ,  6'd25 };
13'd2571  : q  = {   8'd20    ,  6'd5  };
13'd2572  : q  = {   8'd25    ,  6'd25 };
13'd2573  : q  = {   8'd58    ,  6'd1  };
13'd2574  : q  = {   8'd199   ,  6'd18 };
13'd2575  : q  = {   8'd70    ,  6'd30 };
13'd2576  : q  = {   8'd82    ,  6'd26 };
13'd2577  : q  = {   8'd199   ,  6'd21 };
13'd2578  : q  = {   8'd199   ,  6'd22 };
13'd2579  : q  = {   8'd199   ,  6'd23 };
13'd2580  : q  = {   8'd58    ,  6'd3  };
13'd2581  : q  = {   8'd199   ,  6'd25 };
13'd2582  : q  = {   8'd58    ,  6'd4  };
13'd2583  : q  = {   8'd106   ,  6'd1  };
13'd2584  : q  = {   8'd199   ,  6'd28 };
13'd2585  : q  = {   8'd199   ,  6'd29 };
13'd2586  : q  = {   8'd199   ,  6'd30 };
13'd2587  : q  = {   8'd58    ,  6'd5  };
13'd2588  : q  = {   8'd32    ,  6'd1  };
13'd2589  : q  = {   8'd73    ,  6'd6  };
13'd2590  : q  = {   8'd199   ,  6'd34 };
13'd2591  : q  = {   8'd199   ,  6'd35 };
13'd2592  : q  = {   8'd58    ,  6'd6  };
13'd2593  : q  = {   8'd200   ,  6'd1  };
13'd2594  : q  = {   8'd58    ,  6'd7  };
13'd2595  : q  = {   8'd99    ,  6'd17 };
13'd2596  : q  = {   8'd58    ,  6'd8  };
13'd2597  : q  = {   8'd20    ,  6'd6  };
13'd2598  : q  = {   8'd200   ,  6'd6  };
13'd2599  : q  = {   8'd93    ,  6'd31 };
13'd2600  : q  = {   8'd200   ,  6'd8  };
13'd2601  : q  = {   8'd34    ,  6'd31 };
13'd2602  : q  = {   8'd9     ,  6'd18 };
13'd2603  : q  = {   8'd58    ,  6'd11 };
13'd2604  : q  = {   8'd200   ,  6'd12 };
13'd2605  : q  = {   8'd102   ,  6'd15 };
13'd2606  : q  = {   8'd77    ,  6'd24 };
13'd2607  : q  = {   8'd92    ,  6'd26 };
13'd2608  : q  = {   8'd200   ,  6'd16 };
13'd2609  : q  = {   8'd58    ,  6'd13 };
13'd2610  : q  = {   8'd200   ,  6'd18 };
13'd2611  : q  = {   8'd107   ,  6'd29 };
13'd2612  : q  = {   8'd58    ,  6'd15 };
13'd2613  : q  = {   8'd200   ,  6'd21 };
13'd2614  : q  = {   8'd82    ,  6'd27 };
13'd2615  : q  = {   8'd200   ,  6'd23 };
13'd2616  : q  = {   8'd70    ,  6'd31 };
13'd2617  : q  = {   8'd200   ,  6'd25 };
13'd2618  : q  = {   8'd92    ,  6'd27 };
13'd2619  : q  = {   8'd96    ,  6'd14 };
13'd2620  : q  = {   8'd200   ,  6'd28 };
13'd2621  : q  = {   8'd200   ,  6'd29 };
13'd2622  : q  = {   8'd200   ,  6'd30 };
13'd2623  : q  = {   8'd20    ,  6'd9  };
13'd2624  : q  = {   8'd87    ,  6'd23 };
13'd2625  : q  = {   8'd200   ,  6'd33 };
13'd2626  : q  = {   8'd200   ,  6'd34 };
13'd2627  : q  = {   8'd200   ,  6'd35 };
13'd2628  : q  = {   8'd58    ,  6'd18 };
13'd2629  : q  = {   8'd201   ,  6'd1  };
13'd2630  : q  = {   8'd95    ,  6'd13 };
13'd2631  : q  = {   8'd79    ,  6'd29 };
13'd2632  : q  = {   8'd70    ,  6'd32 };
13'd2633  : q  = {   8'd8     ,  6'd17 };
13'd2634  : q  = {   8'd201   ,  6'd6  };
13'd2635  : q  = {   8'd103   ,  6'd1  };
13'd2636  : q  = {   8'd201   ,  6'd8  };
13'd2637  : q  = {   8'd201   ,  6'd9  };
13'd2638  : q  = {   8'd58    ,  6'd21 };
13'd2639  : q  = {   8'd76    ,  6'd15 };
13'd2640  : q  = {   8'd201   ,  6'd12 };
13'd2641  : q  = {   8'd24    ,  6'd33 };
13'd2642  : q  = {   8'd201   ,  6'd14 };
13'd2643  : q  = {   8'd201   ,  6'd15 };
13'd2644  : q  = {   8'd201   ,  6'd16 };
13'd2645  : q  = {   8'd93    ,  6'd32 };
13'd2646  : q  = {   8'd36    ,  6'd20 };
13'd2647  : q  = {   8'd94    ,  6'd17 };
13'd2648  : q  = {   8'd58    ,  6'd23 };
13'd2649  : q  = {   8'd201   ,  6'd21 };
13'd2650  : q  = {   8'd201   ,  6'd22 };
13'd2651  : q  = {   8'd58    ,  6'd24 };
13'd2652  : q  = {   8'd201   ,  6'd24 };
13'd2653  : q  = {   8'd201   ,  6'd25 };
13'd2654  : q  = {   8'd58    ,  6'd25 };
13'd2655  : q  = {   8'd201   ,  6'd27 };
13'd2656  : q  = {   8'd201   ,  6'd28 };
13'd2657  : q  = {   8'd201   ,  6'd29 };
13'd2658  : q  = {   8'd201   ,  6'd30 };
13'd2659  : q  = {   8'd8     ,  6'd18 };
13'd2660  : q  = {   8'd35    ,  6'd1  };
13'd2661  : q  = {   8'd201   ,  6'd33 };
13'd2662  : q  = {   8'd78    ,  6'd1  };
13'd2663  : q  = {   8'd201   ,  6'd35 };
13'd2664  : q  = {   8'd25    ,  6'd27 };
13'd2665  : q  = {   8'd202   ,  6'd1  };
13'd2666  : q  = {   8'd70    ,  6'd34 };
13'd2667  : q  = {   8'd31    ,  6'd8  };
13'd2668  : q  = {   8'd70    ,  6'd35 };
13'd2669  : q  = {   8'd38    ,  6'd13 };
13'd2670  : q  = {   8'd202   ,  6'd6  };
13'd2671  : q  = {   8'd83    ,  6'd33 };
13'd2672  : q  = {   8'd202   ,  6'd8  };
13'd2673  : q  = {   8'd202   ,  6'd9  };
13'd2674  : q  = {   8'd58    ,  6'd30 };
13'd2675  : q  = {   8'd58    ,  6'd31 };
13'd2676  : q  = {   8'd202   ,  6'd12 };
13'd2677  : q  = {   8'd77    ,  6'd32 };
13'd2678  : q  = {   8'd202   ,  6'd14 };
13'd2679  : q  = {   8'd202   ,  6'd15 };
13'd2680  : q  = {   8'd202   ,  6'd16 };
13'd2681  : q  = {   8'd71    ,  6'd1  };
13'd2682  : q  = {   8'd202   ,  6'd18 };
13'd2683  : q  = {   8'd58    ,  6'd32 };
13'd2684  : q  = {   8'd58    ,  6'd33 };
13'd2685  : q  = {   8'd127   ,  6'd16 };
13'd2686  : q  = {   8'd96    ,  6'd15 };
13'd2687  : q  = {   8'd202   ,  6'd23 };
13'd2688  : q  = {   8'd202   ,  6'd24 };
13'd2689  : q  = {   8'd202   ,  6'd25 };
13'd2690  : q  = {   8'd23    ,  6'd6  };
13'd2691  : q  = {   8'd202   ,  6'd27 };
13'd2692  : q  = {   8'd202   ,  6'd28 };
13'd2693  : q  = {   8'd202   ,  6'd29 };
13'd2694  : q  = {   8'd202   ,  6'd30 };
13'd2695  : q  = {   8'd20    ,  6'd12 };
13'd2696  : q  = {   8'd202   ,  6'd32 };
13'd2697  : q  = {   8'd202   ,  6'd33 };
13'd2698  : q  = {   8'd0     ,  6'd12 };
13'd2699  : q  = {   8'd111   ,  6'd1  };
13'd2700  : q  = {   8'd59    ,  6'd1  };
13'd2701  : q  = {   8'd203   ,  6'd1  };
13'd2702  : q  = {   8'd9     ,  6'd30 };
13'd2703  : q  = {   8'd107   ,  6'd22 };
13'd2704  : q  = {   8'd203   ,  6'd4  };
13'd2705  : q  = {   8'd125   ,  6'd14 };
13'd2706  : q  = {   8'd203   ,  6'd6  };
13'd2707  : q  = {   8'd59    ,  6'd4  };
13'd2708  : q  = {   8'd203   ,  6'd8  };
13'd2709  : q  = {   8'd203   ,  6'd9  };
13'd2710  : q  = {   8'd59    ,  6'd5  };
13'd2711  : q  = {   8'd59    ,  6'd6  };
13'd2712  : q  = {   8'd203   ,  6'd12 };
13'd2713  : q  = {   8'd203   ,  6'd13 };
13'd2714  : q  = {   8'd80    ,  6'd25 };
13'd2715  : q  = {   8'd203   ,  6'd15 };
13'd2716  : q  = {   8'd203   ,  6'd16 };
13'd2717  : q  = {   8'd71    ,  6'd3  };
13'd2718  : q  = {   8'd203   ,  6'd18 };
13'd2719  : q  = {   8'd59    ,  6'd7  };
13'd2720  : q  = {   8'd84    ,  6'd8  };
13'd2721  : q  = {   8'd59    ,  6'd8  };
13'd2722  : q  = {   8'd203   ,  6'd22 };
13'd2723  : q  = {   8'd203   ,  6'd23 };
13'd2724  : q  = {   8'd203   ,  6'd24 };
13'd2725  : q  = {   8'd203   ,  6'd25 };
13'd2726  : q  = {   8'd0     ,  6'd25 };
13'd2727  : q  = {   8'd203   ,  6'd27 };
13'd2728  : q  = {   8'd203   ,  6'd28 };
13'd2729  : q  = {   8'd81    ,  6'd9  };
13'd2730  : q  = {   8'd203   ,  6'd30 };
13'd2731  : q  = {   8'd20    ,  6'd15 };
13'd2732  : q  = {   8'd203   ,  6'd32 };
13'd2733  : q  = {   8'd203   ,  6'd33 };
13'd2734  : q  = {   8'd59    ,  6'd11 };
13'd2735  : q  = {   8'd203   ,  6'd35 };
13'd2736  : q  = {   8'd59    ,  6'd12 };
13'd2737  : q  = {   8'd204   ,  6'd1  };
13'd2738  : q  = {   8'd100   ,  6'd17 };
13'd2739  : q  = {   8'd20    ,  6'd16 };
13'd2740  : q  = {   8'd80    ,  6'd35 };
13'd2741  : q  = {   8'd1     ,  6'd21 };
13'd2742  : q  = {   8'd204   ,  6'd6  };
13'd2743  : q  = {   8'd59    ,  6'd15 };
13'd2744  : q  = {   8'd204   ,  6'd8  };
13'd2745  : q  = {   8'd126   ,  6'd11 };
13'd2746  : q  = {   8'd59    ,  6'd16 };
13'd2747  : q  = {   8'd105   ,  6'd28 };
13'd2748  : q  = {   8'd204   ,  6'd12 };
13'd2749  : q  = {   8'd204   ,  6'd13 };
13'd2750  : q  = {   8'd204   ,  6'd14 };
13'd2751  : q  = {   8'd204   ,  6'd15 };
13'd2752  : q  = {   8'd204   ,  6'd16 };
13'd2753  : q  = {   8'd71    ,  6'd5  };
13'd2754  : q  = {   8'd204   ,  6'd18 };
13'd2755  : q  = {   8'd59    ,  6'd18 };
13'd2756  : q  = {   8'd78    ,  6'd31 };
13'd2757  : q  = {   8'd8     ,  6'd22 };
13'd2758  : q  = {   8'd104   ,  6'd31 };
13'd2759  : q  = {   8'd204   ,  6'd23 };
13'd2760  : q  = {   8'd59    ,  6'd21 };
13'd2761  : q  = {   8'd204   ,  6'd25 };
13'd2762  : q  = {   8'd23    ,  6'd7  };
13'd2763  : q  = {   8'd204   ,  6'd27 };
13'd2764  : q  = {   8'd204   ,  6'd28 };
13'd2765  : q  = {   8'd204   ,  6'd29 };
13'd2766  : q  = {   8'd204   ,  6'd30 };
13'd2767  : q  = {   8'd59    ,  6'd22 };
13'd2768  : q  = {   8'd204   ,  6'd32 };
13'd2769  : q  = {   8'd204   ,  6'd33 };
13'd2770  : q  = {   8'd68    ,  6'd30 };
13'd2771  : q  = {   8'd204   ,  6'd35 };
13'd2772  : q  = {   8'd59    ,  6'd24 };
13'd2773  : q  = {   8'd205   ,  6'd1  };
13'd2774  : q  = {   8'd59    ,  6'd25 };
13'd2775  : q  = {   8'd4     ,  6'd12 };
13'd2776  : q  = {   8'd205   ,  6'd4  };
13'd2777  : q  = {   8'd205   ,  6'd5  };
13'd2778  : q  = {   8'd205   ,  6'd6  };
13'd2779  : q  = {   8'd59    ,  6'd27 };
13'd2780  : q  = {   8'd8     ,  6'd24 };
13'd2781  : q  = {   8'd205   ,  6'd9  };
13'd2782  : q  = {   8'd205   ,  6'd10 };
13'd2783  : q  = {   8'd59    ,  6'd29 };
13'd2784  : q  = {   8'd205   ,  6'd12 };
13'd2785  : q  = {   8'd205   ,  6'd13 };
13'd2786  : q  = {   8'd59    ,  6'd30 };
13'd2787  : q  = {   8'd205   ,  6'd15 };
13'd2788  : q  = {   8'd25    ,  6'd28 };
13'd2789  : q  = {   8'd8     ,  6'd25 };
13'd2790  : q  = {   8'd205   ,  6'd18 };
13'd2791  : q  = {   8'd59    ,  6'd32 };
13'd2792  : q  = {   8'd103   ,  6'd24 };
13'd2793  : q  = {   8'd205   ,  6'd21 };
13'd2794  : q  = {   8'd89    ,  6'd19 };
13'd2795  : q  = {   8'd205   ,  6'd23 };
13'd2796  : q  = {   8'd59    ,  6'd34 };
13'd2797  : q  = {   8'd205   ,  6'd25 };
13'd2798  : q  = {   8'd27    ,  6'd26 };
13'd2799  : q  = {   8'd205   ,  6'd27 };
13'd2800  : q  = {   8'd205   ,  6'd28 };
13'd2801  : q  = {   8'd205   ,  6'd29 };
13'd2802  : q  = {   8'd84    ,  6'd20 };
13'd2803  : q  = {   8'd205   ,  6'd31 };
13'd2804  : q  = {   8'd205   ,  6'd32 };
13'd2805  : q  = {   8'd205   ,  6'd33 };
13'd2806  : q  = {   8'd205   ,  6'd34 };
13'd2807  : q  = {   8'd205   ,  6'd35 };
13'd2808  : q  = {   8'd2     ,  6'd18 };
13'd2809  : q  = {   8'd20    ,  6'd24 };
13'd2810  : q  = {   8'd60    ,  6'd1  };
13'd2811  : q  = {   8'd38    ,  6'd18 };
13'd2812  : q  = {   8'd206   ,  6'd4  };
13'd2813  : q  = {   8'd206   ,  6'd5  };
13'd2814  : q  = {   8'd206   ,  6'd6  };
13'd2815  : q  = {   8'd71    ,  6'd6  };
13'd2816  : q  = {   8'd206   ,  6'd8  };
13'd2817  : q  = {   8'd87    ,  6'd25 };
13'd2818  : q  = {   8'd206   ,  6'd10 };
13'd2819  : q  = {   8'd28    ,  6'd5  };
13'd2820  : q  = {   8'd206   ,  6'd12 };
13'd2821  : q  = {   8'd68    ,  6'd5  };
13'd2822  : q  = {   8'd206   ,  6'd14 };
13'd2823  : q  = {   8'd206   ,  6'd15 };
13'd2824  : q  = {   8'd206   ,  6'd16 };
13'd2825  : q  = {   8'd93    ,  6'd6  };
13'd2826  : q  = {   8'd206   ,  6'd18 };
13'd2827  : q  = {   8'd206   ,  6'd19 };
13'd2828  : q  = {   8'd60    ,  6'd4  };
13'd2829  : q  = {   8'd206   ,  6'd21 };
13'd2830  : q  = {   8'd106   ,  6'd17 };
13'd2831  : q  = {   8'd71    ,  6'd7  };
13'd2832  : q  = {   8'd60    ,  6'd5  };
13'd2833  : q  = {   8'd206   ,  6'd25 };
13'd2834  : q  = {   8'd60    ,  6'd6  };
13'd2835  : q  = {   8'd107   ,  6'd1  };
13'd2836  : q  = {   8'd206   ,  6'd28 };
13'd2837  : q  = {   8'd206   ,  6'd29 };
13'd2838  : q  = {   8'd206   ,  6'd30 };
13'd2839  : q  = {   8'd105   ,  6'd27 };
13'd2840  : q  = {   8'd206   ,  6'd32 };
13'd2841  : q  = {   8'd206   ,  6'd33 };
13'd2842  : q  = {   8'd60    ,  6'd8  };
13'd2843  : q  = {   8'd206   ,  6'd35 };
13'd2844  : q  = {   8'd20    ,  6'd25 };
13'd2845  : q  = {   8'd207   ,  6'd1  };
13'd2846  : q  = {   8'd8     ,  6'd27 };
13'd2847  : q  = {   8'd207   ,  6'd3  };
13'd2848  : q  = {   8'd28    ,  6'd8  };
13'd2849  : q  = {   8'd207   ,  6'd5  };
13'd2850  : q  = {   8'd207   ,  6'd6  };
13'd2851  : q  = {   8'd71    ,  6'd8  };
13'd2852  : q  = {   8'd207   ,  6'd8  };
13'd2853  : q  = {   8'd207   ,  6'd9  };
13'd2854  : q  = {   8'd207   ,  6'd10 };
13'd2855  : q  = {   8'd60    ,  6'd11 };
13'd2856  : q  = {   8'd207   ,  6'd12 };
13'd2857  : q  = {   8'd109   ,  6'd3  };
13'd2858  : q  = {   8'd207   ,  6'd14 };
13'd2859  : q  = {   8'd207   ,  6'd15 };
13'd2860  : q  = {   8'd207   ,  6'd16 };
13'd2861  : q  = {   8'd60    ,  6'd12 };
13'd2862  : q  = {   8'd207   ,  6'd18 };
13'd2863  : q  = {   8'd20    ,  6'd27 };
13'd2864  : q  = {   8'd20    ,  6'd28 };
13'd2865  : q  = {   8'd207   ,  6'd21 };
13'd2866  : q  = {   8'd207   ,  6'd22 };
13'd2867  : q  = {   8'd207   ,  6'd23 };
13'd2868  : q  = {   8'd60    ,  6'd15 };
13'd2869  : q  = {   8'd207   ,  6'd25 };
13'd2870  : q  = {   8'd60    ,  6'd16 };
13'd2871  : q  = {   8'd207   ,  6'd27 };
13'd2872  : q  = {   8'd207   ,  6'd28 };
13'd2873  : q  = {   8'd103   ,  6'd31 };
13'd2874  : q  = {   8'd207   ,  6'd30 };
13'd2875  : q  = {   8'd20    ,  6'd29 };
13'd2876  : q  = {   8'd207   ,  6'd32 };
13'd2877  : q  = {   8'd207   ,  6'd33 };
13'd2878  : q  = {   8'd207   ,  6'd34 };
13'd2879  : q  = {   8'd207   ,  6'd35 };
13'd2880  : q  = {   8'd208   ,  6'd0  };
13'd2881  : q  = {   8'd208   ,  6'd1  };
13'd2882  : q  = {   8'd60    ,  6'd18 };
13'd2883  : q  = {   8'd208   ,  6'd3  };
13'd2884  : q  = {   8'd208   ,  6'd4  };
13'd2885  : q  = {   8'd11    ,  6'd33 };
13'd2886  : q  = {   8'd208   ,  6'd6  };
13'd2887  : q  = {   8'd87    ,  6'd26 };
13'd2888  : q  = {   8'd208   ,  6'd8  };
13'd2889  : q  = {   8'd87    ,  6'd27 };
13'd2890  : q  = {   8'd208   ,  6'd10 };
13'd2891  : q  = {   8'd208   ,  6'd11 };
13'd2892  : q  = {   8'd208   ,  6'd12 };
13'd2893  : q  = {   8'd87    ,  6'd28 };
13'd2894  : q  = {   8'd208   ,  6'd14 };
13'd2895  : q  = {   8'd208   ,  6'd15 };
13'd2896  : q  = {   8'd208   ,  6'd16 };
13'd2897  : q  = {   8'd60    ,  6'd21 };
13'd2898  : q  = {   8'd208   ,  6'd18 };
13'd2899  : q  = {   8'd208   ,  6'd19 };
13'd2900  : q  = {   8'd92    ,  6'd2  };
13'd2901  : q  = {   8'd208   ,  6'd21 };
13'd2902  : q  = {   8'd208   ,  6'd22 };
13'd2903  : q  = {   8'd37    ,  6'd4  };
13'd2904  : q  = {   8'd60    ,  6'd22 };
13'd2905  : q  = {   8'd208   ,  6'd25 };
13'd2906  : q  = {   8'd208   ,  6'd26 };
13'd2907  : q  = {   8'd208   ,  6'd27 };
13'd2908  : q  = {   8'd208   ,  6'd28 };
13'd2909  : q  = {   8'd208   ,  6'd29 };
13'd2910  : q  = {   8'd60    ,  6'd23 };
13'd2911  : q  = {   8'd208   ,  6'd31 };
13'd2912  : q  = {   8'd208   ,  6'd32 };
13'd2913  : q  = {   8'd208   ,  6'd33 };
13'd2914  : q  = {   8'd60    ,  6'd24 };
13'd2915  : q  = {   8'd208   ,  6'd35 };
13'd2916  : q  = {   8'd209   ,  6'd0  };
13'd2917  : q  = {   8'd209   ,  6'd1  };
13'd2918  : q  = {   8'd24    ,  6'd1  };
13'd2919  : q  = {   8'd82    ,  6'd30 };
13'd2920  : q  = {   8'd209   ,  6'd4  };
13'd2921  : q  = {   8'd2     ,  6'd25 };
13'd2922  : q  = {   8'd209   ,  6'd6  };
13'd2923  : q  = {   8'd60    ,  6'd25 };
13'd2924  : q  = {   8'd209   ,  6'd8  };
13'd2925  : q  = {   8'd209   ,  6'd9  };
13'd2926  : q  = {   8'd209   ,  6'd10 };
13'd2927  : q  = {   8'd31    ,  6'd9  };
13'd2928  : q  = {   8'd209   ,  6'd12 };
13'd2929  : q  = {   8'd26    ,  6'd34 };
13'd2930  : q  = {   8'd209   ,  6'd14 };
13'd2931  : q  = {   8'd35    ,  6'd16 };
13'd2932  : q  = {   8'd107   ,  6'd11 };
13'd2933  : q  = {   8'd209   ,  6'd17 };
13'd2934  : q  = {   8'd93    ,  6'd2  };
13'd2935  : q  = {   8'd209   ,  6'd19 };
13'd2936  : q  = {   8'd209   ,  6'd20 };
13'd2937  : q  = {   8'd209   ,  6'd21 };
13'd2938  : q  = {   8'd209   ,  6'd22 };
13'd2939  : q  = {   8'd209   ,  6'd23 };
13'd2940  : q  = {   8'd106   ,  6'd8  };
13'd2941  : q  = {   8'd209   ,  6'd25 };
13'd2942  : q  = {   8'd209   ,  6'd26 };
13'd2943  : q  = {   8'd209   ,  6'd27 };
13'd2944  : q  = {   8'd209   ,  6'd28 };
13'd2945  : q  = {   8'd209   ,  6'd29 };
13'd2946  : q  = {   8'd209   ,  6'd30 };
13'd2947  : q  = {   8'd209   ,  6'd31 };
13'd2948  : q  = {   8'd209   ,  6'd32 };
13'd2949  : q  = {   8'd209   ,  6'd33 };
13'd2950  : q  = {   8'd209   ,  6'd34 };
13'd2951  : q  = {   8'd209   ,  6'd35 };
13'd2952  : q  = {   8'd210   ,  6'd0  };
13'd2953  : q  = {   8'd210   ,  6'd1  };
13'd2954  : q  = {   8'd71    ,  6'd12 };
13'd2955  : q  = {   8'd210   ,  6'd3  };
13'd2956  : q  = {   8'd60    ,  6'd29 };
13'd2957  : q  = {   8'd60    ,  6'd30 };
13'd2958  : q  = {   8'd210   ,  6'd6  };
13'd2959  : q  = {   8'd210   ,  6'd7  };
13'd2960  : q  = {   8'd210   ,  6'd8  };
13'd2961  : q  = {   8'd68    ,  6'd29 };
13'd2962  : q  = {   8'd210   ,  6'd10 };
13'd2963  : q  = {   8'd13    ,  6'd30 };
13'd2964  : q  = {   8'd210   ,  6'd12 };
13'd2965  : q  = {   8'd82    ,  6'd31 };
13'd2966  : q  = {   8'd210   ,  6'd14 };
13'd2967  : q  = {   8'd210   ,  6'd15 };
13'd2968  : q  = {   8'd82    ,  6'd32 };
13'd2969  : q  = {   8'd14    ,  6'd9  };
13'd2970  : q  = {   8'd210   ,  6'd18 };
13'd2971  : q  = {   8'd210   ,  6'd19 };
13'd2972  : q  = {   8'd210   ,  6'd20 };
13'd2973  : q  = {   8'd210   ,  6'd21 };
13'd2974  : q  = {   8'd210   ,  6'd22 };
13'd2975  : q  = {   8'd12    ,  6'd9  };
13'd2976  : q  = {   8'd125   ,  6'd8  };
13'd2977  : q  = {   8'd210   ,  6'd25 };
13'd2978  : q  = {   8'd210   ,  6'd26 };
13'd2979  : q  = {   8'd210   ,  6'd27 };
13'd2980  : q  = {   8'd210   ,  6'd28 };
13'd2981  : q  = {   8'd98    ,  6'd12 };
13'd2982  : q  = {   8'd39    ,  6'd0  };
13'd2983  : q  = {   8'd60    ,  6'd34 };
13'd2984  : q  = {   8'd210   ,  6'd32 };
13'd2985  : q  = {   8'd210   ,  6'd33 };
13'd2986  : q  = {   8'd122   ,  6'd30 };
13'd2987  : q  = {   8'd210   ,  6'd35 };
13'd2988  : q  = {   8'd25    ,  6'd29 };
13'd2989  : q  = {   8'd121   ,  6'd7  };
13'd2990  : q  = {   8'd24    ,  6'd3  };
13'd2991  : q  = {   8'd211   ,  6'd3  };
13'd2992  : q  = {   8'd211   ,  6'd4  };
13'd2993  : q  = {   8'd71    ,  6'd15 };
13'd2994  : q  = {   8'd211   ,  6'd6  };
13'd2995  : q  = {   8'd20    ,  6'd35 };
13'd2996  : q  = {   8'd61    ,  6'd1  };
13'd2997  : q  = {   8'd211   ,  6'd9  };
13'd2998  : q  = {   8'd61    ,  6'd2  };
13'd2999  : q  = {   8'd116   ,  6'd21 };
13'd3000  : q  = {   8'd40    ,  6'd5  };
13'd3001  : q  = {   8'd71    ,  6'd16 };
13'd3002  : q  = {   8'd211   ,  6'd14 };
13'd3003  : q  = {   8'd61    ,  6'd3  };
13'd3004  : q  = {   8'd61    ,  6'd4  };
13'd3005  : q  = {   8'd35    ,  6'd28 };
13'd3006  : q  = {   8'd211   ,  6'd18 };
13'd3007  : q  = {   8'd211   ,  6'd19 };
13'd3008  : q  = {   8'd109   ,  6'd27 };
13'd3009  : q  = {   8'd121   ,  6'd17 };
13'd3010  : q  = {   8'd211   ,  6'd22 };
13'd3011  : q  = {   8'd211   ,  6'd23 };
13'd3012  : q  = {   8'd101   ,  6'd8  };
13'd3013  : q  = {   8'd211   ,  6'd25 };
13'd3014  : q  = {   8'd82    ,  6'd33 };
13'd3015  : q  = {   8'd211   ,  6'd27 };
13'd3016  : q  = {   8'd211   ,  6'd28 };
13'd3017  : q  = {   8'd105   ,  6'd16 };
13'd3018  : q  = {   8'd211   ,  6'd30 };
13'd3019  : q  = {   8'd61    ,  6'd7  };
13'd3020  : q  = {   8'd211   ,  6'd32 };
13'd3021  : q  = {   8'd100   ,  6'd1  };
13'd3022  : q  = {   8'd13    ,  6'd9  };
13'd3023  : q  = {   8'd211   ,  6'd35 };
13'd3024  : q  = {   8'd1     ,  6'd35 };
13'd3025  : q  = {   8'd212   ,  6'd1  };
13'd3026  : q  = {   8'd8     ,  6'd29 };
13'd3027  : q  = {   8'd24    ,  6'd4  };
13'd3028  : q  = {   8'd117   ,  6'd24 };
13'd3029  : q  = {   8'd21    ,  6'd1  };
13'd3030  : q  = {   8'd212   ,  6'd6  };
13'd3031  : q  = {   8'd87    ,  6'd31 };
13'd3032  : q  = {   8'd212   ,  6'd8  };
13'd3033  : q  = {   8'd212   ,  6'd9  };
13'd3034  : q  = {   8'd99    ,  6'd3  };
13'd3035  : q  = {   8'd212   ,  6'd11 };
13'd3036  : q  = {   8'd212   ,  6'd12 };
13'd3037  : q  = {   8'd40    ,  6'd18 };
13'd3038  : q  = {   8'd212   ,  6'd14 };
13'd3039  : q  = {   8'd212   ,  6'd15 };
13'd3040  : q  = {   8'd61    ,  6'd11 };
13'd3041  : q  = {   8'd82    ,  6'd34 };
13'd3042  : q  = {   8'd212   ,  6'd18 };
13'd3043  : q  = {   8'd212   ,  6'd19 };
13'd3044  : q  = {   8'd61    ,  6'd12 };
13'd3045  : q  = {   8'd8     ,  6'd30 };
13'd3046  : q  = {   8'd212   ,  6'd22 };
13'd3047  : q  = {   8'd212   ,  6'd23 };
13'd3048  : q  = {   8'd76    ,  6'd21 };
13'd3049  : q  = {   8'd212   ,  6'd25 };
13'd3050  : q  = {   8'd212   ,  6'd26 };
13'd3051  : q  = {   8'd212   ,  6'd27 };
13'd3052  : q  = {   8'd212   ,  6'd28 };
13'd3053  : q  = {   8'd112   ,  6'd29 };
13'd3054  : q  = {   8'd212   ,  6'd30 };
13'd3055  : q  = {   8'd21    ,  6'd3  };
13'd3056  : q  = {   8'd212   ,  6'd32 };
13'd3057  : q  = {   8'd212   ,  6'd33 };
13'd3058  : q  = {   8'd212   ,  6'd34 };
13'd3059  : q  = {   8'd212   ,  6'd35 };
13'd3060  : q  = {   8'd61    ,  6'd15 };
13'd3061  : q  = {   8'd61    ,  6'd16 };
13'd3062  : q  = {   8'd21    ,  6'd4  };
13'd3063  : q  = {   8'd213   ,  6'd3  };
13'd3064  : q  = {   8'd112   ,  6'd18 };
13'd3065  : q  = {   8'd61    ,  6'd18 };
13'd3066  : q  = {   8'd213   ,  6'd6  };
13'd3067  : q  = {   8'd213   ,  6'd7  };
13'd3068  : q  = {   8'd213   ,  6'd8  };
13'd3069  : q  = {   8'd213   ,  6'd9  };
13'd3070  : q  = {   8'd4     ,  6'd35 };
13'd3071  : q  = {   8'd3     ,  6'd12 };
13'd3072  : q  = {   8'd213   ,  6'd12 };
13'd3073  : q  = {   8'd78    ,  6'd35 };
13'd3074  : q  = {   8'd213   ,  6'd14 };
13'd3075  : q  = {   8'd213   ,  6'd15 };
13'd3076  : q  = {   8'd2     ,  6'd30 };
13'd3077  : q  = {   8'd123   ,  6'd23 };
13'd3078  : q  = {   8'd213   ,  6'd18 };
13'd3079  : q  = {   8'd213   ,  6'd19 };
13'd3080  : q  = {   8'd61    ,  6'd19 };
13'd3081  : q  = {   8'd213   ,  6'd21 };
13'd3082  : q  = {   8'd213   ,  6'd22 };
13'd3083  : q  = {   8'd213   ,  6'd23 };
13'd3084  : q  = {   8'd213   ,  6'd24 };
13'd3085  : q  = {   8'd213   ,  6'd25 };
13'd3086  : q  = {   8'd118   ,  6'd22 };
13'd3087  : q  = {   8'd213   ,  6'd27 };
13'd3088  : q  = {   8'd213   ,  6'd28 };
13'd3089  : q  = {   8'd213   ,  6'd29 };
13'd3090  : q  = {   8'd213   ,  6'd30 };
13'd3091  : q  = {   8'd21    ,  6'd5  };
13'd3092  : q  = {   8'd33    ,  6'd18 };
13'd3093  : q  = {   8'd82    ,  6'd35 };
13'd3094  : q  = {   8'd61    ,  6'd21 };
13'd3095  : q  = {   8'd213   ,  6'd35 };
13'd3096  : q  = {   8'd61    ,  6'd22 };
13'd3097  : q  = {   8'd214   ,  6'd1  };
13'd3098  : q  = {   8'd214   ,  6'd2  };
13'd3099  : q  = {   8'd214   ,  6'd3  };
13'd3100  : q  = {   8'd61    ,  6'd23 };
13'd3101  : q  = {   8'd109   ,  6'd30 };
13'd3102  : q  = {   8'd214   ,  6'd6  };
13'd3103  : q  = {   8'd214   ,  6'd7  };
13'd3104  : q  = {   8'd214   ,  6'd8  };
13'd3105  : q  = {   8'd214   ,  6'd9  };
13'd3106  : q  = {   8'd214   ,  6'd10 };
13'd3107  : q  = {   8'd214   ,  6'd11 };
13'd3108  : q  = {   8'd76    ,  6'd23 };
13'd3109  : q  = {   8'd214   ,  6'd13 };
13'd3110  : q  = {   8'd214   ,  6'd14 };
13'd3111  : q  = {   8'd214   ,  6'd15 };
13'd3112  : q  = {   8'd102   ,  6'd27 };
13'd3113  : q  = {   8'd83    ,  6'd0  };
13'd3114  : q  = {   8'd214   ,  6'd18 };
13'd3115  : q  = {   8'd214   ,  6'd19 };
13'd3116  : q  = {   8'd21    ,  6'd6  };
13'd3117  : q  = {   8'd61    ,  6'd27 };
13'd3118  : q  = {   8'd214   ,  6'd22 };
13'd3119  : q  = {   8'd214   ,  6'd23 };
13'd3120  : q  = {   8'd76    ,  6'd24 };
13'd3121  : q  = {   8'd214   ,  6'd25 };
13'd3122  : q  = {   8'd73    ,  6'd21 };
13'd3123  : q  = {   8'd214   ,  6'd27 };
13'd3124  : q  = {   8'd214   ,  6'd28 };
13'd3125  : q  = {   8'd115   ,  6'd24 };
13'd3126  : q  = {   8'd214   ,  6'd30 };
13'd3127  : q  = {   8'd21    ,  6'd7  };
13'd3128  : q  = {   8'd105   ,  6'd14 };
13'd3129  : q  = {   8'd214   ,  6'd33 };
13'd3130  : q  = {   8'd214   ,  6'd34 };
13'd3131  : q  = {   8'd214   ,  6'd35 };
13'd3132  : q  = {   8'd61    ,  6'd29 };
13'd3133  : q  = {   8'd215   ,  6'd1  };
13'd3134  : q  = {   8'd61    ,  6'd30 };
13'd3135  : q  = {   8'd21    ,  6'd8  };
13'd3136  : q  = {   8'd215   ,  6'd4  };
13'd3137  : q  = {   8'd107   ,  6'd16 };
13'd3138  : q  = {   8'd215   ,  6'd6  };
13'd3139  : q  = {   8'd61    ,  6'd33 };
13'd3140  : q  = {   8'd215   ,  6'd8  };
13'd3141  : q  = {   8'd74    ,  6'd6  };
13'd3142  : q  = {   8'd123   ,  6'd25 };
13'd3143  : q  = {   8'd215   ,  6'd11 };
13'd3144  : q  = {   8'd98    ,  6'd15 };
13'd3145  : q  = {   8'd215   ,  6'd13 };
13'd3146  : q  = {   8'd96    ,  6'd17 };
13'd3147  : q  = {   8'd215   ,  6'd15 };
13'd3148  : q  = {   8'd61    ,  6'd34 };
13'd3149  : q  = {   8'd83    ,  6'd1  };
13'd3150  : q  = {   8'd215   ,  6'd18 };
13'd3151  : q  = {   8'd215   ,  6'd19 };
13'd3152  : q  = {   8'd215   ,  6'd20 };
13'd3153  : q  = {   8'd21    ,  6'd9  };
13'd3154  : q  = {   8'd215   ,  6'd22 };
13'd3155  : q  = {   8'd215   ,  6'd23 };
13'd3156  : q  = {   8'd215   ,  6'd24 };
13'd3157  : q  = {   8'd215   ,  6'd25 };
13'd3158  : q  = {   8'd215   ,  6'd26 };
13'd3159  : q  = {   8'd215   ,  6'd27 };
13'd3160  : q  = {   8'd215   ,  6'd28 };
13'd3161  : q  = {   8'd215   ,  6'd29 };
13'd3162  : q  = {   8'd215   ,  6'd30 };
13'd3163  : q  = {   8'd0     ,  6'd18 };
13'd3164  : q  = {   8'd215   ,  6'd32 };
13'd3165  : q  = {   8'd215   ,  6'd33 };
13'd3166  : q  = {   8'd215   ,  6'd34 };
13'd3167  : q  = {   8'd215   ,  6'd35 };
13'd3168  : q  = {   8'd62    ,  6'd1  };
13'd3169  : q  = {   8'd216   ,  6'd1  };
13'd3170  : q  = {   8'd216   ,  6'd2  };
13'd3171  : q  = {   8'd216   ,  6'd3  };
13'd3172  : q  = {   8'd216   ,  6'd4  };
13'd3173  : q  = {   8'd62    ,  6'd2  };
13'd3174  : q  = {   8'd216   ,  6'd6  };
13'd3175  : q  = {   8'd62    ,  6'd3  };
13'd3176  : q  = {   8'd216   ,  6'd8  };
13'd3177  : q  = {   8'd216   ,  6'd9  };
13'd3178  : q  = {   8'd14    ,  6'd11 };
13'd3179  : q  = {   8'd216   ,  6'd11 };
13'd3180  : q  = {   8'd76    ,  6'd26 };
13'd3181  : q  = {   8'd216   ,  6'd13 };
13'd3182  : q  = {   8'd216   ,  6'd14 };
13'd3183  : q  = {   8'd216   ,  6'd15 };
13'd3184  : q  = {   8'd216   ,  6'd16 };
13'd3185  : q  = {   8'd216   ,  6'd17 };
13'd3186  : q  = {   8'd216   ,  6'd18 };
13'd3187  : q  = {   8'd216   ,  6'd19 };
13'd3188  : q  = {   8'd76    ,  6'd27 };
13'd3189  : q  = {   8'd62    ,  6'd4  };
13'd3190  : q  = {   8'd216   ,  6'd22 };
13'd3191  : q  = {   8'd216   ,  6'd23 };
13'd3192  : q  = {   8'd89    ,  6'd4  };
13'd3193  : q  = {   8'd216   ,  6'd25 };
13'd3194  : q  = {   8'd216   ,  6'd26 };
13'd3195  : q  = {   8'd216   ,  6'd27 };
13'd3196  : q  = {   8'd216   ,  6'd28 };
13'd3197  : q  = {   8'd216   ,  6'd29 };
13'd3198  : q  = {   8'd216   ,  6'd30 };
13'd3199  : q  = {   8'd62    ,  6'd5  };
13'd3200  : q  = {   8'd94    ,  6'd32 };
13'd3201  : q  = {   8'd216   ,  6'd33 };
13'd3202  : q  = {   8'd216   ,  6'd34 };
13'd3203  : q  = {   8'd216   ,  6'd35 };
13'd3204  : q  = {   8'd87    ,  6'd34 };
13'd3205  : q  = {   8'd217   ,  6'd1  };
13'd3206  : q  = {   8'd8     ,  6'd32 };
13'd3207  : q  = {   8'd217   ,  6'd3  };
13'd3208  : q  = {   8'd217   ,  6'd4  };
13'd3209  : q  = {   8'd217   ,  6'd5  };
13'd3210  : q  = {   8'd106   ,  6'd25 };
13'd3211  : q  = {   8'd217   ,  6'd7  };
13'd3212  : q  = {   8'd217   ,  6'd8  };
13'd3213  : q  = {   8'd119   ,  6'd10 };
13'd3214  : q  = {   8'd91    ,  6'd15 };
13'd3215  : q  = {   8'd102   ,  6'd29 };
13'd3216  : q  = {   8'd76    ,  6'd29 };
13'd3217  : q  = {   8'd84    ,  6'd26 };
13'd3218  : q  = {   8'd217   ,  6'd14 };
13'd3219  : q  = {   8'd217   ,  6'd15 };
13'd3220  : q  = {   8'd62    ,  6'd8  };
13'd3221  : q  = {   8'd217   ,  6'd17 };
13'd3222  : q  = {   8'd217   ,  6'd18 };
13'd3223  : q  = {   8'd24    ,  6'd34 };
13'd3224  : q  = {   8'd109   ,  6'd23 };
13'd3225  : q  = {   8'd217   ,  6'd21 };
13'd3226  : q  = {   8'd83    ,  6'd2  };
13'd3227  : q  = {   8'd217   ,  6'd23 };
13'd3228  : q  = {   8'd217   ,  6'd24 };
13'd3229  : q  = {   8'd39    ,  6'd30 };
13'd3230  : q  = {   8'd1     ,  6'd6  };
13'd3231  : q  = {   8'd217   ,  6'd27 };
13'd3232  : q  = {   8'd217   ,  6'd28 };
13'd3233  : q  = {   8'd217   ,  6'd29 };
13'd3234  : q  = {   8'd217   ,  6'd30 };
13'd3235  : q  = {   8'd37    ,  6'd25 };
13'd3236  : q  = {   8'd217   ,  6'd32 };
13'd3237  : q  = {   8'd217   ,  6'd33 };
13'd3238  : q  = {   8'd118   ,  6'd3  };
13'd3239  : q  = {   8'd217   ,  6'd35 };
13'd3240  : q  = {   8'd68    ,  6'd11 };
13'd3241  : q  = {   8'd218   ,  6'd1  };
13'd3242  : q  = {   8'd62    ,  6'd11 };
13'd3243  : q  = {   8'd62    ,  6'd12 };
13'd3244  : q  = {   8'd218   ,  6'd4  };
13'd3245  : q  = {   8'd218   ,  6'd5  };
13'd3246  : q  = {   8'd218   ,  6'd6  };
13'd3247  : q  = {   8'd218   ,  6'd7  };
13'd3248  : q  = {   8'd218   ,  6'd8  };
13'd3249  : q  = {   8'd218   ,  6'd9  };
13'd3250  : q  = {   8'd0     ,  6'd30 };
13'd3251  : q  = {   8'd218   ,  6'd11 };
13'd3252  : q  = {   8'd218   ,  6'd12 };
13'd3253  : q  = {   8'd218   ,  6'd13 };
13'd3254  : q  = {   8'd218   ,  6'd14 };
13'd3255  : q  = {   8'd218   ,  6'd15 };
13'd3256  : q  = {   8'd88    ,  6'd0  };
13'd3257  : q  = {   8'd218   ,  6'd17 };
13'd3258  : q  = {   8'd218   ,  6'd18 };
13'd3259  : q  = {   8'd218   ,  6'd19 };
13'd3260  : q  = {   8'd218   ,  6'd20 };
13'd3261  : q  = {   8'd218   ,  6'd21 };
13'd3262  : q  = {   8'd8     ,  6'd34 };
13'd3263  : q  = {   8'd218   ,  6'd23 };
13'd3264  : q  = {   8'd218   ,  6'd24 };
13'd3265  : q  = {   8'd218   ,  6'd25 };
13'd3266  : q  = {   8'd94    ,  6'd33 };
13'd3267  : q  = {   8'd218   ,  6'd27 };
13'd3268  : q  = {   8'd218   ,  6'd28 };
13'd3269  : q  = {   8'd218   ,  6'd29 };
13'd3270  : q  = {   8'd218   ,  6'd30 };
13'd3271  : q  = {   8'd123   ,  6'd16 };
13'd3272  : q  = {   8'd218   ,  6'd32 };
13'd3273  : q  = {   8'd62    ,  6'd15 };
13'd3274  : q  = {   8'd84    ,  6'd18 };
13'd3275  : q  = {   8'd218   ,  6'd35 };
13'd3276  : q  = {   8'd62    ,  6'd16 };
13'd3277  : q  = {   8'd219   ,  6'd1  };
13'd3278  : q  = {   8'd21    ,  6'd16 };
13'd3279  : q  = {   8'd62    ,  6'd18 };
13'd3280  : q  = {   8'd219   ,  6'd4  };
13'd3281  : q  = {   8'd219   ,  6'd5  };
13'd3282  : q  = {   8'd219   ,  6'd6  };
13'd3283  : q  = {   8'd219   ,  6'd7  };
13'd3284  : q  = {   8'd62    ,  6'd19 };
13'd3285  : q  = {   8'd219   ,  6'd9  };
13'd3286  : q  = {   8'd219   ,  6'd10 };
13'd3287  : q  = {   8'd98    ,  6'd16 };
13'd3288  : q  = {   8'd127   ,  6'd15 };
13'd3289  : q  = {   8'd35    ,  6'd3  };
13'd3290  : q  = {   8'd219   ,  6'd14 };
13'd3291  : q  = {   8'd219   ,  6'd15 };
13'd3292  : q  = {   8'd219   ,  6'd16 };
13'd3293  : q  = {   8'd219   ,  6'd17 };
13'd3294  : q  = {   8'd98    ,  6'd17 };
13'd3295  : q  = {   8'd219   ,  6'd19 };
13'd3296  : q  = {   8'd219   ,  6'd20 };
13'd3297  : q  = {   8'd219   ,  6'd21 };
13'd3298  : q  = {   8'd4     ,  6'd15 };
13'd3299  : q  = {   8'd83    ,  6'd3  };
13'd3300  : q  = {   8'd219   ,  6'd24 };
13'd3301  : q  = {   8'd109   ,  6'd18 };
13'd3302  : q  = {   8'd83    ,  6'd4  };
13'd3303  : q  = {   8'd219   ,  6'd27 };
13'd3304  : q  = {   8'd219   ,  6'd28 };
13'd3305  : q  = {   8'd111   ,  6'd16 };
13'd3306  : q  = {   8'd219   ,  6'd30 };
13'd3307  : q  = {   8'd62    ,  6'd21 };
13'd3308  : q  = {   8'd36    ,  6'd3  };
13'd3309  : q  = {   8'd219   ,  6'd33 };
13'd3310  : q  = {   8'd219   ,  6'd34 };
13'd3311  : q  = {   8'd219   ,  6'd35 };
13'd3312  : q  = {   8'd220   ,  6'd0  };
13'd3313  : q  = {   8'd79    ,  6'd1  };
13'd3314  : q  = {   8'd62    ,  6'd22 };
13'd3315  : q  = {   8'd220   ,  6'd3  };
13'd3316  : q  = {   8'd220   ,  6'd4  };
13'd3317  : q  = {   8'd220   ,  6'd5  };
13'd3318  : q  = {   8'd62    ,  6'd23 };
13'd3319  : q  = {   8'd220   ,  6'd7  };
13'd3320  : q  = {   8'd220   ,  6'd8  };
13'd3321  : q  = {   8'd220   ,  6'd9  };
13'd3322  : q  = {   8'd67    ,  6'd27 };
13'd3323  : q  = {   8'd220   ,  6'd11 };
13'd3324  : q  = {   8'd76    ,  6'd32 };
13'd3325  : q  = {   8'd93    ,  6'd5  };
13'd3326  : q  = {   8'd102   ,  6'd18 };
13'd3327  : q  = {   8'd220   ,  6'd15 };
13'd3328  : q  = {   8'd62    ,  6'd24 };
13'd3329  : q  = {   8'd220   ,  6'd17 };
13'd3330  : q  = {   8'd220   ,  6'd18 };
13'd3331  : q  = {   8'd220   ,  6'd19 };
13'd3332  : q  = {   8'd102   ,  6'd30 };
13'd3333  : q  = {   8'd62    ,  6'd25 };
13'd3334  : q  = {   8'd21    ,  6'd18 };
13'd3335  : q  = {   8'd220   ,  6'd23 };
13'd3336  : q  = {   8'd220   ,  6'd24 };
13'd3337  : q  = {   8'd220   ,  6'd25 };
13'd3338  : q  = {   8'd220   ,  6'd26 };
13'd3339  : q  = {   8'd24    ,  6'd6  };
13'd3340  : q  = {   8'd220   ,  6'd28 };
13'd3341  : q  = {   8'd220   ,  6'd29 };
13'd3342  : q  = {   8'd220   ,  6'd30 };
13'd3343  : q  = {   8'd67    ,  6'd34 };
13'd3344  : q  = {   8'd36    ,  6'd9  };
13'd3345  : q  = {   8'd73    ,  6'd25 };
13'd3346  : q  = {   8'd220   ,  6'd34 };
13'd3347  : q  = {   8'd220   ,  6'd35 };
13'd3348  : q  = {   8'd221   ,  6'd0  };
13'd3349  : q  = {   8'd221   ,  6'd1  };
13'd3350  : q  = {   8'd71    ,  6'd21 };
13'd3351  : q  = {   8'd221   ,  6'd3  };
13'd3352  : q  = {   8'd221   ,  6'd4  };
13'd3353  : q  = {   8'd221   ,  6'd5  };
13'd3354  : q  = {   8'd102   ,  6'd25 };
13'd3355  : q  = {   8'd221   ,  6'd7  };
13'd3356  : q  = {   8'd221   ,  6'd8  };
13'd3357  : q  = {   8'd221   ,  6'd9  };
13'd3358  : q  = {   8'd221   ,  6'd10 };
13'd3359  : q  = {   8'd221   ,  6'd11 };
13'd3360  : q  = {   8'd62    ,  6'd29 };
13'd3361  : q  = {   8'd120   ,  6'd18 };
13'd3362  : q  = {   8'd221   ,  6'd14 };
13'd3363  : q  = {   8'd221   ,  6'd15 };
13'd3364  : q  = {   8'd221   ,  6'd16 };
13'd3365  : q  = {   8'd221   ,  6'd17 };
13'd3366  : q  = {   8'd221   ,  6'd18 };
13'd3367  : q  = {   8'd221   ,  6'd19 };
13'd3368  : q  = {   8'd221   ,  6'd20 };
13'd3369  : q  = {   8'd76    ,  6'd33 };
13'd3370  : q  = {   8'd62    ,  6'd30 };
13'd3371  : q  = {   8'd221   ,  6'd23 };
13'd3372  : q  = {   8'd221   ,  6'd24 };
13'd3373  : q  = {   8'd117   ,  6'd31 };
13'd3374  : q  = {   8'd221   ,  6'd26 };
13'd3375  : q  = {   8'd93    ,  6'd4  };
13'd3376  : q  = {   8'd40    ,  6'd19 };
13'd3377  : q  = {   8'd221   ,  6'd29 };
13'd3378  : q  = {   8'd221   ,  6'd30 };
13'd3379  : q  = {   8'd117   ,  6'd30 };
13'd3380  : q  = {   8'd112   ,  6'd3  };
13'd3381  : q  = {   8'd221   ,  6'd33 };
13'd3382  : q  = {   8'd62    ,  6'd33 };
13'd3383  : q  = {   8'd38    ,  6'd8  };
13'd3384  : q  = {   8'd222   ,  6'd0  };
13'd3385  : q  = {   8'd62    ,  6'd34 };
13'd3386  : q  = {   8'd24    ,  6'd7  };
13'd3387  : q  = {   8'd222   ,  6'd3  };
13'd3388  : q  = {   8'd222   ,  6'd4  };
13'd3389  : q  = {   8'd222   ,  6'd5  };
13'd3390  : q  = {   8'd23    ,  6'd8  };
13'd3391  : q  = {   8'd222   ,  6'd7  };
13'd3392  : q  = {   8'd222   ,  6'd8  };
13'd3393  : q  = {   8'd222   ,  6'd9  };
13'd3394  : q  = {   8'd222   ,  6'd10 };
13'd3395  : q  = {   8'd36    ,  6'd14 };
13'd3396  : q  = {   8'd76    ,  6'd34 };
13'd3397  : q  = {   8'd222   ,  6'd13 };
13'd3398  : q  = {   8'd113   ,  6'd13 };
13'd3399  : q  = {   8'd222   ,  6'd15 };
13'd3400  : q  = {   8'd27    ,  6'd35 };
13'd3401  : q  = {   8'd222   ,  6'd17 };
13'd3402  : q  = {   8'd222   ,  6'd18 };
13'd3403  : q  = {   8'd222   ,  6'd19 };
13'd3404  : q  = {   8'd222   ,  6'd20 };
13'd3405  : q  = {   8'd9     ,  6'd2  };
13'd3406  : q  = {   8'd63    ,  6'd1  };
13'd3407  : q  = {   8'd222   ,  6'd23 };
13'd3408  : q  = {   8'd222   ,  6'd24 };
13'd3409  : q  = {   8'd222   ,  6'd25 };
13'd3410  : q  = {   8'd222   ,  6'd26 };
13'd3411  : q  = {   8'd222   ,  6'd27 };
13'd3412  : q  = {   8'd222   ,  6'd28 };
13'd3413  : q  = {   8'd222   ,  6'd29 };
13'd3414  : q  = {   8'd222   ,  6'd30 };
13'd3415  : q  = {   8'd63    ,  6'd2  };
13'd3416  : q  = {   8'd222   ,  6'd32 };
13'd3417  : q  = {   8'd222   ,  6'd33 };
13'd3418  : q  = {   8'd98    ,  6'd18 };
13'd3419  : q  = {   8'd222   ,  6'd35 };
13'd3420  : q  = {   8'd223   ,  6'd0  };
13'd3421  : q  = {   8'd223   ,  6'd1  };
13'd3422  : q  = {   8'd9     ,  6'd3  };
13'd3423  : q  = {   8'd223   ,  6'd3  };
13'd3424  : q  = {   8'd223   ,  6'd4  };
13'd3425  : q  = {   8'd223   ,  6'd5  };
13'd3426  : q  = {   8'd223   ,  6'd6  };
13'd3427  : q  = {   8'd223   ,  6'd7  };
13'd3428  : q  = {   8'd223   ,  6'd8  };
13'd3429  : q  = {   8'd223   ,  6'd9  };
13'd3430  : q  = {   8'd223   ,  6'd10 };
13'd3431  : q  = {   8'd223   ,  6'd11 };
13'd3432  : q  = {   8'd63    ,  6'd5  };
13'd3433  : q  = {   8'd223   ,  6'd13 };
13'd3434  : q  = {   8'd223   ,  6'd14 };
13'd3435  : q  = {   8'd223   ,  6'd15 };
13'd3436  : q  = {   8'd76    ,  6'd35 };
13'd3437  : q  = {   8'd223   ,  6'd17 };
13'd3438  : q  = {   8'd83    ,  6'd5  };
13'd3439  : q  = {   8'd223   ,  6'd19 };
13'd3440  : q  = {   8'd223   ,  6'd20 };
13'd3441  : q  = {   8'd223   ,  6'd21 };
13'd3442  : q  = {   8'd101   ,  6'd31 };
13'd3443  : q  = {   8'd223   ,  6'd23 };
13'd3444  : q  = {   8'd223   ,  6'd24 };
13'd3445  : q  = {   8'd223   ,  6'd25 };
13'd3446  : q  = {   8'd223   ,  6'd26 };
13'd3447  : q  = {   8'd63    ,  6'd7  };
13'd3448  : q  = {   8'd223   ,  6'd28 };
13'd3449  : q  = {   8'd27    ,  6'd27 };
13'd3450  : q  = {   8'd223   ,  6'd30 };
13'd3451  : q  = {   8'd34    ,  6'd34 };
13'd3452  : q  = {   8'd111   ,  6'd10 };
13'd3453  : q  = {   8'd223   ,  6'd33 };
13'd3454  : q  = {   8'd127   ,  6'd35 };
13'd3455  : q  = {   8'd37    ,  6'd20 };
13'd3456  : q  = {   8'd224   ,  6'd0  };
13'd3457  : q  = {   8'd224   ,  6'd1  };
13'd3458  : q  = {   8'd21    ,  6'd23 };
13'd3459  : q  = {   8'd27    ,  6'd28 };
13'd3460  : q  = {   8'd224   ,  6'd4  };
13'd3461  : q  = {   8'd224   ,  6'd5  };
13'd3462  : q  = {   8'd224   ,  6'd6  };
13'd3463  : q  = {   8'd224   ,  6'd7  };
13'd3464  : q  = {   8'd224   ,  6'd8  };
13'd3465  : q  = {   8'd102   ,  6'd4  };
13'd3466  : q  = {   8'd83    ,  6'd8  };
13'd3467  : q  = {   8'd27    ,  6'd29 };
13'd3468  : q  = {   8'd21    ,  6'd24 };
13'd3469  : q  = {   8'd224   ,  6'd13 };
13'd3470  : q  = {   8'd224   ,  6'd14 };
13'd3471  : q  = {   8'd224   ,  6'd15 };
13'd3472  : q  = {   8'd224   ,  6'd16 };
13'd3473  : q  = {   8'd224   ,  6'd17 };
13'd3474  : q  = {   8'd224   ,  6'd18 };
13'd3475  : q  = {   8'd63    ,  6'd11 };
13'd3476  : q  = {   8'd224   ,  6'd20 };
13'd3477  : q  = {   8'd224   ,  6'd21 };
13'd3478  : q  = {   8'd63    ,  6'd12 };
13'd3479  : q  = {   8'd224   ,  6'd23 };
13'd3480  : q  = {   8'd224   ,  6'd24 };
13'd3481  : q  = {   8'd224   ,  6'd25 };
13'd3482  : q  = {   8'd120   ,  6'd1  };
13'd3483  : q  = {   8'd71    ,  6'd23 };
13'd3484  : q  = {   8'd224   ,  6'd28 };
13'd3485  : q  = {   8'd224   ,  6'd29 };
13'd3486  : q  = {   8'd118   ,  6'd6  };
13'd3487  : q  = {   8'd89    ,  6'd15 };
13'd3488  : q  = {   8'd224   ,  6'd32 };
13'd3489  : q  = {   8'd224   ,  6'd33 };
13'd3490  : q  = {   8'd124   ,  6'd12 };
13'd3491  : q  = {   8'd224   ,  6'd35 };
13'd3492  : q  = {   8'd225   ,  6'd0  };
13'd3493  : q  = {   8'd225   ,  6'd1  };
13'd3494  : q  = {   8'd63    ,  6'd15 };
13'd3495  : q  = {   8'd2     ,  6'd23 };
13'd3496  : q  = {   8'd225   ,  6'd4  };
13'd3497  : q  = {   8'd111   ,  6'd24 };
13'd3498  : q  = {   8'd127   ,  6'd31 };
13'd3499  : q  = {   8'd225   ,  6'd7  };
13'd3500  : q  = {   8'd225   ,  6'd8  };
13'd3501  : q  = {   8'd225   ,  6'd9  };
13'd3502  : q  = {   8'd225   ,  6'd10 };
13'd3503  : q  = {   8'd105   ,  6'd15 };
13'd3504  : q  = {   8'd100   ,  6'd11 };
13'd3505  : q  = {   8'd225   ,  6'd13 };
13'd3506  : q  = {   8'd225   ,  6'd14 };
13'd3507  : q  = {   8'd0     ,  6'd6  };
13'd3508  : q  = {   8'd85    ,  6'd8  };
13'd3509  : q  = {   8'd225   ,  6'd17 };
13'd3510  : q  = {   8'd74    ,  6'd1  };
13'd3511  : q  = {   8'd112   ,  6'd6  };
13'd3512  : q  = {   8'd225   ,  6'd20 };
13'd3513  : q  = {   8'd225   ,  6'd21 };
13'd3514  : q  = {   8'd63    ,  6'd19 };
13'd3515  : q  = {   8'd5     ,  6'd6  };
13'd3516  : q  = {   8'd27    ,  6'd30 };
13'd3517  : q  = {   8'd225   ,  6'd25 };
13'd3518  : q  = {   8'd225   ,  6'd26 };
13'd3519  : q  = {   8'd225   ,  6'd27 };
13'd3520  : q  = {   8'd225   ,  6'd28 };
13'd3521  : q  = {   8'd225   ,  6'd29 };
13'd3522  : q  = {   8'd225   ,  6'd30 };
13'd3523  : q  = {   8'd97    ,  6'd21 };
13'd3524  : q  = {   8'd225   ,  6'd32 };
13'd3525  : q  = {   8'd225   ,  6'd33 };
13'd3526  : q  = {   8'd225   ,  6'd34 };
13'd3527  : q  = {   8'd225   ,  6'd35 };
13'd3528  : q  = {   8'd226   ,  6'd0  };
13'd3529  : q  = {   8'd226   ,  6'd1  };
13'd3530  : q  = {   8'd21    ,  6'd28 };
13'd3531  : q  = {   8'd226   ,  6'd3  };
13'd3532  : q  = {   8'd83    ,  6'd11 };
13'd3533  : q  = {   8'd73    ,  6'd28 };
13'd3534  : q  = {   8'd226   ,  6'd6  };
13'd3535  : q  = {   8'd226   ,  6'd7  };
13'd3536  : q  = {   8'd226   ,  6'd8  };
13'd3537  : q  = {   8'd226   ,  6'd9  };
13'd3538  : q  = {   8'd226   ,  6'd10 };
13'd3539  : q  = {   8'd11    ,  6'd34 };
13'd3540  : q  = {   8'd63    ,  6'd22 };
13'd3541  : q  = {   8'd226   ,  6'd13 };
13'd3542  : q  = {   8'd226   ,  6'd14 };
13'd3543  : q  = {   8'd226   ,  6'd15 };
13'd3544  : q  = {   8'd226   ,  6'd16 };
13'd3545  : q  = {   8'd226   ,  6'd17 };
13'd3546  : q  = {   8'd226   ,  6'd18 };
13'd3547  : q  = {   8'd36    ,  6'd31 };
13'd3548  : q  = {   8'd127   ,  6'd11 };
13'd3549  : q  = {   8'd83    ,  6'd12 };
13'd3550  : q  = {   8'd63    ,  6'd23 };
13'd3551  : q  = {   8'd226   ,  6'd23 };
13'd3552  : q  = {   8'd226   ,  6'd24 };
13'd3553  : q  = {   8'd226   ,  6'd25 };
13'd3554  : q  = {   8'd226   ,  6'd26 };
13'd3555  : q  = {   8'd63    ,  6'd24 };
13'd3556  : q  = {   8'd226   ,  6'd28 };
13'd3557  : q  = {   8'd226   ,  6'd29 };
13'd3558  : q  = {   8'd226   ,  6'd30 };
13'd3559  : q  = {   8'd30    ,  6'd23 };
13'd3560  : q  = {   8'd125   ,  6'd24 };
13'd3561  : q  = {   8'd226   ,  6'd33 };
13'd3562  : q  = {   8'd226   ,  6'd34 };
13'd3563  : q  = {   8'd226   ,  6'd35 };
13'd3564  : q  = {   8'd227   ,  6'd0  };
13'd3565  : q  = {   8'd227   ,  6'd1  };
13'd3566  : q  = {   8'd21    ,  6'd29 };
13'd3567  : q  = {   8'd68    ,  6'd22 };
13'd3568  : q  = {   8'd63    ,  6'd27 };
13'd3569  : q  = {   8'd227   ,  6'd5  };
13'd3570  : q  = {   8'd227   ,  6'd6  };
13'd3571  : q  = {   8'd122   ,  6'd3  };
13'd3572  : q  = {   8'd227   ,  6'd8  };
13'd3573  : q  = {   8'd227   ,  6'd9  };
13'd3574  : q  = {   8'd227   ,  6'd10 };
13'd3575  : q  = {   8'd3     ,  6'd3  };
13'd3576  : q  = {   8'd21    ,  6'd30 };
13'd3577  : q  = {   8'd227   ,  6'd13 };
13'd3578  : q  = {   8'd227   ,  6'd14 };
13'd3579  : q  = {   8'd227   ,  6'd15 };
13'd3580  : q  = {   8'd123   ,  6'd15 };
13'd3581  : q  = {   8'd227   ,  6'd17 };
13'd3582  : q  = {   8'd227   ,  6'd18 };
13'd3583  : q  = {   8'd227   ,  6'd19 };
13'd3584  : q  = {   8'd227   ,  6'd20 };
13'd3585  : q  = {   8'd88    ,  6'd35 };
13'd3586  : q  = {   8'd63    ,  6'd29 };
13'd3587  : q  = {   8'd85    ,  6'd14 };
13'd3588  : q  = {   8'd227   ,  6'd24 };
13'd3589  : q  = {   8'd227   ,  6'd25 };
13'd3590  : q  = {   8'd227   ,  6'd26 };
13'd3591  : q  = {   8'd63    ,  6'd30 };
13'd3592  : q  = {   8'd227   ,  6'd28 };
13'd3593  : q  = {   8'd227   ,  6'd29 };
13'd3594  : q  = {   8'd227   ,  6'd30 };
13'd3595  : q  = {   8'd63    ,  6'd31 };
13'd3596  : q  = {   8'd227   ,  6'd32 };
13'd3597  : q  = {   8'd227   ,  6'd33 };
13'd3598  : q  = {   8'd227   ,  6'd34 };
13'd3599  : q  = {   8'd227   ,  6'd35 };
13'd3600  : q  = {   8'd228   ,  6'd0  };
13'd3601  : q  = {   8'd122   ,  6'd12 };
13'd3602  : q  = {   8'd63    ,  6'd33 };
13'd3603  : q  = {   8'd228   ,  6'd3  };
13'd3604  : q  = {   8'd228   ,  6'd4  };
13'd3605  : q  = {   8'd228   ,  6'd5  };
13'd3606  : q  = {   8'd88    ,  6'd5  };
13'd3607  : q  = {   8'd228   ,  6'd7  };
13'd3608  : q  = {   8'd228   ,  6'd8  };
13'd3609  : q  = {   8'd228   ,  6'd9  };
13'd3610  : q  = {   8'd228   ,  6'd10 };
13'd3611  : q  = {   8'd228   ,  6'd11 };
13'd3612  : q  = {   8'd228   ,  6'd12 };
13'd3613  : q  = {   8'd228   ,  6'd13 };
13'd3614  : q  = {   8'd23    ,  6'd4  };
13'd3615  : q  = {   8'd228   ,  6'd15 };
13'd3616  : q  = {   8'd83    ,  6'd14 };
13'd3617  : q  = {   8'd228   ,  6'd17 };
13'd3618  : q  = {   8'd228   ,  6'd18 };
13'd3619  : q  = {   8'd228   ,  6'd19 };
13'd3620  : q  = {   8'd228   ,  6'd20 };
13'd3621  : q  = {   8'd9     ,  6'd5  };
13'd3622  : q  = {   8'd21    ,  6'd32 };
13'd3623  : q  = {   8'd228   ,  6'd23 };
13'd3624  : q  = {   8'd228   ,  6'd24 };
13'd3625  : q  = {   8'd228   ,  6'd25 };
13'd3626  : q  = {   8'd64    ,  6'd1  };
13'd3627  : q  = {   8'd228   ,  6'd27 };
13'd3628  : q  = {   8'd228   ,  6'd28 };
13'd3629  : q  = {   8'd228   ,  6'd29 };
13'd3630  : q  = {   8'd228   ,  6'd30 };
13'd3631  : q  = {   8'd228   ,  6'd31 };
13'd3632  : q  = {   8'd228   ,  6'd32 };
13'd3633  : q  = {   8'd228   ,  6'd33 };
13'd3634  : q  = {   8'd228   ,  6'd34 };
13'd3635  : q  = {   8'd228   ,  6'd35 };
13'd3636  : q  = {   8'd229   ,  6'd0  };
13'd3637  : q  = {   8'd64    ,  6'd2  };
13'd3638  : q  = {   8'd64    ,  6'd3  };
13'd3639  : q  = {   8'd229   ,  6'd3  };
13'd3640  : q  = {   8'd229   ,  6'd4  };
13'd3641  : q  = {   8'd229   ,  6'd5  };
13'd3642  : q  = {   8'd77    ,  6'd1  };
13'd3643  : q  = {   8'd229   ,  6'd7  };
13'd3644  : q  = {   8'd229   ,  6'd8  };
13'd3645  : q  = {   8'd229   ,  6'd9  };
13'd3646  : q  = {   8'd105   ,  6'd2  };
13'd3647  : q  = {   8'd110   ,  6'd15 };
13'd3648  : q  = {   8'd11    ,  6'd23 };
13'd3649  : q  = {   8'd229   ,  6'd13 };
13'd3650  : q  = {   8'd229   ,  6'd14 };
13'd3651  : q  = {   8'd89    ,  6'd5  };
13'd3652  : q  = {   8'd229   ,  6'd16 };
13'd3653  : q  = {   8'd229   ,  6'd17 };
13'd3654  : q  = {   8'd34    ,  6'd26 };
13'd3655  : q  = {   8'd229   ,  6'd19 };
13'd3656  : q  = {   8'd229   ,  6'd20 };
13'd3657  : q  = {   8'd64    ,  6'd5  };
13'd3658  : q  = {   8'd229   ,  6'd22 };
13'd3659  : q  = {   8'd229   ,  6'd23 };
13'd3660  : q  = {   8'd79    ,  6'd33 };
13'd3661  : q  = {   8'd229   ,  6'd25 };
13'd3662  : q  = {   8'd64    ,  6'd6  };
13'd3663  : q  = {   8'd229   ,  6'd27 };
13'd3664  : q  = {   8'd30    ,  6'd28 };
13'd3665  : q  = {   8'd229   ,  6'd29 };
13'd3666  : q  = {   8'd229   ,  6'd30 };
13'd3667  : q  = {   8'd229   ,  6'd31 };
13'd3668  : q  = {   8'd229   ,  6'd32 };
13'd3669  : q  = {   8'd229   ,  6'd33 };
13'd3670  : q  = {   8'd229   ,  6'd34 };
13'd3671  : q  = {   8'd100   ,  6'd12 };
13'd3672  : q  = {   8'd230   ,  6'd0  };
13'd3673  : q  = {   8'd64    ,  6'd7  };
13'd3674  : q  = {   8'd230   ,  6'd2  };
13'd3675  : q  = {   8'd114   ,  6'd1  };
13'd3676  : q  = {   8'd230   ,  6'd4  };
13'd3677  : q  = {   8'd230   ,  6'd5  };
13'd3678  : q  = {   8'd64    ,  6'd8  };
13'd3679  : q  = {   8'd230   ,  6'd7  };
13'd3680  : q  = {   8'd230   ,  6'd8  };
13'd3681  : q  = {   8'd230   ,  6'd9  };
13'd3682  : q  = {   8'd230   ,  6'd10 };
13'd3683  : q  = {   8'd230   ,  6'd11 };
13'd3684  : q  = {   8'd230   ,  6'd12 };
13'd3685  : q  = {   8'd95    ,  6'd17 };
13'd3686  : q  = {   8'd103   ,  6'd23 };
13'd3687  : q  = {   8'd230   ,  6'd15 };
13'd3688  : q  = {   8'd230   ,  6'd16 };
13'd3689  : q  = {   8'd116   ,  6'd24 };
13'd3690  : q  = {   8'd32    ,  6'd26 };
13'd3691  : q  = {   8'd230   ,  6'd19 };
13'd3692  : q  = {   8'd230   ,  6'd20 };
13'd3693  : q  = {   8'd21    ,  6'd34 };
13'd3694  : q  = {   8'd230   ,  6'd22 };
13'd3695  : q  = {   8'd88    ,  6'd8  };
13'd3696  : q  = {   8'd230   ,  6'd24 };
13'd3697  : q  = {   8'd25    ,  6'd33 };
13'd3698  : q  = {   8'd230   ,  6'd26 };
13'd3699  : q  = {   8'd230   ,  6'd27 };
13'd3700  : q  = {   8'd32    ,  6'd3  };
13'd3701  : q  = {   8'd230   ,  6'd29 };
13'd3702  : q  = {   8'd230   ,  6'd30 };
13'd3703  : q  = {   8'd21    ,  6'd35 };
13'd3704  : q  = {   8'd83    ,  6'd15 };
13'd3705  : q  = {   8'd230   ,  6'd33 };
13'd3706  : q  = {   8'd230   ,  6'd34 };
13'd3707  : q  = {   8'd77    ,  6'd25 };
13'd3708  : q  = {   8'd64    ,  6'd11 };
13'd3709  : q  = {   8'd64    ,  6'd12 };
13'd3710  : q  = {   8'd231   ,  6'd2  };
13'd3711  : q  = {   8'd231   ,  6'd3  };
13'd3712  : q  = {   8'd71    ,  6'd24 };
13'd3713  : q  = {   8'd120   ,  6'd17 };
13'd3714  : q  = {   8'd83    ,  6'd16 };
13'd3715  : q  = {   8'd231   ,  6'd7  };
13'd3716  : q  = {   8'd231   ,  6'd8  };
13'd3717  : q  = {   8'd231   ,  6'd9  };
13'd3718  : q  = {   8'd231   ,  6'd10 };
13'd3719  : q  = {   8'd33    ,  6'd7  };
13'd3720  : q  = {   8'd97    ,  6'd11 };
13'd3721  : q  = {   8'd117   ,  6'd5  };
13'd3722  : q  = {   8'd94    ,  6'd4  };
13'd3723  : q  = {   8'd231   ,  6'd15 };
13'd3724  : q  = {   8'd231   ,  6'd16 };
13'd3725  : q  = {   8'd231   ,  6'd17 };
13'd3726  : q  = {   8'd231   ,  6'd18 };
13'd3727  : q  = {   8'd231   ,  6'd19 };
13'd3728  : q  = {   8'd231   ,  6'd20 };
13'd3729  : q  = {   8'd9     ,  6'd6  };
13'd3730  : q  = {   8'd92    ,  6'd31 };
13'd3731  : q  = {   8'd106   ,  6'd5  };
13'd3732  : q  = {   8'd84    ,  6'd31 };
13'd3733  : q  = {   8'd127   ,  6'd8  };
13'd3734  : q  = {   8'd231   ,  6'd26 };
13'd3735  : q  = {   8'd231   ,  6'd27 };
13'd3736  : q  = {   8'd231   ,  6'd28 };
13'd3737  : q  = {   8'd30    ,  6'd24 };
13'd3738  : q  = {   8'd231   ,  6'd30 };
13'd3739  : q  = {   8'd231   ,  6'd31 };
13'd3740  : q  = {   8'd22    ,  6'd1  };
13'd3741  : q  = {   8'd231   ,  6'd33 };
13'd3742  : q  = {   8'd231   ,  6'd34 };
13'd3743  : q  = {   8'd101   ,  6'd30 };
13'd3744  : q  = {   8'd64    ,  6'd18 };
13'd3745  : q  = {   8'd232   ,  6'd1  };
13'd3746  : q  = {   8'd29    ,  6'd20 };
13'd3747  : q  = {   8'd232   ,  6'd3  };
13'd3748  : q  = {   8'd9     ,  6'd7  };
13'd3749  : q  = {   8'd232   ,  6'd5  };
13'd3750  : q  = {   8'd36    ,  6'd25 };
13'd3751  : q  = {   8'd232   ,  6'd7  };
13'd3752  : q  = {   8'd232   ,  6'd8  };
13'd3753  : q  = {   8'd232   ,  6'd9  };
13'd3754  : q  = {   8'd22    ,  6'd3  };
13'd3755  : q  = {   8'd71    ,  6'd26 };
13'd3756  : q  = {   8'd117   ,  6'd18 };
13'd3757  : q  = {   8'd232   ,  6'd13 };
13'd3758  : q  = {   8'd232   ,  6'd14 };
13'd3759  : q  = {   8'd64    ,  6'd21 };
13'd3760  : q  = {   8'd232   ,  6'd16 };
13'd3761  : q  = {   8'd232   ,  6'd17 };
13'd3762  : q  = {   8'd232   ,  6'd18 };
13'd3763  : q  = {   8'd91    ,  6'd20 };
13'd3764  : q  = {   8'd38    ,  6'd14 };
13'd3765  : q  = {   8'd68    ,  6'd33 };
13'd3766  : q  = {   8'd120   ,  6'd3  };
13'd3767  : q  = {   8'd232   ,  6'd23 };
13'd3768  : q  = {   8'd232   ,  6'd24 };
13'd3769  : q  = {   8'd38    ,  6'd25 };
13'd3770  : q  = {   8'd103   ,  6'd3  };
13'd3771  : q  = {   8'd232   ,  6'd27 };
13'd3772  : q  = {   8'd232   ,  6'd28 };
13'd3773  : q  = {   8'd232   ,  6'd29 };
13'd3774  : q  = {   8'd232   ,  6'd30 };
13'd3775  : q  = {   8'd111   ,  6'd3  };
13'd3776  : q  = {   8'd103   ,  6'd4  };
13'd3777  : q  = {   8'd232   ,  6'd33 };
13'd3778  : q  = {   8'd232   ,  6'd34 };
13'd3779  : q  = {   8'd71    ,  6'd27 };
13'd3780  : q  = {   8'd233   ,  6'd0  };
13'd3781  : q  = {   8'd233   ,  6'd1  };
13'd3782  : q  = {   8'd233   ,  6'd2  };
13'd3783  : q  = {   8'd233   ,  6'd3  };
13'd3784  : q  = {   8'd64    ,  6'd24 };
13'd3785  : q  = {   8'd233   ,  6'd5  };
13'd3786  : q  = {   8'd233   ,  6'd6  };
13'd3787  : q  = {   8'd233   ,  6'd7  };
13'd3788  : q  = {   8'd233   ,  6'd8  };
13'd3789  : q  = {   8'd233   ,  6'd9  };
13'd3790  : q  = {   8'd233   ,  6'd10 };
13'd3791  : q  = {   8'd1     ,  6'd8  };
13'd3792  : q  = {   8'd64    ,  6'd25 };
13'd3793  : q  = {   8'd98    ,  6'd31 };
13'd3794  : q  = {   8'd233   ,  6'd14 };
13'd3795  : q  = {   8'd22    ,  6'd4  };
13'd3796  : q  = {   8'd233   ,  6'd16 };
13'd3797  : q  = {   8'd113   ,  6'd29 };
13'd3798  : q  = {   8'd115   ,  6'd3  };
13'd3799  : q  = {   8'd96    ,  6'd21 };
13'd3800  : q  = {   8'd233   ,  6'd20 };
13'd3801  : q  = {   8'd32    ,  6'd28 };
13'd3802  : q  = {   8'd233   ,  6'd22 };
13'd3803  : q  = {   8'd119   ,  6'd21 };
13'd3804  : q  = {   8'd233   ,  6'd24 };
13'd3805  : q  = {   8'd121   ,  6'd18 };
13'd3806  : q  = {   8'd71    ,  6'd28 };
13'd3807  : q  = {   8'd233   ,  6'd27 };
13'd3808  : q  = {   8'd39    ,  6'd14 };
13'd3809  : q  = {   8'd233   ,  6'd29 };
13'd3810  : q  = {   8'd96    ,  6'd34 };
13'd3811  : q  = {   8'd124   ,  6'd6  };
13'd3812  : q  = {   8'd233   ,  6'd32 };
13'd3813  : q  = {   8'd233   ,  6'd33 };
13'd3814  : q  = {   8'd233   ,  6'd34 };
13'd3815  : q  = {   8'd102   ,  6'd31 };
13'd3816  : q  = {   8'd33    ,  6'd31 };
13'd3817  : q  = {   8'd33    ,  6'd32 };
13'd3818  : q  = {   8'd234   ,  6'd2  };
13'd3819  : q  = {   8'd71    ,  6'd30 };
13'd3820  : q  = {   8'd22    ,  6'd5  };
13'd3821  : q  = {   8'd234   ,  6'd5  };
13'd3822  : q  = {   8'd64    ,  6'd29 };
13'd3823  : q  = {   8'd234   ,  6'd7  };
13'd3824  : q  = {   8'd120   ,  6'd6  };
13'd3825  : q  = {   8'd234   ,  6'd9  };
13'd3826  : q  = {   8'd77    ,  6'd3  };
13'd3827  : q  = {   8'd234   ,  6'd11 };
13'd3828  : q  = {   8'd83    ,  6'd18 };
13'd3829  : q  = {   8'd5     ,  6'd23 };
13'd3830  : q  = {   8'd94    ,  6'd5  };
13'd3831  : q  = {   8'd64    ,  6'd30 };
13'd3832  : q  = {   8'd234   ,  6'd16 };
13'd3833  : q  = {   8'd234   ,  6'd17 };
13'd3834  : q  = {   8'd31    ,  6'd0  };
13'd3835  : q  = {   8'd103   ,  6'd15 };
13'd3836  : q  = {   8'd234   ,  6'd20 };
13'd3837  : q  = {   8'd64    ,  6'd31 };
13'd3838  : q  = {   8'd234   ,  6'd22 };
13'd3839  : q  = {   8'd234   ,  6'd23 };
13'd3840  : q  = {   8'd71    ,  6'd31 };
13'd3841  : q  = {   8'd234   ,  6'd25 };
13'd3842  : q  = {   8'd71    ,  6'd32 };
13'd3843  : q  = {   8'd234   ,  6'd27 };
13'd3844  : q  = {   8'd38    ,  6'd16 };
13'd3845  : q  = {   8'd234   ,  6'd29 };
13'd3846  : q  = {   8'd234   ,  6'd30 };
13'd3847  : q  = {   8'd64    ,  6'd32 };
13'd3848  : q  = {   8'd77    ,  6'd4  };
13'd3849  : q  = {   8'd234   ,  6'd33 };
13'd3850  : q  = {   8'd234   ,  6'd34 };
13'd3851  : q  = {   8'd71    ,  6'd33 };
13'd3852  : q  = {   8'd64    ,  6'd33 };
13'd3853  : q  = {   8'd235   ,  6'd1  };
13'd3854  : q  = {   8'd83    ,  6'd19 };
13'd3855  : q  = {   8'd79    ,  6'd31 };
13'd3856  : q  = {   8'd94    ,  6'd13 };
13'd3857  : q  = {   8'd235   ,  6'd5  };
13'd3858  : q  = {   8'd83    ,  6'd20 };
13'd3859  : q  = {   8'd235   ,  6'd7  };
13'd3860  : q  = {   8'd235   ,  6'd8  };
13'd3861  : q  = {   8'd235   ,  6'd9  };
13'd3862  : q  = {   8'd235   ,  6'd10 };
13'd3863  : q  = {   8'd235   ,  6'd11 };
13'd3864  : q  = {   8'd89    ,  6'd18 };
13'd3865  : q  = {   8'd99    ,  6'd5  };
13'd3866  : q  = {   8'd235   ,  6'd14 };
13'd3867  : q  = {   8'd235   ,  6'd15 };
13'd3868  : q  = {   8'd235   ,  6'd16 };
13'd3869  : q  = {   8'd235   ,  6'd17 };
13'd3870  : q  = {   8'd91    ,  6'd35 };
13'd3871  : q  = {   8'd31    ,  6'd23 };
13'd3872  : q  = {   8'd235   ,  6'd20 };
13'd3873  : q  = {   8'd12    ,  6'd5  };
13'd3874  : q  = {   8'd235   ,  6'd22 };
13'd3875  : q  = {   8'd235   ,  6'd23 };
13'd3876  : q  = {   8'd30    ,  6'd25 };
13'd3877  : q  = {   8'd94    ,  6'd8  };
13'd3878  : q  = {   8'd71    ,  6'd35 };
13'd3879  : q  = {   8'd22    ,  6'd6  };
13'd3880  : q  = {   8'd123   ,  6'd34 };
13'd3881  : q  = {   8'd235   ,  6'd29 };
13'd3882  : q  = {   8'd235   ,  6'd30 };
13'd3883  : q  = {   8'd235   ,  6'd31 };
13'd3884  : q  = {   8'd235   ,  6'd32 };
13'd3885  : q  = {   8'd29    ,  6'd23 };
13'd3886  : q  = {   8'd235   ,  6'd34 };
13'd3887  : q  = {   8'd235   ,  6'd35 };
13'd3888  : q  = {   8'd77    ,  6'd5  };
13'd3889  : q  = {   8'd65    ,  6'd1  };
13'd3890  : q  = {   8'd27    ,  6'd32 };
13'd3891  : q  = {   8'd112   ,  6'd15 };
13'd3892  : q  = {   8'd24    ,  6'd9  };
13'd3893  : q  = {   8'd236   ,  6'd5  };
13'd3894  : q  = {   8'd236   ,  6'd6  };
13'd3895  : q  = {   8'd236   ,  6'd7  };
13'd3896  : q  = {   8'd65    ,  6'd2  };
13'd3897  : q  = {   8'd236   ,  6'd9  };
13'd3898  : q  = {   8'd236   ,  6'd10 };
13'd3899  : q  = {   8'd236   ,  6'd11 };
13'd3900  : q  = {   8'd236   ,  6'd12 };
13'd3901  : q  = {   8'd84    ,  6'd0  };
13'd3902  : q  = {   8'd35    ,  6'd31 };
13'd3903  : q  = {   8'd236   ,  6'd15 };
13'd3904  : q  = {   8'd105   ,  6'd17 };
13'd3905  : q  = {   8'd236   ,  6'd17 };
13'd3906  : q  = {   8'd236   ,  6'd18 };
13'd3907  : q  = {   8'd118   ,  6'd15 };
13'd3908  : q  = {   8'd236   ,  6'd20 };
13'd3909  : q  = {   8'd236   ,  6'd21 };
13'd3910  : q  = {   8'd236   ,  6'd22 };
13'd3911  : q  = {   8'd65    ,  6'd3  };
13'd3912  : q  = {   8'd236   ,  6'd24 };
13'd3913  : q  = {   8'd236   ,  6'd25 };
13'd3914  : q  = {   8'd112   ,  6'd1  };
13'd3915  : q  = {   8'd72    ,  6'd1  };
13'd3916  : q  = {   8'd236   ,  6'd28 };
13'd3917  : q  = {   8'd3     ,  6'd5  };
13'd3918  : q  = {   8'd236   ,  6'd30 };
13'd3919  : q  = {   8'd22    ,  6'd8  };
13'd3920  : q  = {   8'd236   ,  6'd32 };
13'd3921  : q  = {   8'd101   ,  6'd11 };
13'd3922  : q  = {   8'd236   ,  6'd34 };
13'd3923  : q  = {   8'd236   ,  6'd35 };
13'd3924  : q  = {   8'd65    ,  6'd5  };
13'd3925  : q  = {   8'd65    ,  6'd6  };
13'd3926  : q  = {   8'd237   ,  6'd2  };
13'd3927  : q  = {   8'd237   ,  6'd3  };
13'd3928  : q  = {   8'd237   ,  6'd4  };
13'd3929  : q  = {   8'd237   ,  6'd5  };
13'd3930  : q  = {   8'd103   ,  6'd22 };
13'd3931  : q  = {   8'd237   ,  6'd7  };
13'd3932  : q  = {   8'd65    ,  6'd7  };
13'd3933  : q  = {   8'd237   ,  6'd9  };
13'd3934  : q  = {   8'd237   ,  6'd10 };
13'd3935  : q  = {   8'd237   ,  6'd11 };
13'd3936  : q  = {   8'd101   ,  6'd12 };
13'd3937  : q  = {   8'd237   ,  6'd13 };
13'd3938  : q  = {   8'd237   ,  6'd14 };
13'd3939  : q  = {   8'd237   ,  6'd15 };
13'd3940  : q  = {   8'd237   ,  6'd16 };
13'd3941  : q  = {   8'd237   ,  6'd17 };
13'd3942  : q  = {   8'd237   ,  6'd18 };
13'd3943  : q  = {   8'd108   ,  6'd19 };
13'd3944  : q  = {   8'd27    ,  6'd0  };
13'd3945  : q  = {   8'd77    ,  6'd6  };
13'd3946  : q  = {   8'd237   ,  6'd22 };
13'd3947  : q  = {   8'd237   ,  6'd23 };
13'd3948  : q  = {   8'd237   ,  6'd24 };
13'd3949  : q  = {   8'd85    ,  6'd9  };
13'd3950  : q  = {   8'd23    ,  6'd1  };
13'd3951  : q  = {   8'd9     ,  6'd32 };
13'd3952  : q  = {   8'd237   ,  6'd28 };
13'd3953  : q  = {   8'd110   ,  6'd30 };
13'd3954  : q  = {   8'd237   ,  6'd30 };
13'd3955  : q  = {   8'd123   ,  6'd30 };
13'd3956  : q  = {   8'd237   ,  6'd32 };
13'd3957  : q  = {   8'd72    ,  6'd3  };
13'd3958  : q  = {   8'd237   ,  6'd34 };
13'd3959  : q  = {   8'd91    ,  6'd25 };
13'd3960  : q  = {   8'd22    ,  6'd9  };
13'd3961  : q  = {   8'd6     ,  6'd6  };
13'd3962  : q  = {   8'd238   ,  6'd2  };
13'd3963  : q  = {   8'd238   ,  6'd3  };
13'd3964  : q  = {   8'd238   ,  6'd4  };
13'd3965  : q  = {   8'd111   ,  6'd31 };
13'd3966  : q  = {   8'd238   ,  6'd6  };
13'd3967  : q  = {   8'd238   ,  6'd7  };
13'd3968  : q  = {   8'd238   ,  6'd8  };
13'd3969  : q  = {   8'd238   ,  6'd9  };
13'd3970  : q  = {   8'd39    ,  6'd31 };
13'd3971  : q  = {   8'd238   ,  6'd11 };
13'd3972  : q  = {   8'd238   ,  6'd12 };
13'd3973  : q  = {   8'd238   ,  6'd13 };
13'd3974  : q  = {   8'd88    ,  6'd15 };
13'd3975  : q  = {   8'd238   ,  6'd15 };
13'd3976  : q  = {   8'd238   ,  6'd16 };
13'd3977  : q  = {   8'd238   ,  6'd17 };
13'd3978  : q  = {   8'd238   ,  6'd18 };
13'd3979  : q  = {   8'd27    ,  6'd34 };
13'd3980  : q  = {   8'd238   ,  6'd20 };
13'd3981  : q  = {   8'd9     ,  6'd8  };
13'd3982  : q  = {   8'd238   ,  6'd22 };
13'd3983  : q  = {   8'd238   ,  6'd23 };
13'd3984  : q  = {   8'd238   ,  6'd24 };
13'd3985  : q  = {   8'd238   ,  6'd25 };
13'd3986  : q  = {   8'd238   ,  6'd26 };
13'd3987  : q  = {   8'd80    ,  6'd34 };
13'd3988  : q  = {   8'd238   ,  6'd28 };
13'd3989  : q  = {   8'd107   ,  6'd12 };
13'd3990  : q  = {   8'd238   ,  6'd30 };
13'd3991  : q  = {   8'd65    ,  6'd11 };
13'd3992  : q  = {   8'd238   ,  6'd32 };
13'd3993  : q  = {   8'd106   ,  6'd27 };
13'd3994  : q  = {   8'd238   ,  6'd34 };
13'd3995  : q  = {   8'd36    ,  6'd28 };
13'd3996  : q  = {   8'd65    ,  6'd12 };
13'd3997  : q  = {   8'd239   ,  6'd1  };
13'd3998  : q  = {   8'd239   ,  6'd2  };
13'd3999  : q  = {   8'd29    ,  6'd24 };
13'd4000  : q  = {   8'd239   ,  6'd4  };
13'd4001  : q  = {   8'd80    ,  6'd28 };
13'd4002  : q  = {   8'd239   ,  6'd6  };
13'd4003  : q  = {   8'd239   ,  6'd7  };
13'd4004  : q  = {   8'd239   ,  6'd8  };
13'd4005  : q  = {   8'd239   ,  6'd9  };
13'd4006  : q  = {   8'd239   ,  6'd10 };
13'd4007  : q  = {   8'd239   ,  6'd11 };
13'd4008  : q  = {   8'd239   ,  6'd12 };
13'd4009  : q  = {   8'd13    ,  6'd4  };
13'd4010  : q  = {   8'd239   ,  6'd14 };
13'd4011  : q  = {   8'd10    ,  6'd3  };
13'd4012  : q  = {   8'd239   ,  6'd16 };
13'd4013  : q  = {   8'd239   ,  6'd17 };
13'd4014  : q  = {   8'd239   ,  6'd18 };
13'd4015  : q  = {   8'd111   ,  6'd17 };
13'd4016  : q  = {   8'd239   ,  6'd20 };
13'd4017  : q  = {   8'd4     ,  6'd18 };
13'd4018  : q  = {   8'd239   ,  6'd22 };
13'd4019  : q  = {   8'd84    ,  6'd13 };
13'd4020  : q  = {   8'd72    ,  6'd5  };
13'd4021  : q  = {   8'd239   ,  6'd25 };
13'd4022  : q  = {   8'd72    ,  6'd6  };
13'd4023  : q  = {   8'd239   ,  6'd27 };
13'd4024  : q  = {   8'd239   ,  6'd28 };
13'd4025  : q  = {   8'd239   ,  6'd29 };
13'd4026  : q  = {   8'd239   ,  6'd30 };
13'd4027  : q  = {   8'd34    ,  6'd20 };
13'd4028  : q  = {   8'd65    ,  6'd16 };
13'd4029  : q  = {   8'd239   ,  6'd33 };
13'd4030  : q  = {   8'd239   ,  6'd34 };
13'd4031  : q  = {   8'd72    ,  6'd7  };
13'd4032  : q  = {   8'd22    ,  6'd12 };
13'd4033  : q  = {   8'd240   ,  6'd1  };
13'd4034  : q  = {   8'd240   ,  6'd2  };
13'd4035  : q  = {   8'd240   ,  6'd3  };
13'd4036  : q  = {   8'd240   ,  6'd4  };
13'd4037  : q  = {   8'd65    ,  6'd18 };
13'd4038  : q  = {   8'd240   ,  6'd6  };
13'd4039  : q  = {   8'd240   ,  6'd7  };
13'd4040  : q  = {   8'd240   ,  6'd8  };
13'd4041  : q  = {   8'd240   ,  6'd9  };
13'd4042  : q  = {   8'd240   ,  6'd10 };
13'd4043  : q  = {   8'd11    ,  6'd3  };
13'd4044  : q  = {   8'd240   ,  6'd12 };
13'd4045  : q  = {   8'd240   ,  6'd13 };
13'd4046  : q  = {   8'd34    ,  6'd28 };
13'd4047  : q  = {   8'd240   ,  6'd15 };
13'd4048  : q  = {   8'd240   ,  6'd16 };
13'd4049  : q  = {   8'd240   ,  6'd17 };
13'd4050  : q  = {   8'd240   ,  6'd18 };
13'd4051  : q  = {   8'd83    ,  6'd30 };
13'd4052  : q  = {   8'd240   ,  6'd20 };
13'd4053  : q  = {   8'd77    ,  6'd8  };
13'd4054  : q  = {   8'd240   ,  6'd22 };
13'd4055  : q  = {   8'd240   ,  6'd23 };
13'd4056  : q  = {   8'd72    ,  6'd8  };
13'd4057  : q  = {   8'd240   ,  6'd25 };
13'd4058  : q  = {   8'd79    ,  6'd4  };
13'd4059  : q  = {   8'd2     ,  6'd21 };
13'd4060  : q  = {   8'd125   ,  6'd15 };
13'd4061  : q  = {   8'd240   ,  6'd29 };
13'd4062  : q  = {   8'd240   ,  6'd30 };
13'd4063  : q  = {   8'd22    ,  6'd14 };
13'd4064  : q  = {   8'd65    ,  6'd21 };
13'd4065  : q  = {   8'd240   ,  6'd33 };
13'd4066  : q  = {   8'd240   ,  6'd34 };
13'd4067  : q  = {   8'd240   ,  6'd35 };
13'd4068  : q  = {   8'd65    ,  6'd22 };
13'd4069  : q  = {   8'd241   ,  6'd1  };
13'd4070  : q  = {   8'd241   ,  6'd2  };
13'd4071  : q  = {   8'd98    ,  6'd22 };
13'd4072  : q  = {   8'd241   ,  6'd4  };
13'd4073  : q  = {   8'd241   ,  6'd5  };
13'd4074  : q  = {   8'd241   ,  6'd6  };
13'd4075  : q  = {   8'd241   ,  6'd7  };
13'd4076  : q  = {   8'd65    ,  6'd23 };
13'd4077  : q  = {   8'd241   ,  6'd9  };
13'd4078  : q  = {   8'd241   ,  6'd10 };
13'd4079  : q  = {   8'd241   ,  6'd11 };
13'd4080  : q  = {   8'd241   ,  6'd12 };
13'd4081  : q  = {   8'd98    ,  6'd27 };
13'd4082  : q  = {   8'd74    ,  6'd12 };
13'd4083  : q  = {   8'd65    ,  6'd24 };
13'd4084  : q  = {   8'd241   ,  6'd16 };
13'd4085  : q  = {   8'd241   ,  6'd17 };
13'd4086  : q  = {   8'd241   ,  6'd18 };
13'd4087  : q  = {   8'd103   ,  6'd5  };
13'd4088  : q  = {   8'd241   ,  6'd20 };
13'd4089  : q  = {   8'd25    ,  6'd35 };
13'd4090  : q  = {   8'd91    ,  6'd26 };
13'd4091  : q  = {   8'd121   ,  6'd29 };
13'd4092  : q  = {   8'd241   ,  6'd24 };
13'd4093  : q  = {   8'd241   ,  6'd25 };
13'd4094  : q  = {   8'd72    ,  6'd9  };
13'd4095  : q  = {   8'd241   ,  6'd27 };
13'd4096  : q  = {   8'd241   ,  6'd28 };
13'd4097  : q  = {   8'd241   ,  6'd29 };
13'd4098  : q  = {   8'd241   ,  6'd30 };
13'd4099  : q  = {   8'd241   ,  6'd31 };
13'd4100  : q  = {   8'd65    ,  6'd25 };
13'd4101  : q  = {   8'd241   ,  6'd33 };
13'd4102  : q  = {   8'd241   ,  6'd34 };
13'd4103  : q  = {   8'd241   ,  6'd35 };
13'd4104  : q  = {   8'd22    ,  6'd15 };
13'd4105  : q  = {   8'd242   ,  6'd1  };
13'd4106  : q  = {   8'd242   ,  6'd2  };
13'd4107  : q  = {   8'd100   ,  6'd8  };
13'd4108  : q  = {   8'd242   ,  6'd4  };
13'd4109  : q  = {   8'd65    ,  6'd27 };
13'd4110  : q  = {   8'd242   ,  6'd6  };
13'd4111  : q  = {   8'd9     ,  6'd33 };
13'd4112  : q  = {   8'd242   ,  6'd8  };
13'd4113  : q  = {   8'd242   ,  6'd9  };
13'd4114  : q  = {   8'd73    ,  6'd8  };
13'd4115  : q  = {   8'd242   ,  6'd11 };
13'd4116  : q  = {   8'd242   ,  6'd12 };
13'd4117  : q  = {   8'd24    ,  6'd12 };
13'd4118  : q  = {   8'd101   ,  6'd33 };
13'd4119  : q  = {   8'd242   ,  6'd15 };
13'd4120  : q  = {   8'd242   ,  6'd16 };
13'd4121  : q  = {   8'd242   ,  6'd17 };
13'd4122  : q  = {   8'd242   ,  6'd18 };
13'd4123  : q  = {   8'd72    ,  6'd12 };
13'd4124  : q  = {   8'd242   ,  6'd20 };
13'd4125  : q  = {   8'd10    ,  6'd22 };
13'd4126  : q  = {   8'd242   ,  6'd22 };
13'd4127  : q  = {   8'd242   ,  6'd23 };
13'd4128  : q  = {   8'd22    ,  6'd32 };
13'd4129  : q  = {   8'd242   ,  6'd25 };
13'd4130  : q  = {   8'd14    ,  6'd4  };
13'd4131  : q  = {   8'd72    ,  6'd15 };
13'd4132  : q  = {   8'd242   ,  6'd28 };
13'd4133  : q  = {   8'd38    ,  6'd33 };
13'd4134  : q  = {   8'd242   ,  6'd30 };
13'd4135  : q  = {   8'd22    ,  6'd16 };
13'd4136  : q  = {   8'd242   ,  6'd32 };
13'd4137  : q  = {   8'd242   ,  6'd33 };
13'd4138  : q  = {   8'd242   ,  6'd34 };
13'd4139  : q  = {   8'd242   ,  6'd35 };
13'd4140  : q  = {   8'd65    ,  6'd29 };
13'd4141  : q  = {   8'd65    ,  6'd30 };
13'd4142  : q  = {   8'd243   ,  6'd2  };
13'd4143  : q  = {   8'd243   ,  6'd3  };
13'd4144  : q  = {   8'd243   ,  6'd4  };
13'd4145  : q  = {   8'd72    ,  6'd16 };
13'd4146  : q  = {   8'd243   ,  6'd6  };
13'd4147  : q  = {   8'd67    ,  6'd24 };
13'd4148  : q  = {   8'd65    ,  6'd31 };
13'd4149  : q  = {   8'd243   ,  6'd9  };
13'd4150  : q  = {   8'd243   ,  6'd10 };
13'd4151  : q  = {   8'd243   ,  6'd11 };
13'd4152  : q  = {   8'd97    ,  6'd5  };
13'd4153  : q  = {   8'd243   ,  6'd13 };
13'd4154  : q  = {   8'd243   ,  6'd14 };
13'd4155  : q  = {   8'd80    ,  6'd1  };
13'd4156  : q  = {   8'd88    ,  6'd18 };
13'd4157  : q  = {   8'd243   ,  6'd17 };
13'd4158  : q  = {   8'd12    ,  6'd27 };
13'd4159  : q  = {   8'd27    ,  6'd3  };
13'd4160  : q  = {   8'd26    ,  6'd1  };
13'd4161  : q  = {   8'd243   ,  6'd21 };
13'd4162  : q  = {   8'd243   ,  6'd22 };
13'd4163  : q  = {   8'd243   ,  6'd23 };
13'd4164  : q  = {   8'd243   ,  6'd24 };
13'd4165  : q  = {   8'd12    ,  6'd25 };
13'd4166  : q  = {   8'd123   ,  6'd18 };
13'd4167  : q  = {   8'd24    ,  6'd14 };
13'd4168  : q  = {   8'd243   ,  6'd28 };
13'd4169  : q  = {   8'd101   ,  6'd27 };
13'd4170  : q  = {   8'd243   ,  6'd30 };
13'd4171  : q  = {   8'd65    ,  6'd33 };
13'd4172  : q  = {   8'd72    ,  6'd18 };
13'd4173  : q  = {   8'd243   ,  6'd33 };
13'd4174  : q  = {   8'd243   ,  6'd34 };
13'd4175  : q  = {   8'd115   ,  6'd30 };
13'd4176  : q  = {   8'd65    ,  6'd34 };
13'd4177  : q  = {   8'd244   ,  6'd1  };
13'd4178  : q  = {   8'd244   ,  6'd2  };
13'd4179  : q  = {   8'd79    ,  6'd6  };
13'd4180  : q  = {   8'd244   ,  6'd4  };
13'd4181  : q  = {   8'd244   ,  6'd5  };
13'd4182  : q  = {   8'd244   ,  6'd6  };
13'd4183  : q  = {   8'd244   ,  6'd7  };
13'd4184  : q  = {   8'd77    ,  6'd12 };
13'd4185  : q  = {   8'd244   ,  6'd9  };
13'd4186  : q  = {   8'd244   ,  6'd10 };
13'd4187  : q  = {   8'd244   ,  6'd11 };
13'd4188  : q  = {   8'd244   ,  6'd12 };
13'd4189  : q  = {   8'd89    ,  6'd27 };
13'd4190  : q  = {   8'd9     ,  6'd11 };
13'd4191  : q  = {   8'd244   ,  6'd15 };
13'd4192  : q  = {   8'd97    ,  6'd10 };
13'd4193  : q  = {   8'd22    ,  6'd18 };
13'd4194  : q  = {   8'd91    ,  6'd27 };
13'd4195  : q  = {   8'd118   ,  6'd23 };
13'd4196  : q  = {   8'd67    ,  6'd22 };
13'd4197  : q  = {   8'd66    ,  6'd1  };
13'd4198  : q  = {   8'd244   ,  6'd22 };
13'd4199  : q  = {   8'd244   ,  6'd23 };
13'd4200  : q  = {   8'd244   ,  6'd24 };
13'd4201  : q  = {   8'd244   ,  6'd25 };
13'd4202  : q  = {   8'd95    ,  6'd0  };
13'd4203  : q  = {   8'd244   ,  6'd27 };
13'd4204  : q  = {   8'd244   ,  6'd28 };
13'd4205  : q  = {   8'd244   ,  6'd29 };
13'd4206  : q  = {   8'd124   ,  6'd17 };
13'd4207  : q  = {   8'd66    ,  6'd3  };
13'd4208  : q  = {   8'd32    ,  6'd31 };
13'd4209  : q  = {   8'd244   ,  6'd33 };
13'd4210  : q  = {   8'd244   ,  6'd34 };
13'd4211  : q  = {   8'd97    ,  6'd6  };
13'd4212  : q  = {   8'd9     ,  6'd12 };
13'd4213  : q  = {   8'd245   ,  6'd1  };
13'd4214  : q  = {   8'd245   ,  6'd2  };
13'd4215  : q  = {   8'd24    ,  6'd16 };
13'd4216  : q  = {   8'd113   ,  6'd32 };
13'd4217  : q  = {   8'd66    ,  6'd5  };
13'd4218  : q  = {   8'd245   ,  6'd6  };
13'd4219  : q  = {   8'd10    ,  6'd33 };
13'd4220  : q  = {   8'd245   ,  6'd8  };
13'd4221  : q  = {   8'd245   ,  6'd9  };
13'd4222  : q  = {   8'd245   ,  6'd10 };
13'd4223  : q  = {   8'd245   ,  6'd11 };
13'd4224  : q  = {   8'd245   ,  6'd12 };
13'd4225  : q  = {   8'd245   ,  6'd13 };
13'd4226  : q  = {   8'd103   ,  6'd33 };
13'd4227  : q  = {   8'd245   ,  6'd15 };
13'd4228  : q  = {   8'd245   ,  6'd16 };
13'd4229  : q  = {   8'd245   ,  6'd17 };
13'd4230  : q  = {   8'd245   ,  6'd18 };
13'd4231  : q  = {   8'd72    ,  6'd21 };
13'd4232  : q  = {   8'd10    ,  6'd23 };
13'd4233  : q  = {   8'd77    ,  6'd15 };
13'd4234  : q  = {   8'd245   ,  6'd22 };
13'd4235  : q  = {   8'd245   ,  6'd23 };
13'd4236  : q  = {   8'd91    ,  6'd28 };
13'd4237  : q  = {   8'd245   ,  6'd25 };
13'd4238  : q  = {   8'd66    ,  6'd6  };
13'd4239  : q  = {   8'd245   ,  6'd27 };
13'd4240  : q  = {   8'd245   ,  6'd28 };
13'd4241  : q  = {   8'd97    ,  6'd17 };
13'd4242  : q  = {   8'd245   ,  6'd30 };
13'd4243  : q  = {   8'd121   ,  6'd1  };
13'd4244  : q  = {   8'd245   ,  6'd32 };
13'd4245  : q  = {   8'd245   ,  6'd33 };
13'd4246  : q  = {   8'd245   ,  6'd34 };
13'd4247  : q  = {   8'd4     ,  6'd27 };
13'd4248  : q  = {   8'd66    ,  6'd8  };
13'd4249  : q  = {   8'd246   ,  6'd1  };
13'd4250  : q  = {   8'd246   ,  6'd2  };
13'd4251  : q  = {   8'd31    ,  6'd20 };
13'd4252  : q  = {   8'd246   ,  6'd4  };
13'd4253  : q  = {   8'd1     ,  6'd4  };
13'd4254  : q  = {   8'd246   ,  6'd6  };
13'd4255  : q  = {   8'd246   ,  6'd7  };
13'd4256  : q  = {   8'd246   ,  6'd8  };
13'd4257  : q  = {   8'd246   ,  6'd9  };
13'd4258  : q  = {   8'd246   ,  6'd10 };
13'd4259  : q  = {   8'd81    ,  6'd0  };
13'd4260  : q  = {   8'd246   ,  6'd12 };
13'd4261  : q  = {   8'd246   ,  6'd13 };
13'd4262  : q  = {   8'd246   ,  6'd14 };
13'd4263  : q  = {   8'd246   ,  6'd15 };
13'd4264  : q  = {   8'd97    ,  6'd7  };
13'd4265  : q  = {   8'd246   ,  6'd17 };
13'd4266  : q  = {   8'd246   ,  6'd18 };
13'd4267  : q  = {   8'd246   ,  6'd19 };
13'd4268  : q  = {   8'd246   ,  6'd20 };
13'd4269  : q  = {   8'd77    ,  6'd16 };
13'd4270  : q  = {   8'd89    ,  6'd32 };
13'd4271  : q  = {   8'd83    ,  6'd22 };
13'd4272  : q  = {   8'd72    ,  6'd23 };
13'd4273  : q  = {   8'd246   ,  6'd25 };
13'd4274  : q  = {   8'd72    ,  6'd24 };
13'd4275  : q  = {   8'd125   ,  6'd35 };
13'd4276  : q  = {   8'd246   ,  6'd28 };
13'd4277  : q  = {   8'd246   ,  6'd29 };
13'd4278  : q  = {   8'd246   ,  6'd30 };
13'd4279  : q  = {   8'd4     ,  6'd21 };
13'd4280  : q  = {   8'd246   ,  6'd32 };
13'd4281  : q  = {   8'd246   ,  6'd33 };
13'd4282  : q  = {   8'd126   ,  6'd30 };
13'd4283  : q  = {   8'd72    ,  6'd25 };
13'd4284  : q  = {   8'd66    ,  6'd11 };
13'd4285  : q  = {   8'd247   ,  6'd1  };
13'd4286  : q  = {   8'd247   ,  6'd2  };
13'd4287  : q  = {   8'd93    ,  6'd0  };
13'd4288  : q  = {   8'd114   ,  6'd3  };
13'd4289  : q  = {   8'd66    ,  6'd12 };
13'd4290  : q  = {   8'd247   ,  6'd6  };
13'd4291  : q  = {   8'd85    ,  6'd6  };
13'd4292  : q  = {   8'd247   ,  6'd8  };
13'd4293  : q  = {   8'd26    ,  6'd3  };
13'd4294  : q  = {   8'd247   ,  6'd10 };
13'd4295  : q  = {   8'd247   ,  6'd11 };
13'd4296  : q  = {   8'd247   ,  6'd12 };
13'd4297  : q  = {   8'd88    ,  6'd20 };
13'd4298  : q  = {   8'd247   ,  6'd14 };
13'd4299  : q  = {   8'd247   ,  6'd15 };
13'd4300  : q  = {   8'd247   ,  6'd16 };
13'd4301  : q  = {   8'd40    ,  6'd14 };
13'd4302  : q  = {   8'd247   ,  6'd18 };
13'd4303  : q  = {   8'd247   ,  6'd19 };
13'd4304  : q  = {   8'd77    ,  6'd18 };
13'd4305  : q  = {   8'd118   ,  6'd11 };
13'd4306  : q  = {   8'd247   ,  6'd22 };
13'd4307  : q  = {   8'd247   ,  6'd23 };
13'd4308  : q  = {   8'd72    ,  6'd26 };
13'd4309  : q  = {   8'd247   ,  6'd25 };
13'd4310  : q  = {   8'd28    ,  6'd0  };
13'd4311  : q  = {   8'd108   ,  6'd31 };
13'd4312  : q  = {   8'd89    ,  6'd6  };
13'd4313  : q  = {   8'd106   ,  6'd14 };
13'd4314  : q  = {   8'd247   ,  6'd30 };
13'd4315  : q  = {   8'd79    ,  6'd9  };
13'd4316  : q  = {   8'd247   ,  6'd32 };
13'd4317  : q  = {   8'd247   ,  6'd33 };
13'd4318  : q  = {   8'd247   ,  6'd34 };
13'd4319  : q  = {   8'd72    ,  6'd27 };
13'd4320  : q  = {   8'd9     ,  6'd15 };
13'd4321  : q  = {   8'd248   ,  6'd1  };
13'd4322  : q  = {   8'd248   ,  6'd2  };
13'd4323  : q  = {   8'd35    ,  6'd29 };
13'd4324  : q  = {   8'd248   ,  6'd4  };
13'd4325  : q  = {   8'd72    ,  6'd28 };
13'd4326  : q  = {   8'd248   ,  6'd6  };
13'd4327  : q  = {   8'd66    ,  6'd15 };
13'd4328  : q  = {   8'd92    ,  6'd32 };
13'd4329  : q  = {   8'd248   ,  6'd9  };
13'd4330  : q  = {   8'd248   ,  6'd10 };
13'd4331  : q  = {   8'd248   ,  6'd11 };
13'd4332  : q  = {   8'd248   ,  6'd12 };
13'd4333  : q  = {   8'd248   ,  6'd13 };
13'd4334  : q  = {   8'd248   ,  6'd14 };
13'd4335  : q  = {   8'd248   ,  6'd15 };
13'd4336  : q  = {   8'd248   ,  6'd16 };
13'd4337  : q  = {   8'd126   ,  6'd33 };
13'd4338  : q  = {   8'd248   ,  6'd18 };
13'd4339  : q  = {   8'd127   ,  6'd18 };
13'd4340  : q  = {   8'd2     ,  6'd28 };
13'd4341  : q  = {   8'd105   ,  6'd23 };
13'd4342  : q  = {   8'd248   ,  6'd22 };
13'd4343  : q  = {   8'd29    ,  6'd26 };
13'd4344  : q  = {   8'd24    ,  6'd18 };
13'd4345  : q  = {   8'd248   ,  6'd25 };
13'd4346  : q  = {   8'd88    ,  6'd23 };
13'd4347  : q  = {   8'd248   ,  6'd27 };
13'd4348  : q  = {   8'd248   ,  6'd28 };
13'd4349  : q  = {   8'd248   ,  6'd29 };
13'd4350  : q  = {   8'd248   ,  6'd30 };
13'd4351  : q  = {   8'd248   ,  6'd31 };
13'd4352  : q  = {   8'd83    ,  6'd23 };
13'd4353  : q  = {   8'd248   ,  6'd33 };
13'd4354  : q  = {   8'd248   ,  6'd34 };
13'd4355  : q  = {   8'd72    ,  6'd30 };
13'd4356  : q  = {   8'd22    ,  6'd23 };
13'd4357  : q  = {   8'd249   ,  6'd1  };
13'd4358  : q  = {   8'd249   ,  6'd2  };
13'd4359  : q  = {   8'd111   ,  6'd6  };
13'd4360  : q  = {   8'd249   ,  6'd4  };
13'd4361  : q  = {   8'd66    ,  6'd18 };
13'd4362  : q  = {   8'd249   ,  6'd6  };
13'd4363  : q  = {   8'd249   ,  6'd7  };
13'd4364  : q  = {   8'd249   ,  6'd8  };
13'd4365  : q  = {   8'd249   ,  6'd9  };
13'd4366  : q  = {   8'd22    ,  6'd24 };
13'd4367  : q  = {   8'd249   ,  6'd11 };
13'd4368  : q  = {   8'd249   ,  6'd12 };
13'd4369  : q  = {   8'd249   ,  6'd13 };
13'd4370  : q  = {   8'd249   ,  6'd14 };
13'd4371  : q  = {   8'd249   ,  6'd15 };
13'd4372  : q  = {   8'd249   ,  6'd16 };
13'd4373  : q  = {   8'd249   ,  6'd17 };
13'd4374  : q  = {   8'd249   ,  6'd18 };
13'd4375  : q  = {   8'd10    ,  6'd4  };
13'd4376  : q  = {   8'd29    ,  6'd32 };
13'd4377  : q  = {   8'd22    ,  6'd25 };
13'd4378  : q  = {   8'd249   ,  6'd22 };
13'd4379  : q  = {   8'd26    ,  6'd5  };
13'd4380  : q  = {   8'd121   ,  6'd25 };
13'd4381  : q  = {   8'd249   ,  6'd25 };
13'd4382  : q  = {   8'd249   ,  6'd26 };
13'd4383  : q  = {   8'd68    ,  6'd1  };
13'd4384  : q  = {   8'd249   ,  6'd28 };
13'd4385  : q  = {   8'd72    ,  6'd31 };
13'd4386  : q  = {   8'd249   ,  6'd30 };
13'd4387  : q  = {   8'd249   ,  6'd31 };
13'd4388  : q  = {   8'd249   ,  6'd32 };
13'd4389  : q  = {   8'd249   ,  6'd33 };
13'd4390  : q  = {   8'd249   ,  6'd34 };
13'd4391  : q  = {   8'd66    ,  6'd21 };
13'd4392  : q  = {   8'd66    ,  6'd22 };
13'd4393  : q  = {   8'd250   ,  6'd1  };
13'd4394  : q  = {   8'd250   ,  6'd2  };
13'd4395  : q  = {   8'd1     ,  6'd28 };
13'd4396  : q  = {   8'd250   ,  6'd4  };
13'd4397  : q  = {   8'd66    ,  6'd23 };
13'd4398  : q  = {   8'd250   ,  6'd6  };
13'd4399  : q  = {   8'd66    ,  6'd24 };
13'd4400  : q  = {   8'd250   ,  6'd8  };
13'd4401  : q  = {   8'd250   ,  6'd9  };
13'd4402  : q  = {   8'd250   ,  6'd10 };
13'd4403  : q  = {   8'd250   ,  6'd11 };
13'd4404  : q  = {   8'd250   ,  6'd12 };
13'd4405  : q  = {   8'd83    ,  6'd25 };
13'd4406  : q  = {   8'd250   ,  6'd14 };
13'd4407  : q  = {   8'd250   ,  6'd15 };
13'd4408  : q  = {   8'd250   ,  6'd16 };
13'd4409  : q  = {   8'd250   ,  6'd17 };
13'd4410  : q  = {   8'd125   ,  6'd29 };
13'd4411  : q  = {   8'd33    ,  6'd26 };
13'd4412  : q  = {   8'd250   ,  6'd20 };
13'd4413  : q  = {   8'd250   ,  6'd21 };
13'd4414  : q  = {   8'd250   ,  6'd22 };
13'd4415  : q  = {   8'd92    ,  6'd35 };
13'd4416  : q  = {   8'd101   ,  6'd22 };
13'd4417  : q  = {   8'd39    ,  6'd28 };
13'd4418  : q  = {   8'd104   ,  6'd33 };
13'd4419  : q  = {   8'd250   ,  6'd27 };
13'd4420  : q  = {   8'd250   ,  6'd28 };
13'd4421  : q  = {   8'd250   ,  6'd29 };
13'd4422  : q  = {   8'd250   ,  6'd30 };
13'd4423  : q  = {   8'd250   ,  6'd31 };
13'd4424  : q  = {   8'd250   ,  6'd32 };
13'd4425  : q  = {   8'd250   ,  6'd33 };
13'd4426  : q  = {   8'd101   ,  6'd23 };
13'd4427  : q  = {   8'd66    ,  6'd25 };
13'd4428  : q  = {   8'd9     ,  6'd16 };
13'd4429  : q  = {   8'd251   ,  6'd1  };
13'd4430  : q  = {   8'd251   ,  6'd2  };
13'd4431  : q  = {   8'd35    ,  6'd24 };
13'd4432  : q  = {   8'd251   ,  6'd4  };
13'd4433  : q  = {   8'd66    ,  6'd27 };
13'd4434  : q  = {   8'd117   ,  6'd16 };
13'd4435  : q  = {   8'd113   ,  6'd24 };
13'd4436  : q  = {   8'd27    ,  6'd8  };
13'd4437  : q  = {   8'd251   ,  6'd9  };
13'd4438  : q  = {   8'd251   ,  6'd10 };
13'd4439  : q  = {   8'd122   ,  6'd25 };
13'd4440  : q  = {   8'd95    ,  6'd10 };
13'd4441  : q  = {   8'd88    ,  6'd25 };
13'd4442  : q  = {   8'd251   ,  6'd14 };
13'd4443  : q  = {   8'd251   ,  6'd15 };
13'd4444  : q  = {   8'd251   ,  6'd16 };
13'd4445  : q  = {   8'd251   ,  6'd17 };
13'd4446  : q  = {   8'd37    ,  6'd13 };
13'd4447  : q  = {   8'd95    ,  6'd5  };
13'd4448  : q  = {   8'd251   ,  6'd20 };
13'd4449  : q  = {   8'd251   ,  6'd21 };
13'd4450  : q  = {   8'd251   ,  6'd22 };
13'd4451  : q  = {   8'd39    ,  6'd4  };
13'd4452  : q  = {   8'd26    ,  6'd24 };
13'd4453  : q  = {   8'd251   ,  6'd25 };
13'd4454  : q  = {   8'd72    ,  6'd32 };
13'd4455  : q  = {   8'd251   ,  6'd27 };
13'd4456  : q  = {   8'd251   ,  6'd28 };
13'd4457  : q  = {   8'd35    ,  6'd32 };
13'd4458  : q  = {   8'd251   ,  6'd30 };
13'd4459  : q  = {   8'd251   ,  6'd31 };
13'd4460  : q  = {   8'd124   ,  6'd15 };
13'd4461  : q  = {   8'd251   ,  6'd33 };
13'd4462  : q  = {   8'd251   ,  6'd34 };
13'd4463  : q  = {   8'd72    ,  6'd33 };
13'd4464  : q  = {   8'd66    ,  6'd30 };
13'd4465  : q  = {   8'd252   ,  6'd1  };
13'd4466  : q  = {   8'd252   ,  6'd2  };
13'd4467  : q  = {   8'd95    ,  6'd6  };
13'd4468  : q  = {   8'd34    ,  6'd7  };
13'd4469  : q  = {   8'd252   ,  6'd5  };
13'd4470  : q  = {   8'd252   ,  6'd6  };
13'd4471  : q  = {   8'd10    ,  6'd5  };
13'd4472  : q  = {   8'd66    ,  6'd31 };
13'd4473  : q  = {   8'd252   ,  6'd9  };
13'd4474  : q  = {   8'd252   ,  6'd10 };
13'd4475  : q  = {   8'd252   ,  6'd11 };
13'd4476  : q  = {   8'd252   ,  6'd12 };
13'd4477  : q  = {   8'd30    ,  6'd34 };
13'd4478  : q  = {   8'd252   ,  6'd14 };
13'd4479  : q  = {   8'd252   ,  6'd15 };
13'd4480  : q  = {   8'd73    ,  6'd30 };
13'd4481  : q  = {   8'd252   ,  6'd17 };
13'd4482  : q  = {   8'd252   ,  6'd18 };
13'd4483  : q  = {   8'd252   ,  6'd19 };
13'd4484  : q  = {   8'd252   ,  6'd20 };
13'd4485  : q  = {   8'd108   ,  6'd12 };
13'd4486  : q  = {   8'd252   ,  6'd22 };
13'd4487  : q  = {   8'd121   ,  6'd27 };
13'd4488  : q  = {   8'd252   ,  6'd24 };
13'd4489  : q  = {   8'd252   ,  6'd25 };
13'd4490  : q  = {   8'd252   ,  6'd26 };
13'd4491  : q  = {   8'd252   ,  6'd27 };
13'd4492  : q  = {   8'd252   ,  6'd28 };
13'd4493  : q  = {   8'd72    ,  6'd35 };
13'd4494  : q  = {   8'd252   ,  6'd30 };
13'd4495  : q  = {   8'd252   ,  6'd31 };
13'd4496  : q  = {   8'd252   ,  6'd32 };
13'd4497  : q  = {   8'd252   ,  6'd33 };
13'd4498  : q  = {   8'd113   ,  6'd8  };
13'd4499  : q  = {   8'd4     ,  6'd28 };
13'd4500  : q  = {   8'd98    ,  6'd21 };
13'd4501  : q  = {   8'd253   ,  6'd1  };
13'd4502  : q  = {   8'd253   ,  6'd2  };
13'd4503  : q  = {   8'd91    ,  6'd30 };
13'd4504  : q  = {   8'd253   ,  6'd4  };
13'd4505  : q  = {   8'd34    ,  6'd3  };
13'd4506  : q  = {   8'd253   ,  6'd6  };
13'd4507  : q  = {   8'd22    ,  6'd28 };
13'd4508  : q  = {   8'd22    ,  6'd29 };
13'd4509  : q  = {   8'd120   ,  6'd12 };
13'd4510  : q  = {   8'd67    ,  6'd1  };
13'd4511  : q  = {   8'd253   ,  6'd11 };
13'd4512  : q  = {   8'd253   ,  6'd12 };
13'd4513  : q  = {   8'd253   ,  6'd13 };
13'd4514  : q  = {   8'd253   ,  6'd14 };
13'd4515  : q  = {   8'd253   ,  6'd15 };
13'd4516  : q  = {   8'd73    ,  6'd1  };
13'd4517  : q  = {   8'd253   ,  6'd17 };
13'd4518  : q  = {   8'd253   ,  6'd18 };
13'd4519  : q  = {   8'd253   ,  6'd19 };
13'd4520  : q  = {   8'd38    ,  6'd0  };
13'd4521  : q  = {   8'd100   ,  6'd3  };
13'd4522  : q  = {   8'd253   ,  6'd22 };
13'd4523  : q  = {   8'd253   ,  6'd23 };
13'd4524  : q  = {   8'd125   ,  6'd19 };
13'd4525  : q  = {   8'd253   ,  6'd25 };
13'd4526  : q  = {   8'd79    ,  6'd12 };
13'd4527  : q  = {   8'd253   ,  6'd27 };
13'd4528  : q  = {   8'd253   ,  6'd28 };
13'd4529  : q  = {   8'd253   ,  6'd29 };
13'd4530  : q  = {   8'd253   ,  6'd30 };
13'd4531  : q  = {   8'd253   ,  6'd31 };
13'd4532  : q  = {   8'd253   ,  6'd32 };
13'd4533  : q  = {   8'd253   ,  6'd33 };
13'd4534  : q  = {   8'd104   ,  6'd15 };
13'd4535  : q  = {   8'd73    ,  6'd3  };
13'd4536  : q  = {   8'd67    ,  6'd2  };
13'd4537  : q  = {   8'd254   ,  6'd1  };
13'd4538  : q  = {   8'd77    ,  6'd21 };
13'd4539  : q  = {   8'd254   ,  6'd3  };
13'd4540  : q  = {   8'd254   ,  6'd4  };
13'd4541  : q  = {   8'd67    ,  6'd3  };
13'd4542  : q  = {   8'd254   ,  6'd6  };
13'd4543  : q  = {   8'd254   ,  6'd7  };
13'd4544  : q  = {   8'd22    ,  6'd30 };
13'd4545  : q  = {   8'd13    ,  6'd18 };
13'd4546  : q  = {   8'd254   ,  6'd10 };
13'd4547  : q  = {   8'd254   ,  6'd11 };
13'd4548  : q  = {   8'd83    ,  6'd26 };
13'd4549  : q  = {   8'd254   ,  6'd13 };
13'd4550  : q  = {   8'd254   ,  6'd14 };
13'd4551  : q  = {   8'd254   ,  6'd15 };
13'd4552  : q  = {   8'd67    ,  6'd5  };
13'd4553  : q  = {   8'd254   ,  6'd17 };
13'd4554  : q  = {   8'd254   ,  6'd18 };
13'd4555  : q  = {   8'd254   ,  6'd19 };
13'd4556  : q  = {   8'd29    ,  6'd28 };
13'd4557  : q  = {   8'd254   ,  6'd21 };
13'd4558  : q  = {   8'd254   ,  6'd22 };
13'd4559  : q  = {   8'd254   ,  6'd23 };
13'd4560  : q  = {   8'd73    ,  6'd4  };
13'd4561  : q  = {   8'd254   ,  6'd25 };
13'd4562  : q  = {   8'd254   ,  6'd26 };
13'd4563  : q  = {   8'd254   ,  6'd27 };
13'd4564  : q  = {   8'd254   ,  6'd28 };
13'd4565  : q  = {   8'd254   ,  6'd29 };
13'd4566  : q  = {   8'd254   ,  6'd30 };
13'd4567  : q  = {   8'd254   ,  6'd31 };
13'd4568  : q  = {   8'd68    ,  6'd9  };
13'd4569  : q  = {   8'd254   ,  6'd33 };
13'd4570  : q  = {   8'd254   ,  6'd34 };
13'd4571  : q  = {   8'd254   ,  6'd35 };
13'd4572  : q  = {   8'd67    ,  6'd6  };
13'd4573  : q  = {   8'd255   ,  6'd1  };
13'd4574  : q  = {   8'd255   ,  6'd2  };
13'd4575  : q  = {   8'd255   ,  6'd3  };
13'd4576  : q  = {   8'd117   ,  6'd21 };
13'd4577  : q  = {   8'd255   ,  6'd5  };
13'd4578  : q  = {   8'd37    ,  6'd1  };
13'd4579  : q  = {   8'd119   ,  6'd18 };
13'd4580  : q  = {   8'd91    ,  6'd31 };
13'd4581  : q  = {   8'd255   ,  6'd9  };
13'd4582  : q  = {   8'd67    ,  6'd8  };
13'd4583  : q  = {   8'd255   ,  6'd11 };
13'd4584  : q  = {   8'd255   ,  6'd12 };
13'd4585  : q  = {   8'd255   ,  6'd13 };
13'd4586  : q  = {   8'd116   ,  6'd31 };
13'd4587  : q  = {   8'd255   ,  6'd15 };
13'd4588  : q  = {   8'd67    ,  6'd9  };
13'd4589  : q  = {   8'd255   ,  6'd17 };
13'd4590  : q  = {   8'd255   ,  6'd18 };
13'd4591  : q  = {   8'd28    ,  6'd1  };
13'd4592  : q  = {   8'd12    ,  6'd3  };
13'd4593  : q  = {   8'd34    ,  6'd0  };
13'd4594  : q  = {   8'd255   ,  6'd22 };
13'd4595  : q  = {   8'd255   ,  6'd23 };
13'd4596  : q  = {   8'd29    ,  6'd29 };
13'd4597  : q  = {   8'd255   ,  6'd25 };
13'd4598  : q  = {   8'd255   ,  6'd26 };
13'd4599  : q  = {   8'd255   ,  6'd27 };
13'd4600  : q  = {   8'd120   ,  6'd31 };
13'd4601  : q  = {   8'd255   ,  6'd29 };
13'd4602  : q  = {   8'd118   ,  6'd28 };
13'd4603  : q  = {   8'd255   ,  6'd31 };
13'd4604  : q  = {   8'd67    ,  6'd15 };
13'd4605  : q  = {   8'd255   ,  6'd33 };
13'd4606  : q  = {   8'd102   ,  6'd24 };
13'd4607  : q  = {   8'd255   ,  6'd35 };
default   : q  = 14'h0;
endcase

endmodule

`timescale 1 ns / 1 ps
module rd_cell(
    clk,     
    reset_n,
    rd_en,
    cycle,
    base_addr,
    addr_offset,
    out_addr,
    out_en,
    rd_addr    
);

parameter A_WID = 8;

//Input ports
input                 clk        ;
input                 reset_n    ;
input                 rd_en      ;
input   [1:0]         cycle      ;
input   [A_WID-1:0]   base_addr  ;
input   [3*A_WID-1:0] addr_offset;
input   [A_WID-1:0]   out_addr   ;
input                 out_en     ;

output  [A_WID-1:0]   rd_addr    ;

reg     [A_WID-1:0]   rd_addr    ;
reg     [A_WID-1:0]   addr_offset1;

always @ (posedge clk or negedge reset_n)
begin : rd_addr_r
    if(!reset_n)
        rd_addr <= #1 8'h0;
    else if(rd_en)
        rd_addr <= #1 base_addr + addr_offset1;
    else if(out_en)
        rd_addr <= #1 out_addr;    
    else
        rd_addr <= #1 8'h0;
end 

always @ (addr_offset or cycle)
begin : addr_offset_r
    case(cycle)
    2'b01: addr_offset1 = addr_offset[3*A_WID-1:2*A_WID];
    2'b10: addr_offset1 = addr_offset[2*A_WID-1:A_WID];
    2'b11: addr_offset1 = addr_offset[A_WID-1:0];
    default: addr_offset1 = 8'h0;
    endcase
end  

endmodule

`timescale 1 ns / 1 ps
module rd_seq(
    clk,
    reset_n,
    rate,
    fsm,
    out_addr,
    out_rd_en,
    out_rd_sel
);

parameter A_WID = 8;
   
//Input ports                     
input                 clk        ;
input                 reset_n    ;
input                 rate       ;
input   [3:0]         fsm        ;

output  [A_WID-1:0]   out_addr   ;
output                out_rd_en  ;
output  [35:0]        out_rd_sel ;

reg     [12:0]        out_counter;
reg     [35:0]        out_rd_sel ;
reg                   out_rd_en  ;
reg     [35:0]        data_out_r ;
reg     [A_WID-1:0]   out_addr   ;

wire    [12:0]        out_max    ;
wire                  out_end    ;
wire    [13:0]        data_out   ;

assign out_max = rate ? 'd6911: 'd4607;
assign out_end = out_counter == out_max;

always @ (posedge clk or negedge reset_n)
begin : out_counter_r
    if(!reset_n)
        out_counter <= #1 13'h0;
    else if(fsm[3]) begin
	if(out_end)
	out_counter <= #1 13'h0;
        else
	out_counter <= #1 out_counter + 1'b1;
    end
end

out_table u_out_table(
    .clk (clk),
    .addr (out_counter),
    .q    (data_out)
);

always @ (posedge clk or negedge reset_n)
begin : out_addr_r
    if(!reset_n)
        out_addr <= #1 {A_WID{1'b0}};
    else
        out_addr <= #1 data_out[A_WID+5:6];	    
end

always @ (posedge clk or negedge reset_n)
begin : out_rd_r
    if(!reset_n)
        out_rd_sel <= #1 36'h0;
    else if(fsm[3])
	      out_rd_sel <= #1 data_out_r;
	  else
	      out_rd_sel <= #1 36'h0;
end

always @ (posedge clk or negedge reset_n)
begin : out_rd_en_r
    if(!reset_n)
        out_rd_en <= #1 1'b0;
    else 
	      out_rd_en <= #1 fsm[3];
end

always @ (data_out[5:0])
case(data_out[5:0])
6'd0  : data_out_r = 36'h0_0000_0001;	
6'd1  : data_out_r = 36'h0_0000_0002;
6'd2  : data_out_r = 36'h0_0000_0004;	
6'd3  : data_out_r = 36'h0_0000_0008;
6'd4  : data_out_r = 36'h0_0000_0010;	
6'd5  : data_out_r = 36'h0_0000_0020;
6'd6  : data_out_r = 36'h0_0000_0040;	
6'd7  : data_out_r = 36'h0_0000_0080;
6'd8  : data_out_r = 36'h0_0000_0100;	
6'd9  : data_out_r = 36'h0_0000_0200;
6'd10 : data_out_r = 36'h0_0000_0400;	
6'd11 : data_out_r = 36'h0_0000_0800;
6'd12 : data_out_r = 36'h0_0000_1000;
6'd13 : data_out_r = 36'h0_0000_2000;	
6'd14 : data_out_r = 36'h0_0000_4000;
6'd15 : data_out_r = 36'h0_0000_8000;	
6'd16 : data_out_r = 36'h0_0001_0000;
6'd17 : data_out_r = 36'h0_0002_0000;	
6'd18 : data_out_r = 36'h0_0004_0000;
6'd19 : data_out_r = 36'h0_0008_0000;	
6'd20 : data_out_r = 36'h0_0010_0000;
6'd21 : data_out_r = 36'h0_0020_0000;
6'd22 : data_out_r = 36'h0_0040_0000;
6'd23 : data_out_r = 36'h0_0080_0000;
6'd24 : data_out_r = 36'h0_0100_0000;
6'd25 : data_out_r = 36'h0_0200_0000;
6'd26 : data_out_r = 36'h0_0400_0000;
6'd27 : data_out_r = 36'h0_0800_0000;
6'd28 : data_out_r = 36'h0_1000_0000;
6'd29 : data_out_r = 36'h0_2000_0000;
6'd30 : data_out_r = 36'h0_4000_0000;
6'd31 : data_out_r = 36'h0_8000_0000;
6'd32 : data_out_r = 36'h1_0000_0000;
6'd33 : data_out_r = 36'h2_0000_0000;
6'd34 : data_out_r = 36'h4_0000_0000;
6'd35 : data_out_r = 36'h8_0000_0000;
default: data_out_r =36'h0;
endcase
endmodule

`timescale 1 ns / 1 ps
module sram2p256x8 (                             
        CLKA,
        CLKB,                                       
        ADDRA,
        ADDRB,
        DINB,
        DOUTA,                                         
        ENA,                                       
        ENB,                                       
        WEB                                        
);                                             
                                               
input       CLKA;
input       CLKB;                               
input [7:0] ADDRA;
input [7:0] ADDRB;                                 
input [7:0] DINB;
                                               
input ENA;                                     
input ENB;
input WEB;                                     
                                               
output [7:0] DOUTA;                                
reg [7:0] DOUTA;                                   
/*********************************************/
/* this part should be replaced by ASIC sram */
reg [7:0] mem [0:255];                         
always @ ( posedge CLKB )                       
                 if(~ENB && WEB)                      
                                        mem[ADDRB] <= #1 DINB;            
                                               
always @ ( posedge CLKA )                       
                if(~ENA)                        
                                        DOUTA <= #1 mem[ADDRA];            
/*********************************************/
                                                               
endmodule                                      
 
`timescale 1 ns / 1 ps 
module sram2p768x52 (                             
        CLKA,
        CLKB,                                       
        ADDRA,
        ADDRB,
        DINB,
        DOUTA,                                         
        ENA,                                       
        ENB,                                       
        WEB                                        
);                                             
                                               
input       CLKA;
input       CLKB;                               
input [9:0] ADDRA;
input [9:0] ADDRB;                                 
input [51:0] DINB;
                                               
input ENA;                                     
input ENB;
input WEB;                                     
                                               
output [51:0] DOUTA;                                
reg [51:0] DOUTA;                                   
/*********************************************/
/* this part should be replaced by ASIC sram */
reg [51:0] mem [0:767];                         
always @ ( posedge CLKB )                       
                 if(~ENB && WEB)                      
                                        mem[ADDRB] <= #1 DINB;            
                                               
always @ ( posedge CLKA )                       
                if(~ENA)                        
                                        DOUTA <= #1 mem[ADDRA];            
/*********************************************/
                                                               
endmodule                                      
 
`timescale 1 ns / 1 ps 
module sram256x8 (                             
	CLK,                                       
	A,                                         
	CEN,                                       
	WEN,                                       
	D,                                         
	Q                                          
);                                             
                                               
input       CLK;                               
input [7:0] A;                                 
input [7:0] D;                                 
                                               
input CEN;                                     
input WEN;                                     
                                               
output [7:0] Q;                                
reg [7:0] Q;                                   
/*********************************************/
/* this part should be replaced by ASIC sram */
reg [7:0] mem [0:255];                         
always @ ( posedge CLK )                       
		 if(~CEN && ~WEN)                      
					mem[A] <= #1 D;            
                                               
always @ ( posedge CLK )                       
		if(~CEN && WEN)                        
					Q <= #1 mem[A];            
/*********************************************/
				                               
endmodule 
                                     
`timescale 1 ns / 1 ps			                                   
module vtc_cell(
    clk,
    reset_n,
    sin,
    din,
    fsm,
    cycle,
    rate,

    wr_addr,
    rd_addr,
    ram_wr,
    ram_d,
    dctv 
);

//Parameter
parameter OFFSET1 = 0,
          OFFSET2 = 0,
          OFFSET3 = 0;

parameter D_WID = 8;
parameter A_WID = 8;

//Input ports
input                 clk        ;
input                 reset_n    ;
input                 rate       ;
input   [D_WID-1:0]   din        ; // LLR input
input                 sin        ;
input   [3:0]         fsm        ;
input   [3:0]         cycle      ;
input   [D_WID-1:0]   dctv       ;

output  [A_WID-1:0]   wr_addr    ;
output  [A_WID-1:0]   rd_addr    ;
output                ram_wr     ;
output  [D_WID-1:0]   ram_d      ;

reg     [A_WID-1:0]   wr_addr    ;
reg     [A_WID-1:0]   rd_addr    ;
reg                   ram_wr     ;
reg     [D_WID-1:0]   ram_d      ;
reg     [A_WID-1:0]   addr_offset;
reg     [A_WID-1:0]   rd_counter ;

always @ (posedge clk or negedge reset_n)
begin : wr_addr_r
    if(!reset_n)
        wr_addr <= #1 1'b0;
    else begin
    case(fsm)
    4'b0010:
        if(ram_wr)    
        wr_addr <= #1 wr_addr + 1'b1;
    default:
        wr_addr <= #1 1'b0;
    endcase
    end
end    

always @ (*)
begin : addr_offset_r
    case(cycle[3:2])
    2'b01: addr_offset = OFFSET1;
    2'b10: addr_offset = OFFSET2;
    2'b11: addr_offset = OFFSET3;
    default: addr_offset = 8'h0;
    endcase
end    

always @ (posedge clk or negedge reset_n)
begin : rd_addr_r
    if(!reset_n)
        rd_addr <= #1 8'h0;
    else begin
    case(fsm)
    4'b0100:
        rd_addr <= #1 rd_counter + addr_offset;
    default:
        rd_addr <= #1 8'h0;
    endcase
    end
end        

always @ (posedge clk or negedge reset_n)
begin : rd_counter_r
    if(!reset_n)
        rd_counter <= #1 8'h0;
    else if(fsm[2]) begin 
        if ( cycle[3:2] == 2'b11)
        rd_counter <= #1 rd_counter + 1'b1;
        else
        rd_counter <= #1 rd_counter;
        end
    else
        rd_counter <= #1 8'h0;
end

always @ (posedge clk or negedge reset_n)
begin : wr_r
    if(!reset_n)
        ram_wr <= #1 1'b0;
    else if(fsm[1])
        ram_wr <= #1 sin;
end

always @ (posedge clk or negedge reset_n)
begin : data_in_r
    if(!reset_n)
         ram_d <= #1 'h0;
    else if(sin)
         ram_d <= #1 din;
end

endmodule
`timescale 1 ns / 1 ps
module wr_cell(
    clk,
    reset_n,
    wr_en,
    sin,
    fsm,
    cycle,
    base_addr,
    addr_offset,
    
    wr_addr,
    ram_wr
);

parameter A_WID = 8;

//Input ports
input                 clk        ;
input                 reset_n    ;
input                 wr_en      ;
input                 sin        ;
input   [3:0]         fsm        ;
input   [1:0]         cycle      ;
input   [A_WID-1:0]   base_addr  ;
input   [3*A_WID-1:0] addr_offset;

output  [A_WID-1:0]   wr_addr    ;
output                ram_wr     ;

reg     [A_WID-1:0]   wr_addr    ;
reg                   ram_wr     ;
reg     [A_WID-1:0]   addr_offset1;

always @ (posedge clk or negedge reset_n)
begin : wr_addr_r
    if(!reset_n)
        wr_addr <= #1 {A_WID{1'b0}};
    else begin
    	if(fsm[1]) begin
        if(ram_wr)
        wr_addr <= #1 wr_addr + 1'b1;
        end
        else if(fsm[2]) begin
        if(wr_en) 
        wr_addr <= #1 base_addr + addr_offset1;
        else
        wr_addr <= #1 {A_WID{1'b0}};
        end
        else
        wr_addr <= #1 {A_WID{1'b0}};
    end
end    

always @ (addr_offset or cycle)
begin : addr_offset_r
    case(cycle)
    2'b01: addr_offset1 = addr_offset[3*A_WID-1:2*A_WID];
    2'b10: addr_offset1 = addr_offset[2*A_WID-1:A_WID];
    2'b11: addr_offset1 = addr_offset[A_WID-1:0];
    default: addr_offset1 = 8'h0;
    endcase
end  

always @ (posedge clk or negedge reset_n)
begin : wr_r
    if(!reset_n)
        ram_wr <= #1 1'b0;
    else if(fsm[1])
        ram_wr <= #1 sin;
    else 
        ram_wr <= #1 wr_en;
end

endmodule
														  
