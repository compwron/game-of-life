require 'cell'
class Life

  def initialize(seed)
    @seed = seed
    @cells = seed.map { |s| Cell.new(s) }
  end

  def state
    @cells.map { |c| c.point }
  end

  def tick
    # previous = @seed
    @cells = active_cells(@cells)
  end

  def active_cells(cells)
    #   for each cell, pass in all cells, output cell deletion/creation, compact array
    cells.select { |c|
      c.is_active?(cells)
    }
  end
end
