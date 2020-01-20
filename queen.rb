class Queen
  require './piece'
  include Piece
  attr_accessor :moves, :unicode, :color, :name
  def initialize(color='w')
    @name = 'Queen'
    @color = color
    @color == 'w' ? @unicode = "Q".light_white : @unicode = "Q".light_green
    @moves = getMoves  
  end

  def getMoves()
    vertical_moves = [*-7..7].map {|n| [0,n]}
    horizontal_moves = [*-7..7].map {|n| [n,0]}
    diagonal_moves = [*-7..7].map {|n| [n,n]} + [*-7..7].map {|n| [n,-n]}
    return vertical_moves + horizontal_moves + diagonal_moves
  end

  def get_path(start, finish)
    y1 = start[1].to_i
    y2 = finish[1].to_i
    path = []
    if start[0] > finish[0] && y1 > y2
      (finish[0]...start[0]).drop(1).each do |letter|
        path.push(letter)
      end
      (y2...y1).drop(1).each_with_index do |n, i|
        path[i] += "#{n}"
      end
    elsif start[0] > finish[0] && y1 < y2
      (finish[0]...start[0]).drop(1).each do |letter|
        path.push(letter)
      end
      arr = (y2-1).downto(y1+1).to_a
      arr.each_with_index do |n, i|
        path[i] += "#{n}"
      end
    elsif start[0] < finish[0] && y1 < y2
      (start[0]...finish[0]).drop(1).each do |letter|
        path.push(letter)
      end
      (y1...y2).drop(1).each_with_index do |n, i|
        path[i] += "#{n}"
      end
    elsif start[0] < finish[0] && y1 > y2
      (start[0]...finish[0]).drop(1).each do |letter|
        path.push(letter)
      end
      arr = (y1-1).downto(y2+1).to_a
      arr.each_with_index do |n, i|
        path[i] += "#{n}"
      end
    end
    return path
  end

  def path_blocked_diag?(start, finish, squares)
    path = get_path(start, finish)
    squares.each do |square|
      if path.include?(square.coordinate)
        return true if !square.piece.nil?
      end
    end
    return false
  end

  def path_blocked_straight?(start, finish, squares)
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

  def path_blocked?(start, finish, squares, color)
    start[0] == finish[0] || start[1] == finish[1] ? path_blocked_straight?(start, finish, squares) : path_blocked_diag?(start, finish, squares)
  end

end