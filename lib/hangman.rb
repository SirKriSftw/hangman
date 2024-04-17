require_relative "game"
require_relative "player"
MIN_LENGTH = 5
MAX_LENGTH = 12

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

file = "10000 words.txt"
if File.exist?(file)
  clean_file(file)
  word = select_word(file)

  game = Game.new(word);
  game.play()
end
