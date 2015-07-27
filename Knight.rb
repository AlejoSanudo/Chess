class Knight < Piece
  attr_accessor :icon
  
  def initialize(color)
    super(color)
    @icon = color == 'black' ? "\u2658" : "\u265E"
  end

  def valid_movement?(board, beg_row, beg_col, end_row, end_col); end
end
