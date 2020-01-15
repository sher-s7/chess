class Knight
  include 'piece'
  attr_accessor :moves, :unicode, :color
  def initialize(color)
    @color = color
    @color == 'w' ? @unicode = "\u2658" : @unicode = "\u265E"
    @moves = [[-1,2],[1,2],[2,1],[2,-1],[1,-2],[-1,-2],[-2,-1],[-2,1]]
  end

end