require 'rspec/autorun'

# GovTech - HackerTrail #1
# Find longest chain of dominoes in given string

# Example 1:
# input = '1-2,2-3,3-4,5-6,6-1,1-2,2-3'
# answer = 4

# Example 2:
# input = '1-2,3-4,5-6,7-8'
# answer = 1

class RubyOne
  def find_longest_chain(input)
    max = 1
    current_max = 1

    dominoes = input.split(',')

    for i in (0...(dominoes.size - 1))
      if dominoes[i].split('-')[1] == dominoes[i+1].split('-')[0]
        current_max += 1
      else
        current_max = 1
      end

      max = current_max if max < current_max
    end

    max
  end
end

RSpec.describe RubyOne do
  subject { RubyOne.new.find_longest_chain(input) }

  context 'sample #1' do
    let(:input) { '1-2,2-3,3-4,5-6,6-1,1-2,2-3,3-4,4-5,1-2,3-2,4-5,5-6,6-1,1-2,2-3,3-7,7-8,8-1,1-9,0-1' }

    it 'returns 9' do
      expect(subject).to eq 9
    end
  end

  context 'sample #2' do
    let(:input) { '1-2,3-4,3-1,0-2,4-6' }

    it 'returns 1' do
      expect(subject).to eq 1
    end
  end

  context 'sample #3' do
    let(:input) { '1-2,2-3,3-4,5-6,6-1,1-2,2-3' }

    it 'returns 4' do
      expect(subject).to eq 4
    end
  end

  context 'sample #4' do
    let(:input) { '1-2,3-4,5-6,7-8' }

    it 'returns 1' do
      expect(subject).to eq 1
    end
  end

  context 'sample #5' do
    let(:input) { '1-2' }

    it 'returns 1' do
      expect(subject).to eq 1
    end
  end

  context 'sample #6' do
    let(:input) { '1-20,20-3,1-18,18-9,5-6' }

    it 'returns 2' do
      expect(subject).to eq 2
    end
  end

  context 'sample #7' do
    let(:input) { '1-120,120-300,7-80,80-90,1-2,2-3' }

    it 'returns 2' do
      expect(subject).to eq 2
    end
  end

  context 'sample #8' do
    let(:input) { '0-1,1-2,2-3,3-5,5-7,7-0' }

    it 'returns 6' do
      expect(subject).to eq 6
    end
  end

  context 'sample #9' do
    let(:input) { '1-2,1-2,1-2,1-2' }

    it 'returns 1' do
      expect(subject).to eq 1
    end
  end
end
