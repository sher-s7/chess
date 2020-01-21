class Chess
  require './board'
  require './player'
  attr_reader :player1, :player2
  def initialize()
    @board = Board.new
    puts 'Player one, enter your name: '.light_white
    @player1 = Player.new(gets.chomp, 'w')
    puts 'Player two, enter your name: '.green
    @player2 = Player.new(gets.chomp, 'b')

    play
  end

  def play()
    @board.populate_board
    turn = @player1
    while true #change this to while !checkmate && !stalemate
      puts @board.to_s
      puts "#{turn.name}'s turn: "
      @board.make_move(turn)
      turn = swap_turn(turn)
    end
  end

  def swap_turn(turn)
    turn == @player1 ? turn = @player2 : turn = @player1
    return turn
  end

end
Chess.new