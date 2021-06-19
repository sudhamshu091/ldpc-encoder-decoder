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
