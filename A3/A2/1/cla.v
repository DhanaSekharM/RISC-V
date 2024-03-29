module CLA(g, p, cin, C, G, P);
  input [63:0]g, p;
  input cin;
  output [63:1]C;
  output G, P;
  genvar i;
  genvar j;
  input temp;
  // C_i = g_{i-1} + C_{i-1}*P_{i-1}
  assign C[1] = g[0] | cin & p[0];
  for(i=2;i<64;i=i+1)
  begin
    assign C[i] = g[i-1] | C[i-1] & p[i-1];
  end

  assign P = p[0] & p[1] & p[2] & p[3] & p[4] & p[5] & p[6] & p[7] & p[8] & p[9] & p[10] & p[11] & p[12] & p[13] & p[14] & p[15] & p[16] & p[17] & p[18] & p[19] & p[20] & p[21] & p[22] & p[23] & p[24] & p[25] & p[26] & p[27] & p[28] & p[29] & p[30] & p[31] & p[32] & p[33] & p[34] & p[35] & p[36] & p[37] & p[38] & p[39] & p[40] & p[41] & p[42] & p[43] & p[44] & p[45] & p[46] & p[47] & p[48] & p[49] & p[50] & p[51] & p[52] & p[53] & p[54] & p[55] & p[56] & p[57] & p[58] & p[59] & p[60] & p[61] & p[62] & p[63];
  for(i=0;i<64;i=i+1)
  begin 
    assign temp = 1;
    for(j=i+1;j<64;j=j+1)
    begin
      assign temp = temp & p[j];
    end
    assign G = G | (g[i] & temp);
  end
endmodule