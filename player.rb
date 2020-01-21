class Player
  attr_reader :name, :color, :dead_pieces
  def initialize(name,color)
    @name = name
    @color = color
    @dead_pieces = []
  end
end