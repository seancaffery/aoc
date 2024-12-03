path = File.expand_path("3/input")
input = File.readlines(path).join("")

puts input
       .gsub("\n", "")
       .scan(/mul\((\d+),(\d+)\)/)
       .flat_map { |a| a.map(&:to_i).reduce(&:*) }
       .sum

input = File.readlines(path).join("")
enabled = true
operations = input.gsub("\n", "").scan(/mul\(\d+,\d+\)|don't\(\)|do\(\)/)

res =
  operations
    .map do |operation|
      if enabled && operation =~ /mul/
        operation.match(/(\d+),(\d+)/).captures.map(&:to_i).reduce(:*)
      elsif operation =~ /don't/
        enabled = false
        0
      elsif operation =~ /do/
        enabled = true
        0
      end
    end
    .compact
    .sum

puts res
