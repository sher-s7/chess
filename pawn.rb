class Pawn
  require './piece'
  include Piece
  attr_accessor :moves, :unicode, :color, :name

  def initialize(color='w')
    @name = 'Pawn'
    @color = color
    @color == 'w' ? @unicode = "P".light_white : @unicode = "P".light_green
    @moves = [[0,1]]
  end

  def path_blocked?(start,finish,squares)
    squares.each do |square|
      if square.coordinate == finish
        return true if !square.piece.nil?
      end
    end
    return false
  end
  

end