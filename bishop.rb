class Bishop
  include 'piece'
  attr_accessor :moves, :unicode, :color

  def initialize(color)
    @color = color
    @color == 'w' ? @unicode = "\u2657" : @unicode = "\u265D" #bishop unicode
    @moves = [*-7..7].map {|n| [n,n]} + [*-7..7].map {|n| [n,-n]}
  end

end