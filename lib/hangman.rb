file = "1000 words.txt"

if File.exist?(file)
    lines = File.readlines(file)
    lines.each do |line|
      puts line
    end
end
