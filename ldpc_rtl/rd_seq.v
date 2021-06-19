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
