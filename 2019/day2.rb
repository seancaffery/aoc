# frozen_string_literal: true

def input
    @input ||= File.read("day2_input").split(',').map(&:to_i)
end

def init(instructions, noun, verb)
  updated_instructions = instructions.clone
  updated_instructions[1] = noun
  updated_instructions[2] = verb
  updated_instructions  
end

def op1(instructions, op_pc)
  pos1 = instructions[op_pc + 1]
  pos2 = instructions[op_pc + 2]
  instructions[pos1] + instructions[pos2]
end

def op2(instructions, op_pc)
  pos1 = instructions[op_pc + 1]
  pos2 = instructions[op_pc + 2]
  instructions[pos1] * instructions[pos2]
end

def run_program(instructions, run_init, noun, verb)
  pc = 0
  if run_init
    instructions = init(instructions, noun, verb)
  end

  while true
    op = instructions[pc]
    if op == 1
        result = op1(instructions, pc)
        result_pos = instructions[pc+3]
        instructions[result_pos] = result
        pc += 4
    elsif op == 2
        result = op2(instructions, pc)
        result_pos = instructions[pc+3]
        instructions[result_pos] = result
        pc += 4
    elsif op == 99
        break
    elsif
        puts "oops, unexpected opcode: " + instructions[pc]
        return
    end
  end
  return instructions[0]
end

def find_values(target)
  i = 0
  j = 0
  while i < 100 do
    while j < 100 do
      result = run_program(input, true, i, j)
      if result == target
        return [i, j]
      end
      j += 1
    end
    i += 1
    j = 0
  end
end

def part2(target)
  noun, verb = find_values(target)
  (100 * noun) + verb
end

if __FILE__ == $PROGRAM_NAME
  puts run_program(input, true, 12, 2)
  puts part2(19690720)
end