class Sudoku
  DIGITS = (1..9).to_a

  def initialize
    @sudoku = []
    9.times do
      @sudoku.push [0] * 9
    end
  end

  def pick_left_row(previous)
    first_row = (DIGITS - previous[0..2]).sample(3)
    second_row = (DIGITS - first_row - previous[3..5]).sample(3)
    third_row = DIGITS - first_row - second_row

    first_row + second_row + third_row
  end

  def pick_top_col(previous)
    target = []
    first_col = (DIGITS - previous.select.with_index{|v,i| [0, 3, 6].include?(i)}).sample(3)
    target[0] = first_col[0]
    target[3] = first_col[1]
    target[6] = first_col[2]

    second_col = (DIGITS - first_col - previous.select.with_index{|v,i| [1, 4, 7].include?(i)}).sample(3)
    target[1] = second_col[0]
    target[4] = second_col[1]
    target[7] = second_col[2]

    third_col = DIGITS - first_col - second_col
    target[2] = third_col[0]
    target[5] = third_col[1]
    target[8] = third_col[2]

    target
  end

  def pick_bottom_col(previous, first)
    target = []
    first_col = DIGITS - previous.select.with_index{|v,i| [0, 3, 6].include?(i)} - first.select.with_index{|v,i| [0, 3, 6].include?(i)}
    target[0] = first_col[0]
    target[3] = first_col[1]
    target[6] = first_col[2]

    second_col = DIGITS - previous.select.with_index{|v,i| [1, 4, 7].include?(i)} - first.select.with_index{|v,i| [1, 4, 7].include?(i)}
    target[1] = second_col[0]
    target[4] = second_col[1]
    target[7] = second_col[2]

    third_col = DIGITS - first_col - second_col
    target[2] = third_col[0]
    target[5] = third_col[1]
    target[8] = third_col[2]

    target
  end



  def pick_right_row(previous, first)
    first_row = (DIGITS - previous[0..2] - first[0..2])
    second_row = (DIGITS - previous[3..5] - first[3..5])
    third_row = (DIGITS - previous[6..8] - first[6..8])

    first_row + second_row + third_row
  end

  def generate
    @sudoku[4] = DIGITS.shuffle
    @sudoku[3] = pick_left_row(@sudoku[4])
    @sudoku[5] = pick_right_row(@sudoku[3], @sudoku[4])

    @sudoku[1] = pick_top_col(@sudoku[4])
    @sudoku[7] = pick_bottom_col(@sudoku[4], @sudoku[1])


    print
  end

  def print
    (0..2).to_a.each do |i|
      (0..2).to_a.each do |j|
        row = []
        (0..2).to_a.each do |k|
          row = row + @sudoku[i * 3 + k][(j * 3)..(j * 3 + 2)] + [' ']
      # puts "#{@sudoku[ci][0]}|#{@sudoku[ci][1]}|#{@sudoku[ci][2]} #{@sudoku[ci + 1][0]}|#{@sudoku[ci + 1][1]}|#{@sudoku[ci + 1][2]} #{@sudoku[ci + 2][0]}|#{@sudoku[ci + 2][1]}|#{@sudoku[ci + 2][2]}"
      # puts "#{@sudoku[ci][3]}|#{@sudoku[ci][4]}|#{@sudoku[ci][5]} #{@sudoku[ci + 1][3]}|#{@sudoku[ci + 1][4]}|#{@sudoku[ci + 1][5]} #{@sudoku[ci + 2][3]}|#{@sudoku[ci + 2][4]}|#{@sudoku[ci + 2][5]}"
      # puts "#{@sudoku[ci][6]}|#{@sudoku[ci][7]}|#{@sudoku[ci][8]} #{@sudoku[ci + 1][6]}|#{@sudoku[ci + 1][7]}|#{@sudoku[ci + 1][8]} #{@sudoku[ci + 2][6]}|#{@sudoku[ci + 2][7]}|#{@sudoku[ci + 2][8]}"
        end
        puts row.join(' ')
      end
      puts ''
    end
  end
end

Sudoku.new.generate
