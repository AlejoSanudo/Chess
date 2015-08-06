class Bishop < Piece
  attr_accessor :icon
  
  def initialize(color)
    super(color)
    @icon = color == 'black' ? "\u2657" : "\u265D"
  end

  def valid_movement?(board, beg_row, beg_col, end_row, end_col) 
    # check the color and standardize by multiplicating by 1 or -1 depending on poisiton of the team, top or bottom, 
    # relative the the X and Y axis of the board 
    diff_row = ( end_row - beg_row ) 
    diff_col = ( end_col - beg_col ) 

  #this checks if the move is diagonal
  if (diff_row).abs == (diff_col).abs

    #this checks which of the four possible diagonal the piece is taking AND it is checking if there are pieces on the way
    if diff_row > 0 && diff_col > 0
      start = [beg_row, beg_col]
      while start[0] < end_row
        start[0] += 1
        start[1] += 1
        return false if board[start[0]][start[1]].is_a? Piece
      end
        if board[start[0]][start[1]].is_a? Piece && (board[start[0]][start[1]] == board[end_row][end_col]) && (board[end_row][end_col].color != self.color)
          return true
        else
          return false
        end
    end

    if diff_row < 0 && diff_col < 0
      start = [beg_row, beg_col]
      while start[0] > end_row
        start[0] -= 1
        start[1] -= 1
        return false if board[start[0]][start[1]].is_a? Piece
      end
        if board[start[0]][start[1]].is_a? Piece && (board[start[0]][start[1]] == board[end_row][end_col]) && (board[end_row][end_col].color != self.color)
          return true
        else
          return false
        end
    end

    if diff_row > 0 && diff_col < 0
      start = [beg_row, beg_col]
      while start[0] > end_row
        start[0] += 1
        start[1] -= 1
        return false if board[start[0]][start[1]].is_a? Piece
      end
      if board[start[0]][start[1]].is_a? Piece && (board[start[0]][start[1]] == board[end_row][end_col]) && (board[end_row][end_col].color != self.color)
          return true
        else
          return false
        end
    end

    if diff_row < 0 && diff_col > 0
      start = [beg_row, beg_col]
      while start[0] > end_row
        start[0] -= 1 
        start[1] += 1
        return false if board[start[0]][start[1]].is_a? Piece
      end
      if board[start[0]][start[1]].is_a? Piece && (board[start[0]][start[1]] == board[end_row][end_col]) && (board[end_row][end_col].color != self.color)
          return true
        else
          return false
        end
      end
    end
    return false
  end
end
