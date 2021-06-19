//Module
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
