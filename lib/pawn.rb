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

  def is_direction_allowed?(diff_row)
    if @color == 'white'
      diff_row > 0
    elsif @color == 'black'
      diff_row < 0
    else
      nil
    end
  end

  def valid_movement?(board, beg_row, beg_col, end_row, end_col) 
    ## factor to standardize the tests below between the white and black team (the top and bottom team)
    direction = @color == 'white' ? 1 : -1

    diff_row = ( end_row - beg_row )
    diff_col = ( end_col - beg_col )

    return false unless is_direction_allowed?(diff_row)

    obstacle = board[end_row][end_col]

    # same column
    if diff_col == 0
      # forward 1
      if diff_row == 1 * direction
        if !obstacle.is_a?(Piece)
          @first_tour = false
          return true
        else
          return false
        end
      # forward 2
      elsif ( diff_row == (2 * direction) ) && first_tour
        # check if in first case and second case there is no piece
        if !( board[end_row - direction][end_col].is_a?(Piece) || obstacle.is_a?(Piece) )
          @first_tour = false
          return true
        else
          return false
        end
      # forward > 2
      else
        return false
      end
    # different column   
    elsif diff_col == 1 * direction
      # diagonal 1
      if diff_row == 1 * direction
        if ( obstacle.is_a?(Piece) && !self.is_same_team?(obstacle) )
          first_tour = false
          return true
        else
          return false
        end
      else
        return false
      end
    # diff columns > 1
    else
      return false
    end
  end
end
