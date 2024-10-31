module v1_checker (
    input clk,
    input rst,
    output err
	) ;

	default
	clocking @(posedge clk);
	endclocking

	default disable iff (!rst);
	
	// za zadatak 2
	property p2;
		err[*1:3] ##1 !err;
	endproperty : p2

	assert property (p2);
	
	// za zadatak 3
	property p3;
		(err && rdy) ##1 !(err && rdy)
	endproperty : p3
	
	assert property (p3);
	
	// zadatak 5
	property p5;
		(err || stop || endd) ##1 !rdy
	endproperty : p2
	
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
		enable |-> ( prev(!rt, 1) && prev(!rt, 2) );
	endproperty : p82
	
	//zadatak 9
	property p91;
		(rdy && !interrupt) |=> rdy;
	endproperty : p91
	
	property p92;
		(start && !interrupt) |=> start;
	endproperty : p92

	property p93;
		(rdy && interrupt) |=> !rdy;
	endproperty : p93

	property p94;
		(start && interrupt) |=> !start;
	endproperty : p94
	
	//zadatak 10
	property p10;
		req |-> ##5 ack
	endproperty : p10
	

endmodule
