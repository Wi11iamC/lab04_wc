module game (
    input clk, n, s, e, w, reset,
    output sw, v, win, d, s6, s5, s4, s3, s2, s1, s0
);
    
    sword sword1 (
        .sw(sw),
        .reset(reset),
        .clk(clk),
        .v(v)
    );
    
    room room1 (
        .clk(clk),
        .n(n),
        .s(s),
        .e(e),
        .w(w),
        .v(v),
        .reset(reset),
        .sw(sw),
        .win(win),
        .d(d),
        .s6(s6),
        .s5(s5),
        .s4(s4),
        .s3(s3),
        .s2(s2),
        .s1(s1),
        .s0(s0)
    );
endmodule