module sword (
    input sw, reset, clk,
    output v
);
    wire v_new;
    
    assign v_new = (v&~reset) | (~v&~reset&sw);
    
    d_ff dff_v(.d(v_new), .clk(clk), .q(v));
endmodule