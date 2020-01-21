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
    active_player = @player1
    inactive_player = @player2
    while true #change this to while !checkmate && !stalemate
      puts @board.to_s
      puts "#{active_player.name}'s turn: "
      @board.make_move(active_player, inactive_player)
      active_player = swap_turn(active_player)
      inactive_player = swap_turn(inactive_player)
      puts "Player1 dead: #{@player1.dead_pieces}"
      puts "Player2 dead: #{@player2.dead_pieces}"

    end
  end

  def swap_turn(turn)
    turn == @player1 ? turn = @player2 : turn = @player1
    return turn
  end

end
Chess.new