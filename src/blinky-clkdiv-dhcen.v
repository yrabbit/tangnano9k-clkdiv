module top (
	input clk,
	input key_i,
	output [5:0] led
);



    wire managed_clk;
    DHCEN dhcen(
        .CLKIN(clk),
        .CE(~key_i),
        .CLKOUT(managed_clk)
    );


    wire div2_out;
    CLKDIV2 my_div2 (
        .RESETN(1'b1),
        .HCLKIN(managed_clk),
        .CLKOUT(div2_out)
    );

    CLKDIV #(.DIV_MODE("2")) my_div (
        .RESETN(1'b1),
        .HCLKIN(div2_out),
        .CLKOUT(led[0])
    );
   assign led[1] = ~led[0];


endmodule
