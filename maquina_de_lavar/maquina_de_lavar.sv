	module maquina_de_lavar
	(output logic valvula_agua, modo_agitar, modo_girar, input clock, reset_n, inicio, tempo, cheio, secar);

	logic [1:0] estado_atual;

	parameter espera = 0, encher = 1, agitar = 2, girar = 3;

	always @ (*) begin 
		case (estado_atual)
			espera : begin
						 valvula_agua = 0; modo_agitar = 0; modo_girar = 0;
						end
						 
			encher : begin
						 valvula_agua = 1; modo_agitar = 0; modo_girar = 0;
						end
						
			agitar : begin
						 valvula_agua = 0; modo_agitar = 1; modo_girar = 0;
						end
			girar : begin
						 valvula_agua = 0; modo_agitar = 0; modo_girar = 1;
					  end
	  endcase
	end
	
	always @ (posedge clock, negedge reset_n)
		
		if (~reset_n)
			estado_atual <= espera;
		else
			case (estado_atual)
			espera: if (inicio == 1)
					 estado_atual <= encher;
					 
			encher: if (cheio == 1)
					 estado_atual <= agitar;
					 
			agitar: if (tempo == 1)
					 estado_atual <= girar;
					 
			girar: if (secar == 0)
					 estado_atual <= espera;
			
	endcase
endmodule 


