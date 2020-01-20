class Rook
  require  './piece'
  include Piece
  attr_accessor :moves, :unicode, :color, :name

  def initialize(color='w')
    @name = 'Rook'
    @color = color
    @color == 'w' ? @unicode = "R".light_white : @unicode = "R".light_green
    @moves = [*-7..7].map {|n| [0,n]} + [*-7..7].map {|n| [n,0]}
  end

  def path_blocked?(start, finish, squares, color)
    if start[0] == finish[0]
      (start[1].to_i+1...finish[1].to_i).each do |n|
        squares.each do |square|
          if square.coordinate == "#{start[0]}#{n}"
            return true if !square.piece.nil?
          end
        end
      end
    elsif start[1] == finish[1]
      (start[0]...finish[0]).drop(1).each do |letter|
        squares.each do |square|
          if square.coordinate == "#{letter}#{start[1]}"
            return true if !square.piece.nil?
          end
        end
      end
    end
    return false

  end

end