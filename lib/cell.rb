class Cell
  attr_reader :point, :x, :y
  def initialize(point)
    @x = point.first
    @y = point.last
    @point = point
  end

  def is_active?(cells)
    #   all neighbors of self
    #   if cells.select neighbors .count < 2 return false
    cells.select { |c| neighbors.include?(c.point) }.count >= 2
  end

  private

  def neighbors
    [[x - 1, y - 1],
     [x, y - 1],
     [x - 1, y],
     [x + 1, y + 1],
     [x, y + 1],
     [x + 1, y - 1],
     [x + 1, y],
     [x - 1, y + 1]
    ]
  end
end