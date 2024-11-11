module top (
    input clk,
    input rst,
    output a,
    output b,
    output c,
    output rdy,
    output rt,
    output start,
    output endd,
    output stop,
    output status,
    output enable,
    output status_valid,
    output read_enable,
    output write_enable,
    output psel,
    output penable,
    output pready,
    output pwrite,
    output pwaddr,
    output pstrb,  
    output interrupt
);

	black_box mod(
		.clk(clk),
		.rst(rst),
		.a(a),
		.b(b),
		.c(c),
		.rdy(rdy),
		.rt(rt),
		.start(start),
		.endd(endd),
		.stop(stop),
		.status(status),
		.enable(enable),
		.interrupt(interrupt),
		.read_enable(read_enable),
		.write_enable(write_enable),
		.psel(psel),
		.penable(penable),
		.pready(pready),
		.pwrite(pwrite),
		.pwaddr(pwaddr),
		.pstrb(pstrb),
		.status_valid(status_valid));
	
	// pomocne promenljive
	bit temp;

	initial begin
		temp <= 0;
	end
	
	always @(posedge clk) begin
		if(rst) begin
			temp <= 0;
		end
		else begin
			if(rt) begin
				temp <= 1;	
			end
			else if(rdy) begin
				temp <= 0;
			end
		end
	end
	

	default
	clocking @(posedge clk);
	endclocking

	default disable iff (rst);
	
	// zadatak 1
	property p1;
		start |-> !$isunknown(stop);
	endproperty : p1
	
	// zadatak 2
	property p2;
		$rose(a) |=> b[*0:$] ##1 c;
	endproperty : p2

	// zadatak 3
	property p3;
		start |-> ##[1:3] interrupt ##[4:8] endd;
	endproperty : p3
	
	// zadatak 4
	property p4;
		enable ##1 start [->1] |-> ##[5:10] stop;
	endproperty : p4

	// zadatak 5
	property p5;
		read_enable |-> !write_enable s_until !read_enable;
	endproperty : p5

	// zadatak 6
	property p61;
		status |-> ##[1:3] status_valid;
	endproperty : p61
	
	property p62;
		status |=> !status s_until status_valid;
	endproperty : p62
	
	// zadatak 7
	property p7;
		rt |-> !temp;
	endproperty : p7	
	
	// zadatak 8
	property p8;
    		$rose(psel) |=> penable s_until_with pready;        
  	endproperty : p8
	
	// zadatak 9
	property p9;
    		$fell(pready) |-> $fell(penable);
  	endproperty : p9
	
	// zadatak 10
	property p10;
    		(pwrite && $rose(penable)) |-> ($stable(pwaddr) && $stable(pstrb)) s_until_with pready; 
  	endproperty : p10
	
	assert property(p1);
	assert property(p2);
	assert property(p3);
	assert property(p4);
	assert property(p5);
	assert property(p61);
	assert property(p62);
	assert property(p7);
	assert property(p8);
	assert property(p9);
	assert property(p10);	

endmodule
