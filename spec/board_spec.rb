require_relative "spec_helper"
require "board"

describe Board do
  let(:board) { Board.new }

  describe "#initialize" do 
  	it "initializes the board with an array" do 
  		expect(board.cells).to eql [1,2,3,4,5,6,7,8,9]
  	end
  end

  describe "#no_moves_left?" do 
    context "board is empty" do 
  	 it "has moves available" do 
  		expect(board.no_moves_left?).to eql false
  	 end
    end

    context "board is full" do 
      before do 
        board.cells = ['x','x','x','x','x','x','x','x','x'] #refactor
      end

  	   it "has no moves left" do 
  		  expect(board.no_moves_left?).to eql true
  	   end
    end
  end

  describe "#cell_open?" do 
    context "cell not taken" do 
  	 it "returns true" do 
  		  expect(board.cell_open?(5)).to eql true
  	 end
    end

    context "cell is taken" do 
      before do 
        board.cells[5] = 'x'
      end

      it "returns false" do 
  		  expect(board.cell_open?(6)).to eql false
  	 end
    end
  end

  describe "#change_board" do 
    it "changes the correct place on board from move" do 
      board.change_board(5,'x')
      expect(board.cells[4]).to eql 'x'
    end
  end

end

