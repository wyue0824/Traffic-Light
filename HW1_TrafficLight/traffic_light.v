module traffic_light(clk,rst,pass,R,G,Y);
input clk,rst,pass;
output R,G,Y;
reg[16:0]counts;
reg R,G,Y;

always@(posedge rst) 
		begin
			counts<=0;
			R<=1'b1;
			G<=1'b0;
			Y<=1'b0;
		end
always@(posedge pass)
	if (G == 0)
		begin
			counts<=0;
			R<=1'b0;
			G<=1'b1;
			Y<=1'b0;
		end
always@(posedge clk) begin
		if (G == 1)
			begin
				if(counts==11)
					begin
						counts<=0;
						R<=1'b0;
						G<=1'b0;
						Y<=1'b1;
					end
				else
					counts<=counts+1;
			end
		else if (Y == 1)
			begin
				if(counts==4)
					begin
						counts<=0;
						R<=1'b1;
						G<=1'b0;
						Y<=1'b0;
					end
				else
					counts<=counts+1;
			end
		else if (R == 1)
			begin
				if(counts==9)
					begin
						counts<=0;
						R<=1'b0;
						G<=1'b1;
						Y<=1'b0;
					end
				else
					counts<=counts+1;
			end
		else
			begin
				counts<=0;
				R<=1'b1;
				G<=1'b0;
				Y<=1'b0;
				counts<=counts+1;
			end
end
endmodule
