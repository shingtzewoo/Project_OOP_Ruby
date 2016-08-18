class Game
  attr_accessor :board, :AI, :player, :guesses
  def initialize player_name
    @board = Board.new
    @AI = Computer.new("Jarvis")
    @player = Human.new(player_name)
    @guesses = 12
    @AI.generator(@board.colors)
    @answer = " "
  end

  def case_tries
    @answer = gets.chomp
    case @answer
    when "codebreaker"
      while guesses > 0
        @player.guess(@AI.computercode, "You")
        @guesses-=1
        @player.hint(@AI.computercode, @player.guess_array, @board.feedback, @board.feedback_colors)
        puts "\nNo. of turns left: #{@guesses}"
        if @guesses == 0
          puts "\n You lost! You didn't manage to guess within 12 tries. "
          puts "\n The color code was #{@AI.computercode.join('-')}"
        end
      end
    when "codemaker"
      while guesses > 0
      end
    end
  end

  def start
    puts "Do you want to be the codebreaker or codemaker?"
    case_tries
    until (@answer == "codemaker" || @answer == "codebreaker")
      puts "Please put a valid answer! Either codemaker or codebreaker!"
      case_tries
    end
  end

end

class Board
  attr_accessor :matrix, :feedback, :colors, :feedback_colors
  def initialize
    @matrix = [" ", " ", " ", " "]
    @feedback = [" ", " ", " ", " "]
    @colors = ["red", "blue", "yellow", "green", "purple", "orange"]
    @feedback_colors = ["white", "black"]
  end

end

class Player
  attr_accessor :guess_array
  def guess(array, player)
    @guess_array = [" ", " ", " ", " "]
    puts "Colors: red, blue, yellow, green, purple, orange."
    puts "\n1st slot guess"
    slot_1 = gets.chomp
    puts "\n2nd slot guess"
    slot_2 = gets.chomp
    puts "\n3rd slot guess"
    slot_3 = gets.chomp
    puts "\n4th slot guess"
    slot_4 = gets.chomp
    @guess_array[0] = slot_1.downcase
    @guess_array[1] = slot_2.downcase
    @guess_array[2] = slot_3.downcase
    @guess_array[3] = slot_4.downcase
    if @guess_array == array
      puts "#{player} have won, you managed to guess the code!"
      exit
    else
      puts "\nWrong guess!"
    end
  end

  def hint(code, guesses, feedback, color)
    i = 0
    while i < code.length
      if code[i] == guesses[i]
        feedback[i] = color[1]
      elsif code[i] != guesses[i] && code.include?(guesses[i])
        feedback[i] = color[0]
      elsif code[i] != guesses[i]
        feedback[i] = "____"
      end
      i+=1
    end
    print "The hints are: #{feedback.join("|")}"
  end
end

class Computer < Player
  attr_accessor :name, :computercode
  def initialize name
    @name = name
    @computercode = []
  end

  def generator array
    color1 = array.sample(1).join("")
    color2 = array.sample(1).join("")
    color3 = array.sample(1).join("")
    color4 = array.sample(1).join("")
    @computercode << color1 << color2 << color3 << color4
  end
end

class Human < Player
  attr_accessor :name
  def initialize name
    @name = name
  end
end