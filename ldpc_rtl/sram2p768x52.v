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
                                                           
