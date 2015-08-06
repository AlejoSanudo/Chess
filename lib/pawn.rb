class Pawn < Piece
  attr_accessor :icon 
  attr_reader :first_tour

  def initialize(color)
    super(color)
    @first_tour = true
    @icon = color == 'black' ? "\u2659" : "\u265F"
  end

  # def move(board, beg_row, beg_col, end_row, end_col)

  # end

  def is_there_a_piece(obstacle)
    !obstacle.is_a? Piece
  end

  def valid_mvnt_forward_two?(obstacle)
    !obstacle.is_a? Piece
  end

  def valid_mvnt_diagonal?(obstacle)
    obstacle.is_a?(Piece) && !self.is_same_team?(obstacle)
  end

  def valid_movement?(board, beg_row, beg_col, end_row, end_col)
    # check the color and standardize by multiplicating by 1 or -1 depending on poisiton of the team, top or bottom, 
    # relative the the X and Y axis of the board 

    diff_row = ( end_row - beg_row ) #* (@color == 'white' ? -1 : 1)
    diff_col = ( end_col - beg_col ) #* (@color == 'white' ? -1 : 1)
    obstacle = board[end_row][end_col]

    # same column
    if diff_col == 0
      # forward 1
      if diff_row == 1
        return !obstacle.is_a?(Piece)
      # forward 2
      elsif diff_row == 2 && first_tour
        return !( board[end_row - 1][end_col].is_a?(Piece) || obstacle.is_a?(Piece) )
      # forward > 2
      else
        return false
      end
    # different column   
    elsif diff_col == 1
      # diagonal 1
      if diff_row == 1
        return ( obstacle.is_a?(Piece) && !self.is_same_team?(obstacle) )
      else
        return false
      end
    # diff columns > 1
    else
      return false
    end
          
    # puts "diff row" + diff_row.to_s
    # puts "diff col" + diff_col.to_s
  end
end
