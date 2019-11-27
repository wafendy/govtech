require 'rspec/autorun'

# GovTech - HackerTrail #2

# Given array of strings.
# - Each item in the array represents a house.
# - Each string has 3 numbers which represent the cost of planting a flower.
# - Each position in the string represents the colour of the flower.
#
# Find cheapest way to plant flowers in all houses, so there is no consecutive colour chosen.
#
# Example 1:
# [
#   '1 2 3',
#   '3 4 2'
# ]
# Answer: 3


# Example 2:
# [
#   '1 2 3',
#   '3 10 12'
# ]
# Answer: 5


# Example 3:
# [
#   '1 2 3',
#   '3 10 12',
#   '9 1 2'
# ]
# Answer: 6


class Node
  attr_reader :color, :total, :level

  def initialize(color, level, total)
    @color = color
    @total = total
    @level = level
  end

  def to_s
    puts "color: #{color} - level: #{level} - total: #{total}"
  end
end

class RubyTwo
  def find_minimal_cost(input)
    stack = []
    temp_array = []

    input[0].split(' ').each_with_index do |number, i|
      stack.push Node.new(i, 0, number.to_i)
    end

    for item in stack
      input[item.level + 1].split(' ').each_with_index do |number, i|
        next if item.color == i
        temp_array.push Node.new(i, item.level + 1, item.total + number.to_i)
      end
    end

    min_node = temp_array.min{ |a, b| a.total <=> b.total }

    loop do
      temp_array = []
      break if min_node.level == input.size - 1

      input[min_node.level + 1].split(' ').each_with_index do |number, i|
        next if min_node.color == i
        temp_array.push Node.new(i, min_node.level + 1, min_node.total + number.to_i)
      end

      min_node = temp_array.min{ |a, b| a.total <=> b.total }
    end

    min_node.total
  end
end

RSpec.describe RubyTwo do
  subject { RubyTwo.new.find_minimal_cost(input) }

  context 'sample #1' do
    let(:input) { ['1 2 3', '3 4 2'] }

    it 'returns 3' do
      expect(subject).to eq 3
    end
  end

  context 'sample #2' do
    let(:input) { ['1 2 3', '3 10 12'] }

    it 'returns 5' do
      expect(subject).to eq 5
    end
  end

  context 'sample #3' do
    let(:input) { ['1 2 3', '3 10 12', '9 1 2'] }

    it 'returns 6' do
      expect(subject).to eq 6
    end
  end

  context 'sample #4' do
    let(:input) { ['3 2 9', '9 1 2', '7 5 3', '1 1 2', '1 1 2'] }

    it 'returns 9' do
      expect(subject).to eq 9
    end
  end

  context 'sample #4' do
    let(:input) { ['1 1 1', '1 1 1', '1 1 1'] }

    it 'returns 3' do
      expect(subject).to eq 3
    end
  end

  context 'sample #5' do
    let(:input) { ['0 1 2', '2 1 0', '1 0 2'] }

    it 'returns 0' do
      expect(subject).to eq 0
    end
  end
end
