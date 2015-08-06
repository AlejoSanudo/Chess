class Rook < Piece
  attr_accessor :icon
  def initialize(color)
    super(color)
    @icon = color == 'black' ? "\u2656" : "\u265C"
  end

  def valid_movement?(board, beg_row, beg_col, end_row, end_col)
    # => check if the destination is a piece that is not your color
    if board[end_row][end_col].class < Piece && board[end_row][end_col].color == @color
      return false
    end
    # => make sure your destination is on the same column/row
    if beg_col == end_col
      # => check if you are staying put
      return false if beg_row == end_row
      # => check if you are moving up or down    
      end_row > beg_row ? dir = 1 : dir = -1
      # => ensure that there are no pieces on the way to your destination
      (1..((end_row - beg_row).abs-1)).each do |row|
        return false if board[beg_row + row*dir][end_col].class < Piece
      end
      return true
    end  
    # => make sure your destination is on the same row/column
    if beg_row == end_row
    # => check if you are staying put
      return false if beg_col == end_col
    # => check if you are moving lef or right 
      end_col > beg_col ? dir = 1 : dir = -1
    # => ensure there are no pieces on the way to your destination
      (1..((end_col - beg_col).abs-1)).each do |col|
        return false if board[beg_row][beg_col + col*dir].class < Piece
      end
      return true
    end
    false  
  end
  
end
