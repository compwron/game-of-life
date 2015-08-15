class Game
  def initialize(board_size, live_cells)
    @board = 0.upto(board_size[0]).map {|i|
      0.upto(board_size[1]).map {|j|
        "X"
      }
    }

    live_cells.each {|cell|
      @board[cell.first][cell.last] = 'O'
    }
  end

  def cells
    @board.map {|i|
      i.join('')
    }
  end

  def live_generation
    2
  end
end


board_size = [1,1]
live_cells = [[0,0], [1,1]]
g = Game.new(board_size, live_cells)
puts g.cells # should be 0,0 0,1 1,0 1,1

g.live_generation

puts "CELLS:"
puts g.cells # should have first rule applied

