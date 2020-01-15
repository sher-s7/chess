class King
  include 'piece'
  attr_accessor :moves, :unicode, :color

  def initialize(color)
    @color = color
    @color == 'w' ? @unicode = "\u2654" : @unicode = "\u265A" #king unicode
    @moves = [[0,1],[0,-1],[1,0],[-1,0],[-1,1],[1,1],[-1,-1],[1,-1]]
  end

end