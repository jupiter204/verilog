module b(clk,seg,cn);
input clk;
output [7:0]seg;
output [3:0]cn;
reg [7:0]seg;
reg [3:0]cn=4'b1101;
reg [24:0]counter;
reg [10:0]scan;
reg [3:0]sec,sec10,min,min10;
always @(posedge clk)begin
	if (counter==249999) begin
		counter<=0;
		seg[0]=~seg[0];
		sec<=sec+1;
		if (sec==9)begin
		  sec<=0;
		  if (sec10==5)begin
		    sec10<=0;
		    if (min==9)begin
		      min<=0;
		      if (min10==5)begin
		        min10<=0;
		      end
		      else min10<=min10+1;
		    end
		    else min<=min+1;
		  end
		  else sec10<=sec10+1;
		end
		else sec<=sec+1;
	end
	else begin
		counter<=counter+1;
	end
	
end
always @(posedge clk)begin
	scan<=scan+1;
	if(scan==0)begin
		case(cn)
			4'b0111:begin
				cn<=4'b1110;
				case (sec)
					0:begin seg[7:1]<=7'b0000001;end
					1:begin seg[7:1]<=7'b1001111;end
					2:begin seg[7:1]<=7'b0010010;end
					3:begin seg[7:1]<=7'b0000110;end
					4:begin seg[7:1]<=7'b1001100;end
					5:begin seg[7:1]<=7'b0100100;end
					6:begin seg[7:1]<=7'b1100000;end
					7:begin seg[7:1]<=7'b0001111;end
					8:begin seg[7:1]<=7'b0000000;end
					9:begin seg[7:1]<=7'b0001100;end
				endcase
			end
		endcase
		case(cn)
			4'b1110:begin
				cn<=4'b1101;
				case (sec10)
					0:begin seg[7:1]<=7'b0000001;end
					1:begin seg[7:1]<=7'b1001111;end
					2:begin seg[7:1]<=7'b0010010;end
					3:begin seg[7:1]<=7'b0000110;end
					4:begin seg[7:1]<=7'b1001100;end
					5:begin seg[7:1]<=7'b0100100;end
					6:begin seg[7:1]<=7'b1100000;end
					7:begin seg[7:1]<=7'b0001111;end
					8:begin seg[7:1]<=7'b0000000;end
					9:begin seg[7:1]<=7'b0001100;end
				endcase
			end
		endcase
		case(cn)
			4'b1101:begin
			cn<=4'b1011;
				case (min)
					0:begin seg[7:1]<=7'b0000001;end
					1:begin seg[7:1]<=7'b1001111;end
					2:begin seg[7:1]<=7'b0010010;end
					3:begin seg[7:1]<=7'b0000110;end
					4:begin seg[7:1]<=7'b1001100;end
					5:begin seg[7:1]<=7'b0100100;end
					6:begin seg[7:1]<=7'b1100000;end
					7:begin seg[7:1]<=7'b0001111;end
					8:begin seg[7:1]<=7'b0000000;end
					9:begin seg[7:1]<=7'b0001100;end
				endcase
			end
		endcase
		case(cn)
			4'b1011:begin
				cn<=4'b0111;
				case (min10)
					0:begin seg[7:1]<=7'b0000001;end
					1:begin seg[7:1]<=7'b1001111;end
					2:begin seg[7:1]<=7'b0010010;end
					3:begin seg[7:1]<=7'b0000110;end
					4:begin seg[7:1]<=7'b1001100;end
					5:begin seg[7:1]<=7'b0100100;end
					6:begin seg[7:1]<=7'b1100000;end
					7:begin seg[7:1]<=7'b0001111;end
					8:begin seg[7:1]<=7'b0000000;end
					9:begin seg[7:1]<=7'b0001100;end
				endcase
			end
			
		endcase
	end
end
endmodule