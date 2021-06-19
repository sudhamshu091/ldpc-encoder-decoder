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
			                                   