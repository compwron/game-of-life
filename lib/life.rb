require 'pry'

class Life
  def initialize(seed)
    @cells = seed.map { |c| Cell.new(c) }
  end

  def live_generation(next_gen_cells=[])
    cell_neighbors = {}
    @cells.each { |cell|
      if [2, 3].include?(cell.neighbor_count(@cells))
        next_gen_cells << cell
      end
      cell.neighbors.each {|n|
        cell_neighbors[n] ||= 0 # there is a better way to do this. push with default?
        cell_neighbors[n] += 1
      }
    }

    cell_neighbors.each { |k, v|
      if v == 3 && not_in(k, next_gen_cells)
        next_gen_cells << Cell.new(k)
      end
    }

    @cells = next_gen_cells
  end

  def not_in(point, cells)
    !cells.map {|c| c.point}.uniq.include?(point)
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
    cells.select { |c| _is_neighbor(c) }.count
  end

  def _is_neighbor(cell)
    neighbors.include?(cell.point)
  end

  def neighbors
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
