class Knight
  require  './piece'
  include Piece
  attr_accessor :moves, :unicode, :color, :name
  def initialize(color='w')
    @name = 'Knight'
    @color = color
    @color == 'w' ? @unicode = "k".light_white : @unicode = "k".light_green
    @moves = [[-1,2],[1,2],[2,1],[2,-1],[1,-2],[-1,-2],[-2,-1],[-2,1]]
  end

  def path_blocked?(a,b,c) #always false since knight makes jump moves
    return false
  end

end