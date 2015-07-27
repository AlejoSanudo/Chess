class Queen < Piece
  attr_accessor :icon

  def initialize(color)
    super(color)
    @icon = color == 'black' ? "\u2655" : "\u265B"
  end

  def valid_movement?(board, beg_row, beg_col, end_row, end_col); end
end