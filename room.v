module room (
    input clk, n, s, e, w, v, reset,
    output sw, win, d, s6, s5, s4, s3, s2, s1, s0
);
    wire s0_new, s1_new, s2_new, s3_new, s4_new, s5_new, s6_new;
    
    assign s0_new = reset | (~reset & w & s1) | (~reset & ~e & s0);
    assign s1_new = (~reset & e & s0) | (~reset & n & s2) | (~reset & ~s & ~w & s1);
    assign s2_new = (~reset & s & s1) | (~reset & e & s3) | (~reset & ~n & ~w & (~s | ~e) & s2);
    assign s3_new = (~reset & w & s2) | (~reset & ~e & s3);
    assign s4_new = (~reset & s & e & s2);
    assign s5_new = (~reset & v & s4) | (~reset & s5);
    assign s6_new = (~reset & ~v & s4) | (~reset & s6);

    d_ff dff_s0(.d(s0_new), .clk(clk), .q(s0));
    d_ff dff_s1(.d(s1_new), .clk(clk), .q(s1));
    d_ff dff_s2(.d(s2_new), .clk(clk), .q(s2));
    d_ff dff_s3(.d(s3_new), .clk(clk), .q(s3));
    d_ff dff_s4(.d(s4_new), .clk(clk), .q(s4));
    d_ff dff_s5(.d(s5_new), .clk(clk), .q(s5));
    d_ff dff_s6(.d(s6_new), .clk(clk), .q(s6));

    assign win = s5;
    assign d = s6;
    assign sw = s3;
endmodule