module Piece
  require 'colorize'
  attr_reader :ALPHA
  @@ALPHA = ['A','B','C','D','E','F','G','H']
  def valid_move?(start, finish)
    x, y = start[0], start[1].to_i
    x = @@ALPHA.index(x)
    x_shift, y_shift = @@ALPHA.index(finish[0])-x, finish[1].to_i-y
    return false if !self.moves.include?([x_shift,y_shift])
    return true
  end

  
end