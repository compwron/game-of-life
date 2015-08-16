class Life
  def initialize(seed)
    @cells = seed.map { |c| Cell.new(c) }
  end

  def live_generation(next_gen_cells=[])
    @cells.each { |cell|
      if cell.neighbor_count(@cells) == 2
        next_gen_cells << c
      end
    }

    @cells = next_gen_cells
  end

  def live_cells
    @cells.map { |c| c.point }
  end
end

class Cell
  attr_reader :x, :y, :point

  def initialize(point)
    @x = point.first
    @y = point.last
    @point = point
  end

  def neighbor_count(cells)
    cells.select { |c| _is_neighbor(c) }
  end

  def _is_neighbor(cell)
    _neighbor_positions.include?(cell.point)
  end

  def _neighbor_positions
    @positions ||=
        [
            [x, y + 1],
            [x + 1, y + 1],
            [x + 1, y],
            [x + 1, y - 1],
            [x, y - 1],
            [x - 1, y - 1],
            [x - 1, y],
            [x - 1, y + 1]
        ]
  end
end
