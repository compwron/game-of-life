class Cell
  attr_reader :my_position, :all_populated_cell_positions

  def initialize(my_position, all_populated_cell_positions)
    @my_position = my_position
    @all_populated_cell_positions = all_populated_cell_positions
  end

  def n_neighbors_alive
    all_populated_cell_positions.count do |position|
      other_cell = Cell.new(position, [])
      is_neighboring_cell?(other_cell)
    end
  end

  def is_neighboring_cell?(cell)
    is_vertical_neighbor?(cell) || is_horizontal_neighbor?(cell) || is_diagonal_neighbor?(cell)
  end

  def is_vertical_neighbor?(cell)
    my_position[0] == cell.my_position[0] &&
      (my_position[1] - cell.my_position[1]).abs == 1
  end

  def is_horizontal_neighbor?(cell)
    my_position[1] == cell.my_position[1] &&
      (my_position[0] - cell.my_position[0]).abs == 1
  end

  def is_diagonal_neighbor?(cell)
    (my_position[0] - cell.my_position[0]).abs == 1 &&
      (my_position[1] - cell.my_position[1]).abs == 1
  end
end
