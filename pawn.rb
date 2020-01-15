class Pawn
  include 'piece'
  attr_accessor :moves, :unicode, :color

  def initialize(color)
    @color = color
    @color == 'w' ? @unicode = "\u2659" : @unicode = "\u265F" #pawn unicode
    @moves = [[0,1]]
  end

end