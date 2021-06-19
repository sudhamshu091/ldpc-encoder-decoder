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