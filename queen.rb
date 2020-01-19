class Queen
  require './piece'
  include Piece
  attr_accessor :moves, :unicode, :color, :name
  def initialize(color='w')
    @name = 'Queen'
    @color = color
    @color == 'w' ? @unicode = "Q".light_white : @unicode = "Q".light_green
    @moves = getMoves  
  end

  def getMoves()
    vertical_moves = [*-7..7].map {|n| [0,n]}
    horizontal_moves = [*-7..7].map {|n| [n,0]}
    diagonal_moves = [*-7..7].map {|n| [n,n]} + [*-7..7].map {|n| [n,-n]}
    return vertical_moves + horizontal_moves + diagonal_moves
  end

end