require "spec_helper"
require "player"

describe Player do
  let(:player) { Player.new('Paul', 'x') }

  describe "#initialize" do 
  	it "should not be the player's turn" do
  		expect(player.turn).to eql false
  	end

  	it "should have the correct name" do 
  		expect(player.name).to eql 'Paul'
  	end

  	it "should have the correct marker" do 
  		expect(player.marker).to eql 'x'
  	end

  end

end