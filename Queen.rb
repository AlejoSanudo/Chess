require 'pry'
class Queen < Piece
  attr_accessor :icon

  def initialize(color)
    super(color)
    @icon = color == 'black' ? "\u2655" : "\u265B"
  end

  def valid_movement?(board, beg_row, beg_col, end_row, end_col)
    # => check if the destination is a piece that is your color
    if board[end_row][end_col].class < Piece && board[end_row][end_col].color == @color
      return false
    end
    # => return array of possible movements
    diagonally = []
    8.times do |i|
      diagonally << [beg_row+i, beg_col+i]
      diagonally << [beg_row+i, beg_col-i]
      diagonally << [beg_row-i, beg_col+i]
      diagonally << [beg_row-i, beg_col -i]
    end
    horizontally = []
    8.times do |i|
      horizontally << [beg_row, beg_col + i]
      horizontally << [beg_row, beg_col - i]
    end
    vertically = []
    8.times do |i|
      vertically << [beg_row+i,beg_col]
      vertically << [beg_row-i,beg_col]
    end
    moves = diagonally + horizontally + vertically
    # => check to see if endpoint is in those possible moves
    return false unless moves.include?([end_row,end_col])
    # => check to see if anything is in the way
  # => check horizontal movement
    if beg_row == end_row
      # => check if you are staying put
      return false if beg_col == end_col
      # => check if you are moving lef or right 
      end_col > beg_col ? dir = 1 : dir = -1
      # => ensure there are no pieces on the way to your destination
      (1..((end_col - beg_col).abs-1)).each do |col|
        return false if board[beg_row][beg_col + col*dir].class < Piece
      end
    end
  # => check vertical movement
    if beg_col == end_col
      # => check if you are staying put
      return false if beg_row == end_row
      # => check if you are moving up or down    
      end_row > beg_row ? dir = 1 : dir = -1
      # => ensure that there are no pieces on the way to your destination
      (1..((end_row - beg_row).abs-1)).each do |row|
        return false if board[beg_row + row*dir][end_col].class < Piece
      end
    end
  # => check diagonal movement  
    true
  end  
  
end