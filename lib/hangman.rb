require_relative "game"
require_relative "player"
MIN_LENGTH = 5
MAX_LENGTH = 12

print "Would you like to load a game? (Y/N): "
input = gets.chomp

unless input.upcase == "Y"
  play_new()
else
  play_load()
end



def clean_file(file)
  lines = File.readlines(file)
  cleaned_file = lines.map { |line| line.length < MIN_LENGTH || line.length > MAX_LENGTH ? "" : line}
  cleaned_file.reject! { |line| line.empty? }
  File.open(file, "w") { |line| line.puts cleaned_file}
end

def select_word(file)
  lines = File.readlines(file)
  word = lines[rand(0..lines.length-1)].strip
end

def play_new()
  file = "10000 words.txt"
  if File.exist?(file)
    clean_file(file)
    word = select_word(file)

    game = Game.new(word);
    game.play()
  end
end

def play_load()
  load_dir = Dir.new("lib/saved_games")
  saved_games = load_dir.children[1..(load_dir.children.length-1)]
  saved_games.each_with_index {|game, i| puts "(#{i+1}) #{game}" }
  print "What game would you like to load?(1/2/3): "
end
