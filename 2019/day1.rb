# frozen_string_literal: true

def input
    @input ||= File.readlines("day1_input")
end

def fuel(mass)
  (mass / 3.0).to_i - 2 
end

def fuel_with_fuels_fuel(mass)
  f = fuel(mass)
  if f <= 0
    return 0
  end
  f + fuel_with_fuels_fuel(f)
end

def part1
  input.map{|mass| fuel(mass.chomp.to_i) }.reduce(:+)
end

def part2
  input.map{|mass| fuel_with_fuels_fuel(mass.chomp.to_i) }.reduce(:+)
end

if __FILE__ == $PROGRAM_NAME
  puts part1
  puts part2
end