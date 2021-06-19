//Module
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
