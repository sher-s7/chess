module Piece
  def valid_move?(start, finish)
    x, y = start[0], start[1]
    x_shift, y_shift = x+finish[0], y+finish[1]
    return false if x_shift < 0 || y_shift < 0 || x_shift>7 || y_shift>7
    return true
  end
end