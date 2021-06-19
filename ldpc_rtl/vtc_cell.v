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
