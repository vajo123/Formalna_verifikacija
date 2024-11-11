module top (
    input clk,
    input rst,
    output err,
    output rdy,
    output rt,
    output start,
    output endd,
    output stop,
    output status,
    output enable,
    output status_valid,  
    output interrupt
);

	counter mod(
		.clk(clk),
		.rst(rst),
		.err(err),
		.rdy(rdy),
		.rt(rt),
		.start(start),
		.endd(endd),
		.stop(stop),
		.status(status),
		.enable(enable),
		.interrupt(interrupt),
		.status_valid(status_valid));
	
	//napravi pomocni signal
	logic rt_delayed_2, rt_delayed_1;
	bit temp;

	initial begin
		temp = 0;
	end
	
	always @(posedge clk iff !rst) begin
		if(!temp) begin
			if(!rt) begin
				temp = 1;
			end
		end	
	end	
		
	always @(posedge clk) begin
		rt_delayed_2 <= rt_delayed_1;
		rt_delayed_1 <= rt;		
	end
	

	default
	clocking @(posedge clk);
	endclocking

	default disable iff (rst);

	// zadatak 1
	property p1;
		!temp |-> !(rdy || start || endd);
	endproperty : p1
	
	// zadatak 2
	property p2;
		err[*3] |=> !err;
	endproperty : p2

	// zadatak 3
	property p3;
		(err && rdy) |=> !(err && rdy);
	endproperty : p3
	
	// zadatak 4
	property p4;
		start |-> ##[1:$] rdy;
	endproperty : p4;
	
	// zadatak 5
	property p5;
		(err || stop || endd) |=> !rdy;
	endproperty : p5
	
	// zadatak 6
	property p61;
		endd |-> rdy;
	endproperty : p61
	
	property p62;
		stop |-> rdy;
	endproperty : p62
	
	property p63;
		err |-> rdy;
	endproperty : p63
	
	// zadatak 7
	property p7;
		endd |-> (!status && !status_valid);
	endproperty : p7
	
	// zadatak 8
	property p81;
		rt |-> !enable;
	endproperty : p81
	
	property p82;
		enable |-> ( rt_delayed_1 == 0 && rt_delayed_2 == 0 );
	endproperty : p82
	
	property p83;
		$fell(rt) ##[2:$] enable;
	endproperty : p83	

	//zadatak 9
	property p91;
		//(rdy && !interrupt) |=> rdy;
		$rose(rdy) |-> rdy s_until_with interrupt;
	endproperty : p91
	
	property p92;
		//(start && !interrupt) |=> start;
		$rose(start) |-> start s_until_with interrupt;
	endproperty : p92

	property p93;
		(rdy && interrupt) |=> !rdy;
	endproperty : p93

	property p94;
		(start && interrupt) |=> !start;
	endproperty : p94
	
	//zadatak 10
	property p10;
		req |-> ##5 ack;
	endproperty : p10

	//assert property(p1);
	//assert property(p2);
	//assert property(p3);
	//assert property(p4);
	//assert property(p5);
	//assert property(p61);
	//assert property(p62);	
	//assert property(p63);
	//assert property(p7);
	//assert property(p81);
	//assert property(p82);
	//cover property(p83);
	assert property(p91);
	assert property(p92);
	//assert property(p93);
	//assert property(p94);
	
	
endmodule
