class Game
  attr_accessor :board, :AI, :player
  def initialize player_name
    @board = Board.new
    @AI = Computer.new("Jarvis")
    @player = Player.new(player_name)
  end

  @guesses = 12

  def start
    puts "Does he human player want to be the codebreaker or codemaker?"
    while guesses > 0
    end
  end

end

class Board
  attr_accessor :matrix, :feedback, :platform
  def initialize
    @matrix = [1, 2, 3, 4]
    @feedback = [1, 2, 3, 4]
  end

  feedback_colors = ["white", "black"]
  colors = ["red", "blue", "yellow", "green", "purple", "orange"]

  def display
    @matrix.each do |row|
      print "\n#{row}"
    end
  end
end

class Computer < Player
  attr_accessor :name
  def initialize name
    @name = name
    @computercode = []
  end

  def generator array
    color1 = array.sample(1)
    color2 = array.sample(1)
    color3 = array.sample(1)
    color4 = array.sample(1)
    @computercode << color1 << color2 << color3 << color4
  end
end

class Human < Player
  attr_accessor :name
  def initialize name
    @name = name
  end
end

class Player
  def guess(array)
    @guess_array = []
    puts "Colors: red, blue, yellow, green, purple, orange."
    puts "1st slot guess"
    slot_1 = gets.match(/\w/)
    puts "2nd slot guess"
    slot_2 = gets.match(/\w/)
    puts "3rd slot guess"
    slot_3 = gets.match(/\w/)
    puts "4th slot guess"
    slot_4 = gets.match(/\w/)
    @guess_array << slot_1 << slot_2 << slot_3 << slot_4
    if @guess_array == array
      puts " have won, you managed to guess the code!"
      exit
    end
  end

  def hint
  end
end




