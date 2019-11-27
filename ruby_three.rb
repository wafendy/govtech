class Node
  attr_reader :value, :color, :total, :level

  attr_accessor :left, :right

  def initialize(value, color, level, total)
    @value = value
    @color = color
    @total = total
    @level = level
    @left = nil
    @right = nil
  end
end

class RubyTwo
  def find_minimal_cost(input)
    stack = []
    temp_array = []

    input[0].split(' ').each_with_index do |number, i|
      stack.push Node.new(number.to_i, i, 0, number.to_i)
    end

    while(!stack.empty?)
      for item in stack
        input[item.level + 1].split(' ').each_with_index do |number, i|
          next if item.color == i
          temp_array.push Node.new(number.to_i, i, item.level + 1, item.total + number.to_i)
        end
      end

      stack.push temp_array.min{ |a, b| a.total <=> b.total }
      puts "#{stack[0].level} == #{input.size - 1}"
      break if stack[0].level == input.size - 1
    end
  end
end

a = gets
input = []
for i in (0...a.to_i)
  b = gets
  input.push b
end

puts RubyTwo.new.find_minimal_cost(input)
