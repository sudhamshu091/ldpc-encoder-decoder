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
                                                           
