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
