class King
  require './piece'
  include Piece
  attr_accessor :moves, :unicode, :color, :name

  def initialize(color='w')
    @name = 'King'
    @color = color
    @color == 'w' ? @unicode = @unicode = "K".light_white : @unicode = "K".light_green
    @moves = [[0,1],[0,-1],[1,0],[-1,0],[-1,1],[1,1],[-1,-1],[1,-1]]
  end

  def path_blocked?(start, finish, squares, color)
    return false
  end

end