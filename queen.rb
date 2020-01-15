class Queen
  attr_accessor :moves, :unicode, :color
  def initialize(color)
    @color = color
    @color == 'w' ? @unicode = "\u2655" : @unicode = "\u265B"
    @moves = getMoves  
  end

  def getMoves()
    vertical_moves = [*-7..7].map {|n| [0,n]}
    horizontal_moves = [*-7..7].map {|n| [n,0]}
    diagonal_moves = [*-7..7].map {|n| [n,n]} + [*-7..7].map {|n| [n,-n]}
    return vertical_moves + horizontal_moves + diagonal_moves
  end

  def valid_move?(start, finish)
    x, y = start[0], start[1]
    x_shift, y_shift = x+finish[0], y+finish[1]
    return false if x_shift < 0 || y_shift < 0 || x_shift>7 || y_shift>7
    return true
  end

end