// fma16.sv

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

   // FMA control (FOpCtrlE[1:0]) -> {mul, add, negr, negz}
   // -------------------------------------------------------------
   // negr = 1 : negate product p = x*y  (pre-add)
   // negz = 1 : subtract z (i.e., add -z)
   // All four ops use mul=1, add=1
   //
   //  FOpCtrlE | Operation                 | mul | add | negr | negz | Expression
   // ----------+---------------------------+-----+-----+------+-----+-------------------
   //    00     | FMADD.S                   |  1  |  1  |  0   |  0   |  (x*y) + z
   //    01     | FMSUB.S                   |  1  |  1  |  0   |  1   |  (x*y) - z
   //    10     | FNMSUB.S (neg prod, +z)   |  1  |  1  |  1   |  0   |  -(x*y) + z
   //    11     | FNMADD.S (neg prod, -z)   |  1  |  1  |  1   |  1   |  -(x*y) - z


   always_comb begin
      mul  = 1'b1;  
      add  = 1'b1;
      case (FOpCtrlE)
	2'b00: begin  // (x*y) + z
	   negr = 1'b0;
	   negz = 1'b0;
	end
	2'b01: begin  // (x*y) - z
	   negr = 1'b0;
	   negz = 1'b1;  
	end
	2'b10: begin 
	   negr = 1'b1;  // negate product
	   negz = 1'b0;
	end
	2'b11: begin 
	   negr = 1'b1;  // negate product
	   negz = 1'b1;  // subtract z
	end
	default: begin
	   negr = 1'b0;
	   negz = 1'b0;
	end
      endcase
   end
   
   // stubbed ideas for instantiation ideas
   
   // fmaexpadd expadd(.Xe, .Ye, .XZero, .YZero, .Pe);
   // fmamult mult(.Xm, .Ym, .Pm);
   // fmasign sign(.OpCtrl, .Xs, .Ys, .Zs, .Ps, .As, .InvA);
   // fmaalign align(.Ze, .Zm, .XZero, .YZero, .ZZero, .Xe, .Ye, .Am, .ASticky, .KillProd);
   // fmaadd add(.Am, .Pm, .Ze, .Pe, .Ps, .KillProd, .ASticky, .AmInv, .PmKilled, .InvA, .Sm, .Se, .Ss);
   // fmalza lza (.A(AmInv), .Pm(PmKilled), .Cin(InvA & (~ASticky | KillProd)), .sub(InvA), .SCnt);

 
endmodule

