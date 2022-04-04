
module somador_completo_estrutural (output Cout, S, input A, B, Cin);

wire S1, S2, S3;

and
 g1 (S1, A, Cin),
 g2 (S2, A, B),
 g3 (S3, B, Cin);
 
 or
	g4(Cout, S1, S2, S3);
	
xor
 g5(S, A, B, Cin);
 
endmodule
 