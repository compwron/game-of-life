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

  def pretty(cells)

    min_x = cells.sort_by {|c| c.first}.first.first
    max_x = cells.sort_by {|c| c.first}.last.first
    min_y = cells.sort_by {|c| c.last}.first.last
    max_y = cells.sort_by {|c| c.last}.last.last

    all = [min_x, min_y, max_x, max_y]
    return '' if all.include? nil
    return 'X' if all.uniq.count == 1

    grid = (min_x.upto(max_x - 1)).map {|x|
      (min_y.upto(max_y - 1)).map {|y|

        "O"
      }
    }
    cells.each{|c|
      x = c.first + min_x.abs
      y = c.last + min_y.abs

      inversed_x = max_x - x
      # binding.pry
      grid[y][inversed_x] = "X"
    }
    grid.map {|x| x.join('')}.join("\n")
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
