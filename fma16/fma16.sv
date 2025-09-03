// fma16.sv

// Operation: general purpose multiply, add, fma, with optional negation
//   If mul=1, p = x * y.  Else p = x.
//   If add=1, result = p + z.  Else result = p.
//   If negr or negz = 1, negate result or z to handle negations and subtractions
//   fadd: mul = 0, add = 1, negr = negz = 0
//   fsub: mul = 0, add = 1, negr = 0, negz = 1
//   fmul: mul = 1, add = 0, negr = 0, negz = 0
//   fmadd:  mul = 1, add = 1, negr = 0, negz = 0
//   fmsub:  mul = 1, add = 1, negr = 0, negz = 1
//   fnmadd: mul = 1, add = 1, negr = 1, negz = 0
//   fnmsub: mul = 1, add = 1, negr = 1, negz = 1

module fma16 (x, y, z, FOpCtrlE, FrmM, result, flags);
   
   input logic [15:0]  x, y, z;
   input logic [1:0]   FOpCtrlE;
   
   input logic [1:0]   FrmM; // rounding mode
   
   output logic [15:0] result;
   output logic [3:0]  flags;

   logic [4:0] 	       Xe, Ye, Ze;
   logic [9:0] 	       Xm, Ym, Zm;
   logic 	       Xs, Ys, Zs;
   logic 	       mul, add, negr, negz;

   assign mul = ~FOpCtrlE[1] & ~FOpCtrlE[0];  // 00 → 0001
   assign add = ~FOpCtrlE[1] &  FOpCtrlE[0];  // 01 → 0010
   assign negr =  FOpCtrlE[1] & ~FOpCtrlE[0]; // 10 → 0100
   assign negz =  FOpCtrlE[1] &  FOpCtrlE[0]; // 11 → 1000   

   // stubbed ideas for instantiation ideas
   
   // fmaexpadd expadd(.Xe, .Ye, .XZero, .YZero, .Pe);
   // fmamult mult(.Xm, .Ym, .Pm);
   // fmasign sign(.OpCtrl, .Xs, .Ys, .Zs, .Ps, .As, .InvA);
   // fmaalign align(.Ze, .Zm, .XZero, .YZero, .ZZero, .Xe, .Ye, .Am, .ASticky, .KillProd);
   // fmaadd add(.Am, .Pm, .Ze, .Pe, .Ps, .KillProd, .ASticky, .AmInv, .PmKilled, .InvA, .Sm, .Se, .Ss);
   // fmalza lza (.A(AmInv), .Pm(PmKilled), .Cin(InvA & (~ASticky | KillProd)), .sub(InvA), .SCnt);

 
endmodule

