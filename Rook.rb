require './Piece'
class Rook < Piece
  attr_accessor :icon

  def initialize(color)
    super(color)
    @icon = color == 'black' ? "\u2656" : "\u265C"
  end

  def valid_movement?(board, beg_row, beg_col, end_row, end_col); end
end