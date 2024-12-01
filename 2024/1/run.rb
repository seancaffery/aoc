path = File.expand_path("1/input")
input = File.readlines(path)

one, two = [], []

input.each do |line|
  a, b = line.split("   ")

  one << a.to_i
  two << b.to_i
end

one.sort!
two.sort!

dist = 0
one.zip(two).each { |a, b| dist = dist + (a - b).abs }
puts dist

two_count = two.group_by(&:itself)
puts one.map { |a| a * two_count[a]&.length.to_i }.sum
