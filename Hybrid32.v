`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:11:24 04/07/2019 
// Design Name: 
// Module Name:    Hybrid32
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Hybrid32(sum,cout,a, b,cin);
   output [31:0] sum;
   output cout;
   input [31:0] a, b;
   input cin;
   wire cout_1;
	CarryLookahead16 cla16(sum[15:0], cout_1, a[15:0], b[15:0], cin);
	KoggeStone16 koggestone16(sum[31:16], cout, a[31:16], b[31:16], cout_1);
	
endmodule

module CarryLookahead16(sum,cout,a, b,cin);
output [15:0] sum;
output cout;
input [15:0] a, b;
input cin;
wire [2079:0] g, p, c;
wire [135:0] e;

PGgen pggen[15:0](g[15:0],p[15:0],a[15:0],b[15:0]);

and (e[0], cin, p[0]);
or (c[0], e[0], g[0]);

and (e[1], cin, p[0], p[1]);
and (e[2], g[0], p[1]);
or (c[1], e[1], e[2], g[1]);

and (e[3], cin, p[0], p[1], p[2]);
and (e[4], g[0], p[1], p[2]);
and (e[5], g[1], p[2]);
or (c[2], e[3], e[4], e[5], g[2]);

and (e[6], cin, p[0], p[1], p[2], p[3]);
and (e[7], g[0], p[1], p[2], p[3]);
and (e[8], g[1], p[2], p[3]);
and (e[9], g[2], p[3]);
or (c[3], e[6], e[7], e[8], e[9], g[3]);

and (e[10], cin, p[0], p[1], p[2], p[3], p[4]);
and (e[11], g[0], p[1], p[2], p[3], p[4]);
and (e[12], g[1], p[2], p[3], p[4]);
and (e[13], g[2], p[3], p[4]);
and (e[14], g[3], p[4]);
or (c[4], e[10], e[11], e[12], e[13], e[14], g[4]);

and (e[15], cin, p[0], p[1], p[2], p[3], p[4], p[5]);
and (e[16], g[0], p[1], p[2], p[3], p[4], p[5]);
and (e[17], g[1], p[2], p[3], p[4], p[5]);
and (e[18], g[2], p[3], p[4], p[5]);
and (e[19], g[3], p[4], p[5]);
and (e[20], g[4], p[5]);
or (c[5], e[15], e[16], e[17], e[18], e[19], e[20], g[5]);

and (e[21], cin, p[0], p[1], p[2], p[3], p[4], p[5], p[6]);
and (e[22], g[0], p[1], p[2], p[3], p[4], p[5], p[6]);
and (e[23], g[1], p[2], p[3], p[4], p[5], p[6]);
and (e[24], g[2], p[3], p[4], p[5], p[6]);
and (e[25], g[3], p[4], p[5], p[6]);
and (e[26], g[4], p[5], p[6]);
and (e[27], g[5], p[6]);
or (c[6], e[21], e[22], e[23], e[24], e[25], e[26], e[27], g[6]);

and (e[28], cin, p[0], p[1], p[2], p[3], p[4], p[5], p[6], p[7]);
and (e[29], g[0], p[1], p[2], p[3], p[4], p[5], p[6], p[7]);
and (e[30], g[1], p[2], p[3], p[4], p[5], p[6], p[7]);
and (e[31], g[2], p[3], p[4], p[5], p[6], p[7]);
and (e[32], g[3], p[4], p[5], p[6], p[7]);
and (e[33], g[4], p[5], p[6], p[7]);
and (e[34], g[5], p[6], p[7]);
and (e[35], g[6], p[7]);
or (c[7], e[28], e[29], e[30], e[31], e[32], e[33], e[34], e[35], g[7]);

and (e[36], cin, p[0], p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8]);
and (e[37], g[0], p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8]);
and (e[38], g[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8]);
and (e[39], g[2], p[3], p[4], p[5], p[6], p[7], p[8]);
and (e[40], g[3], p[4], p[5], p[6], p[7], p[8]);
and (e[41], g[4], p[5], p[6], p[7], p[8]);
and (e[42], g[5], p[6], p[7], p[8]);
and (e[43], g[6], p[7], p[8]);
and (e[44], g[7], p[8]);
or (c[8], e[36], e[37], e[38], e[39], e[40], e[41], e[42], e[43], e[44], g[8]);

and (e[45], cin, p[0], p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9]);
and (e[46], g[0], p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9]);
and (e[47], g[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9]);
and (e[48], g[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9]);
and (e[49], g[3], p[4], p[5], p[6], p[7], p[8], p[9]);
and (e[50], g[4], p[5], p[6], p[7], p[8], p[9]);
and (e[51], g[5], p[6], p[7], p[8], p[9]);
and (e[52], g[6], p[7], p[8], p[9]);
and (e[53], g[7], p[8], p[9]);
and (e[54], g[8], p[9]);
or (c[9], e[45], e[46], e[47], e[48], e[49], e[50], e[51], e[52], e[53], e[54], g[9]);

and (e[55], cin, p[0], p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9], p[10]);
and (e[56], g[0], p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9], p[10]);
and (e[57], g[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9], p[10]);
and (e[58], g[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9], p[10]);
and (e[59], g[3], p[4], p[5], p[6], p[7], p[8], p[9], p[10]);
and (e[60], g[4], p[5], p[6], p[7], p[8], p[9], p[10]);
and (e[61], g[5], p[6], p[7], p[8], p[9], p[10]);
and (e[62], g[6], p[7], p[8], p[9], p[10]);
and (e[63], g[7], p[8], p[9], p[10]);
and (e[64], g[8], p[9], p[10]);
and (e[65], g[9], p[10]);
or (c[10], e[55], e[56], e[57], e[58], e[59], e[60], e[61], e[62], e[63], e[64], e[65], g[10]);

and (e[66], cin, p[0], p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9], p[10], p[11]);
and (e[67], g[0], p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9], p[10], p[11]);
and (e[68], g[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9], p[10], p[11]);
and (e[69], g[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9], p[10], p[11]);
and (e[70], g[3], p[4], p[5], p[6], p[7], p[8], p[9], p[10], p[11]);
and (e[71], g[4], p[5], p[6], p[7], p[8], p[9], p[10], p[11]);
and (e[72], g[5], p[6], p[7], p[8], p[9], p[10], p[11]);
and (e[73], g[6], p[7], p[8], p[9], p[10], p[11]);
and (e[74], g[7], p[8], p[9], p[10], p[11]);
and (e[75], g[8], p[9], p[10], p[11]);
and (e[76], g[9], p[10], p[11]);
and (e[77], g[10], p[11]);
or (c[11], e[66], e[67], e[68], e[69], e[70], e[71], e[72], e[73], e[74], e[75], e[76], e[77], g[11]);

and (e[78], cin, p[0], p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9], p[10], p[11], p[12]);
and (e[79], g[0], p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9], p[10], p[11], p[12]);
and (e[80], g[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9], p[10], p[11], p[12]);
and (e[81], g[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9], p[10], p[11], p[12]);
and (e[82], g[3], p[4], p[5], p[6], p[7], p[8], p[9], p[10], p[11], p[12]);
and (e[83], g[4], p[5], p[6], p[7], p[8], p[9], p[10], p[11], p[12]);
and (e[84], g[5], p[6], p[7], p[8], p[9], p[10], p[11], p[12]);
and (e[85], g[6], p[7], p[8], p[9], p[10], p[11], p[12]);
and (e[86], g[7], p[8], p[9], p[10], p[11], p[12]);
and (e[87], g[8], p[9], p[10], p[11], p[12]);
and (e[88], g[9], p[10], p[11], p[12]);
and (e[89], g[10], p[11], p[12]);
and (e[90], g[11], p[12]);
or (c[12], e[78], e[79], e[80], e[81], e[82], e[83], e[84], e[85], e[86], e[87], e[88], e[89], e[90], g[12]);

and (e[91], cin, p[0], p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9], p[10], p[11], p[12], p[13]);
and (e[92], g[0], p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9], p[10], p[11], p[12], p[13]);
and (e[93], g[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9], p[10], p[11], p[12], p[13]);
and (e[94], g[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9], p[10], p[11], p[12], p[13]);
and (e[95], g[3], p[4], p[5], p[6], p[7], p[8], p[9], p[10], p[11], p[12], p[13]);
and (e[96], g[4], p[5], p[6], p[7], p[8], p[9], p[10], p[11], p[12], p[13]);
and (e[97], g[5], p[6], p[7], p[8], p[9], p[10], p[11], p[12], p[13]);
and (e[98], g[6], p[7], p[8], p[9], p[10], p[11], p[12], p[13]);
and (e[99], g[7], p[8], p[9], p[10], p[11], p[12], p[13]);
and (e[100], g[8], p[9], p[10], p[11], p[12], p[13]);
and (e[101], g[9], p[10], p[11], p[12], p[13]);
and (e[102], g[10], p[11], p[12], p[13]);
and (e[103], g[11], p[12], p[13]);
and (e[104], g[12], p[13]);
or (c[13], e[91], e[92], e[93], e[94], e[95], e[96], e[97], e[98], e[99], e[100], e[101], e[102], e[103], e[104], g[13]);

and (e[105], cin, p[0], p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9], p[10], p[11], p[12], p[13], p[14]);
and (e[106], g[0], p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9], p[10], p[11], p[12], p[13], p[14]);
and (e[107], g[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9], p[10], p[11], p[12], p[13], p[14]);
and (e[108], g[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9], p[10], p[11], p[12], p[13], p[14]);
and (e[109], g[3], p[4], p[5], p[6], p[7], p[8], p[9], p[10], p[11], p[12], p[13], p[14]);
and (e[110], g[4], p[5], p[6], p[7], p[8], p[9], p[10], p[11], p[12], p[13], p[14]);
and (e[111], g[5], p[6], p[7], p[8], p[9], p[10], p[11], p[12], p[13], p[14]);
and (e[112], g[6], p[7], p[8], p[9], p[10], p[11], p[12], p[13], p[14]);
and (e[113], g[7], p[8], p[9], p[10], p[11], p[12], p[13], p[14]);
and (e[114], g[8], p[9], p[10], p[11], p[12], p[13], p[14]);
and (e[115], g[9], p[10], p[11], p[12], p[13], p[14]);
and (e[116], g[10], p[11], p[12], p[13], p[14]);
and (e[117], g[11], p[12], p[13], p[14]);
and (e[118], g[12], p[13], p[14]);
and (e[119], g[13], p[14]);
or (c[14], e[105], e[106], e[107], e[108], e[109], e[110], e[111], e[112], e[113], e[114], e[115], e[116], e[117], e[118], e[119], g[14]);

and (e[120], cin, p[0], p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9], p[10], p[11], p[12], p[13], p[14], p[15]);
and (e[121], g[0], p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9], p[10], p[11], p[12], p[13], p[14], p[15]);
and (e[122], g[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9], p[10], p[11], p[12], p[13], p[14], p[15]);
and (e[123], g[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9], p[10], p[11], p[12], p[13], p[14], p[15]);
and (e[124], g[3], p[4], p[5], p[6], p[7], p[8], p[9], p[10], p[11], p[12], p[13], p[14], p[15]);
and (e[125], g[4], p[5], p[6], p[7], p[8], p[9], p[10], p[11], p[12], p[13], p[14], p[15]);
and (e[126], g[5], p[6], p[7], p[8], p[9], p[10], p[11], p[12], p[13], p[14], p[15]);
and (e[127], g[6], p[7], p[8], p[9], p[10], p[11], p[12], p[13], p[14], p[15]);
and (e[128], g[7], p[8], p[9], p[10], p[11], p[12], p[13], p[14], p[15]);
and (e[129], g[8], p[9], p[10], p[11], p[12], p[13], p[14], p[15]);
and (e[130], g[9], p[10], p[11], p[12], p[13], p[14], p[15]);
and (e[131], g[10], p[11], p[12], p[13], p[14], p[15]);
and (e[132], g[11], p[12], p[13], p[14], p[15]);
and (e[133], g[12], p[13], p[14], p[15]);
and (e[134], g[13], p[14], p[15]);
and (e[135], g[14], p[15]);
or (cout, e[120], e[121], e[122], e[123], e[124], e[125], e[126], e[127], e[128], e[129], e[130], e[131], e[132], e[133], e[134], e[135], g[15]);

xor (sum[0],p[0],cin);
xor x[15:1](sum[15:1],p[15:1],c[14:0]);
 
endmodule

module KoggeStone16(sum,cout,a, b,cin);
  output [15:0] sum;
  output cout;
  input [15:0] a, b;
  input cin;  
  wire [15:0] c;
  wire [15:0] g, p;
  wire [15:1] g2, p2;
  wire [15:3] g3, p3;
  wire [15:7] g4, p4;
  wire [15:15] g5, p5;

  PGgen pggen[15:0](g, p, a, b);

  buf bu0(c[0], g[0]);
  PGnewgen pgnewgen0[15:1](g2[15:1], p2[15:1], g[15:1], p[15:1], g[14:0], p[14:0]);
  
  buf bu1[2:1](c[2:1], g2[2:1]);
  PGnewgen PGnewgen1[15:3](g3[15:3], p3[15:3], g2[15:3], p2[15:3], g2[13:1], p2[13:1]);
  
  buf bu2[6:3](c[6:3], g3[6:3]);
  PGnewgen PGnewgen2[15:7](g4[15:7], p4[15:7], g3[15:7], p3[15:7], g3[11:3], p3[11:3]);

  buf bu3[14:7](c[14:7], g4[14:7]);
  PGnewgen PGnewgen3(g5[15], p5[15], g4[15], p4[15], g4[7], p4[7]);  
  
  buf bu4(cout, g5[15]);
  
  xor x0(sum[0], p[0], cin);
  xor x[15:1](sum[15:1], p[15:1], c[14:0]);

endmodule

module PGnewgen(G, P, Gi, Pi, GiPrev, PiPrev);
  output G, P;
  input Gi, Pi, GiPrev, PiPrev;
  wire e;
  
  and (e, Pi, GiPrev);
  or  (G, e, Gi);
  and  (P, Pi, PiPrev);
endmodule

module PGgen(g,p,a,b);
  output g, p;
  input a, b;
  
  and (g, a, b);
  xor (p, a, b);
endmodule