class Rook
  include 'piece'
  attr_accessor :moves, :unicode, :color

  def initialize(color)
    @color = color
    @color == 'w' ? @unicode = "\u2656" : @unicode = "\u265C" #rook unicode
    @moves = [*-7..7].map {|n| [0,n]} + [*-7..7].map {|n| [n,0]}
  end

end