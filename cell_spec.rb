require 'spec_helper'
require_relative 'cell'

describe Cell do
  let(:my_position) { [0,0]}
  it 'knows how many of its neighbors are alive' do
    all_populated_cell_positions = [[0,0], [0,1]]
    cell = Cell.new(my_position, all_populated_cell_positions)
    expect(cell.n_neighbors_alive).to eq 1
  end

  it 'knows that non-neighbor live cell does not count as a neighbor' do
    all_populated_cell_positions = [[0,0], [3,3]]
    cell = Cell.new(my_position, all_populated_cell_positions)
    expect(cell.n_neighbors_alive).to eq 0
  end

  it 'knows that only one populated cell is a neighbor' do
    all_populated_cell_positions = [[4,4], [1,1]]
    cell = Cell.new(my_position, all_populated_cell_positions)
    expect(cell.n_neighbors_alive).to eq 1
  end

  describe '#is_neighboring_cell?' do
    let(:cell) {Cell.new([0,0], [])}
    it 'returns false if other cell is not a neighbor' do
      other_cell = Cell.new([4,0], [])
      other_cell2 = Cell.new([1, 2], [])

      expect(cell.is_neighboring_cell?(other_cell)).to eq false
      expect(cell.is_neighboring_cell?(other_cell2)).to eq false
    end

    it 'returns true if other cell is a neighbor' do
      other_cell = Cell.new([1,0], [])
      other_cell2 = Cell.new([0,1], [])

      expect(cell.is_neighboring_cell?(other_cell)).to eq true
      expect(cell.is_neighboring_cell?(other_cell2)).to eq true
    end

    it 'recognizes diagonal neighbors' do
      other_cell = Cell.new([1,1], [])
      other_cell2 = Cell.new([1,-1], [])

      expect(cell.is_neighboring_cell?(other_cell)).to eq true
      expect(cell.is_neighboring_cell?(other_cell2)).to eq true
    end
  end
end
