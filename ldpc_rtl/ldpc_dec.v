//Defines
//
//Module
module ldpc_dec(
    clk,
    reset_n,
    code_rate,
    data_in,
    sync_in,
    max_iter,

    data_out,
    sync_out,
    busy,
    num_iter,
);

parameter D_WID = 6;

//Input ports
input                clk        ;
input                reset_n    ;
input                code_rate  ; // 0, 1/2 1, 3/4
input   [D_WID-1:0]  data_in    ; // LLR input
input                sync_in    ;
input   [4:0]        max_iter   ;

//Output ports
output               data_out   ; 
output               sync_out   ;
output               busy       ; // ldpc is running
//output               finish     ; // ldpc decoder finish, can read new data
output  [4:0]        num_iter   ; // iteration number

//Internal wires definition
wire    [3:0]        fsm_state  ;

//Sub module body
//ldpc_ctv u_ldpc_ctv(   );

ldpc_ctrl u_ldpc_ctrl(
    .clk        (  clk        ),
    .reset_n    (  reset_n    ),
    .sync_in    (  sync_in    ),
    .code_rate  (  code_rate  ),
    .max_iter   (  max_iter   ),

    .fsm_state  (  fsm_state  ),
    .finish     (             ),
    .busy       (  busy       ),
    .num_iter   (  num_iter   ) 

);

//lr_decom u_lr_decom();

ldpc_vtc u_ldpc_vtc(
    .clk        ( clk        ),
    .reset_n    ( reset_n    ),
    .data_in    ( data_in    ),
    .sync_in    ( sync_in    ),
    .fsm_state  ( fsm_state  ),
    .code_rate  ( code_rate  ),

    .lq_dat_i   ( la_dat_i   ),
    .lq_dat_o   ( lq_dat_o   )
   
);

//ldpc_cnu u_ldpc_cnu();

endmodule
