require_relative "game"
require_relative "player"

def clean_file(file)
  lines = File.readlines(file)
  cleaned_file = lines.map { |line| line.length < 5 || line.length > 12? "" : line}
  cleaned_file.reject! { |line| line.empty? }
  File.open(file, "w") { |line| line.puts cleaned_file}
end

def select_word(file)
  lines = File.readlines(file)
  word = lines[rand(0..lines.length-1)]
end

file = "1000 words.txt"
if File.exist?(file)
  clean_file(file)
  word = select_word(file)
  puts word
  game = Game.new();
end
