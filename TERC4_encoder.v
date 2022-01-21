////////////////////////////////////////////////////////////////////////
// TERC4 Encoder
// Used to encode the HDMI data packets such as audio
////////////////////////////////////////////////////////////////////////

module TERC4_encoder(
    input clk,
    input [3:0] data,
    output reg [9:0] TERC
);

reg [9:0] TERC_pre;

initial
begin
    TERC_pre=0;
end

always @(posedge clk)
begin
    // Cycle 1
    case (data)
        4'b0000: TERC_pre <= 10'b1010011100;
        4'b0001: TERC_pre <= 10'b1001100011;
        4'b0010: TERC_pre <= 10'b1011100100;
        4'b0011: TERC_pre <= 10'b1011100010;
        4'b0100: TERC_pre <= 10'b0101110001;
        4'b0101: TERC_pre <= 10'b0100011110;
        4'b0110: TERC_pre <= 10'b0110001110;
        4'b0111: TERC_pre <= 10'b0100111100;
        4'b1000: TERC_pre <= 10'b1011001100;
        4'b1001: TERC_pre <= 10'b0100111001;
        4'b1010: TERC_pre <= 10'b0110011100;
        4'b1011: TERC_pre <= 10'b1011000110;
        4'b1100: TERC_pre <= 10'b1010001110;
        4'b1101: TERC_pre <= 10'b1001110001;
        4'b1110: TERC_pre <= 10'b0101100011;
        4'b1111: TERC_pre <= 10'b1011000011;
    endcase
    // Cycle 2
    TERC <= TERC_pre;
end

endmodule

////////////////////////////////////////////////////////////////////////
