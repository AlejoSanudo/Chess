#### run rspec spec/pieces_spec.rb (full path)
require 'spec_helper'
require './pieces'

describe Pawn do
	before do
		@pawn = Pawn.new('white')
	end

	it "should have a white color" do
		expect(@pawn.color).to eq('white')
	end
end

describe Rook do
	before do
		@rook = Rook.new('black')
	end

	it "should have a color 'white' or 'black'" do
		expect(@rook.color).to eq('white', 'black')
	end
end

describe Bishop do
	before do 
		@bishop = Bishop.new('white')
	end


end

describe Knight do
	before do
		@knight = Knight.new('black')
	end


end

describe Queen do
	before do
		@queen = Queen.new('white')
	end


end

describe King do
	before do
		@king = King.new('black')
	end


end

