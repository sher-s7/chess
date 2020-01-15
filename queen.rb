class Queen
  include 'piece'
  attr_accessor :moves, :unicode, :color
  def initialize(color)
    @color = color
    @color == 'w' ? @unicode = "\u2655" : @unicode = "\u265B" #queen unicode
    @moves = getMoves  
  end

  def getMoves()
    vertical_moves = [*-7..7].map {|n| [0,n]}
    horizontal_moves = [*-7..7].map {|n| [n,0]}
    diagonal_moves = [*-7..7].map {|n| [n,n]} + [*-7..7].map {|n| [n,-n]}
    return vertical_moves + horizontal_moves + diagonal_moves
  end

end