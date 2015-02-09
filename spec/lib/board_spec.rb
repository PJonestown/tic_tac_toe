require_relative "../spec_helper"
require "board"

describe Board do
  let(:board) { Board.new }

  context "#initialize" do 
  	it "initializes the board with an array" do 
  		expect(board.cells).to eql [1,2,3,4,5,6,7,8,9]
  	end
  end

  context "#no_moves_left?" do 
  	it "has moves available when board is empty" do 
  		expect(board.no_moves_left?).to eql false
  	end

  	it "has no moves left when board is full" do 
  		board.cells = ['x','x','x','x','x','x','x','x','x']
  		expect(board.no_moves_left?).to eql true
  	end
  end

  context "#cell_open?" do 
  	it "returns true when cell is not taken" do 
  		expect(board.cell_open?(5)).to eql true
  	end

  	it "returns false when cell is taken" do 
  		board.cells[5] = 'x'
  		expect(board.cell_open?(6)).to eql false
  	end
  end

  context "#change_board" do 
    it "A move changes the correct place of the board" do 
      board.change_board(5,'x')
      expect(board.cells[4]).to eql 'x'
    end
  end




end

