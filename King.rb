require './Piece'
class King < Piece
  attr_accessor :icon

  def initialize(color)
    super(color)
    @icon = color == 'black' ? "\u2654" : "\u265A"
  end

  def valid_movement?(board, beg_row, beg_col, end_row, end_col); end
end