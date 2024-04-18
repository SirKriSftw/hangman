require_relative "player"
require "date"

class Game
  attr_accessor :word, :correct_letters, :guessed_letters, :player, :guessed

  def initialize(word)
    @word = word
    @correct_letters = word.split("")
    @guessed_letters = []
    @guessed = false
    @player = Player.new(self)
  end

  def play()
    while(!guessed && player.health >= 0) do
      print_board()
      player.print_health()
      check_letter_guess(player.take_guess())
      print_guessed_letters()
    end
  end

  def print_board()
    correct_letters.each do |letter|
      if(guessed_letters.include?(letter))
        print "#{letter} "
      else
      print "_ "
      end
    end
    print "\t\t"
  end

  def print_guessed_letters()
    display = guessed_letters.sort()
    puts "\nGuessed letters: #{display}"
  end

  def check_letter_guess(letter)
    unless correct_letters.include?(letter)
      player.take_damage()
    end
    check_win()
  end

  def check_win()
    if (correct_letters.all? { |letter| guessed_letters.include?(letter)})
      self.guessed = true
      puts "You win!"
    end
  end

  def save_game()
    curr_date_time = DateTime.now.strftime "%d/%m/%Y %H:%M".gsub("/", "-").gsub(":", "_")
    save_dir = Dir.new("lib/saved_games")
    saved_game = Marshal::dump(self)
    save_file = File.new("lib/saved_games/#{curr_date_time}", "w")
    save_file.puts(saved_game)
    save_file.close
    if save_dir.children().length > 4
      File.delete("lib/saved_games/#{save_dir.children()[1]}")
    end
  end

  def self.load_game(file_content)
    p Marshal::load(file_content)
  end
end
