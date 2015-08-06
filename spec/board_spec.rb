#### run rspec spec/pieces_spec.rb (full path)
require_relative 'spec_helper'
require './Board'
# require './methods'

  
describe Board do 
  
  before :each do
    @board = Board.new('')
  end 

  it "has 16 pawns when board is created" do
    expect@board.get_pieces(Pawn).should eq(16)
  end

   it "has 4 knights when board created" do
    @board.get_pieces(Knight).should eq(4)
  end

  it "has 4 rooks when created" do
    @board.get_pieces(Rook).should eq (4)
  end

  it "has 4 bishops when created" do
    @board.get_pieces(Bishop).should eq (4)
  end

  it "has 2 queens when created" do
    @board.get_pieces(Queen).should eq (2)
  end
  
  it "has 2 kings when created" do
    @board.get_pieces(King).should eq (2)
  end

end