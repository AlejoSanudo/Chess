require './Piece'
#\u
class Pawn < Piece
  attr_accessor :icon 
  attr_reader :first_tour

  def initialize(color)
    super(color)
    @first_tour = true
    @icon = color == 'black' ? "\u2659" : "\u265F"
  end

  def valid_movement?(board, beg_row, beg_col, end_row, end_col)
    # check the color and standardize by multiplicating by 1 or -1 depending on poisiton of the team, top or bottom, 
    # relative the the X and Y axis of the board 
    diff_row = ( end_row - beg_row ) * (@color == 'white' ? 1 : -1)
    diff_col = ( end_col - beg_col ) * (@color == 'white' ? 1 : -1) 
    binding.pry
    # first round for this pawn - move forward 2 or 1
    if first_tour
      binding.pry
      # forward
      if ( diff_row == 2 || diff_row == 1 ) && diff_col == 0
        binding.pry
        return true unless board[end_row][end_col].is_a? Piece
        return false
      # diagonal
      elsif diff_row == 1 && ( diff_col == 1 || diff_col == -1 )
        binding.pry
        return true if board[end_row][end_col].is_a? Piece
        return false
      # other options are non-athorized movements
      else
        binding.pry
        return false
      end
    # round other than first - move forward 1
    else
      # forward
      binding.pry
      if diff_row == 1 && diff_col == 0
        binding.pry
        return true unless board[end_row][end_col].is_a? Piece
      # diagonal
      elsif diff_row == 1 && ( diff_col == 1 || diff_col == -1 )
        binding.pry
        return true if board[end_row][end_col].is_a? Piece
        return false
      # other options are non-athorized movements
      else
        binding.pry
        return false
      end
    end
  end
end
