//APB SEQUENCER CLASS
/*The sequencer acts as a mediator or bridge, managing the bidirectional flow of 
randomized sequence items (transactions) between the stimulus-generating sequences and the physical driver*/
class apb_sequencer extends uvm_sequencer #(apb_trans);
	`uvm_component_utils(apb_sequencer)
	
	function new (string name = "apb_sequencer",uvm_component parent);
		super.new(name,parent);
	endfunction
endclass

