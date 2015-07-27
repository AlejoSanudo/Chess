def valid_input?(user_input)    
  user_input =~ /^[a-h][1-8]$/ ? true : false
end

def get_row(user_input)
  user_input[1].to_i - 1
end

def get_col(user_input)
  letters = {
    a: 0,
    b: 1,
    c: 2,
    d: 3,
    e: 4,
    f: 5,
    g: 6,
    h: 7
  }
  letters[user_input[0].to_sym].to_i
end

def valid_piece?(row, col, board, color)
  (board[row][col] != " ") && (board[row][col].color == color)
end



