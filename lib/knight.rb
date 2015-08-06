class Knight < Piece
  attr_accessor :icon
  
  def initialize(color)
    super(color)
    @icon = color == 'black' ? "\u2658" : "\u265E"
  end

  def valid_movement?(board, beg_row, beg_col, end_row, end_col)
    # => check if the destination is a piece that is your color
    if board[end_row][end_col].class < Piece && board[end_row][end_col].color == @color
      return false
    end
    # => return an array of possible move coordinates
    moves = [
      [beg_row+2, beg_col+1],
      [beg_row+2, beg_col-1],
      [beg_row-2, beg_col+1],
      [beg_row-2, beg_col-1],
      [beg_row-1, beg_col+2],
      [beg_row-1, beg_col-2],
      [beg_row+1, beg_col+2],
      [beg_row+1, beg_col-2]
    ]
    # => compare endpoint to this array
    moves.include?([end_row,end_col]) 
  end
end
