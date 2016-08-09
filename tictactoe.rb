class Board
  attr_accessor :cross_player, :nought_player
  @@board = [[], [], []]

  def initialize(cross_player, nought_player)
    @cross_player = Crosses.new(player_name)
    @nought_player = Noughts.new(player_name)
  end

  def show
    puts @@board
  end

  class Crosses
    def initialize(player_name)
      @player = player
    end

    include Tictactoe
    turn("X")
  end

  class Noughts
    def initialize(player)
      @player = player
    end

    include Tictactoe
    turn("O")
  end

end

module Tictactoe
  def turn(char)
    begin
      puts
        'What position do you want to choose?' \
        ' (sample answers = middle right, top left, top right, middle middle, bottom left'

      position = gets.chomp
      case position
      when "top left"
      when "top middle"
      when "top right"
      when "middle left"
      when "middle middle"
      when "middle right"
      when "bottom left"
      when "bottom middle"
      when "bottom right"
        @@board = []
      else
        puts "Error, choose a valid position!"
        retry
      end
    end
  end
  def end
  end
end
