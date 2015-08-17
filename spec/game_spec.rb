require 'spec_helper'
require_relative '../lib/life'

describe Life do
  let(:life) { Life.new(seed) }
  context "cell with two neighbors" do
    let(:seed) { [[0, 0], [1, 1], [2, 2]] }
    let(:second_gen) { [[1, 1]] }

    it 'uses cells as seed' do
      expect(life.live_cells).to eq seed
    end

    it 'lets live cell with fewer than two neighbors die' do
      life.live_generation
      expect(life.live_cells).to eq second_gen
    end
  end

  context "cell with three neighbors" do
    let(:seed) { [[0, 0], [1, 1], [0, 1]] }
    let(:second_gen) { [[0, 0], [1, 1], [0, 1], newly_alive_cell] }
    let(:newly_alive_cell) { [1,0]}

    it 'lets cell with three neighbors live' do
      life.live_generation
      expect(life.live_cells).to eq second_gen
    end
  end

  context "cell with four neighbors" do
    let(:seed) { [[0, 0], [1, 1], [0, 1], [1, 0], [-1, -1]] }
    let(:newly_alive_cells) { [[0, -1], [-1, 0]] }
    let(:second_gen) { [[1, 1], [0, 1], [1, 0], *newly_alive_cells] }

    it 'lets cell with three neighbors live' do
      life.live_generation
      expect(life.live_cells).to eq second_gen
    end
  end

  context "dead cell with three neighbors" do
    let(:seed) { [[0, 0], [1, 1], [0, 1]] }
    let(:second_gen) { [[0, 0], [1, 1], [0, 1], [1, 0]] }

    it 'becomes live cell when three neighbors are live' do
      life.live_generation
      expect(life.live_cells).to eq second_gen
    end
  end

  describe '#pretty' do
    let(:seed) {[]}
    it 'prints tiniest' do
      expect(life.pretty([[0,0]])).to eq "X"
    end

    it 'prints x-only grid' do
      expect(life.pretty([[0,0], [1,0]])).to eq "XX\n"
    end

    it 'prints y-only grid' do
      expect(life.pretty([[0,0], [0,1]])).to eq "X\nX"
    end

    it 'prints grid with gap' do
      # OOX
      # OOO
      # XOO
      expect(life.pretty([[-1,-1], [1,1]])).to eq "OOX\nOOO\nXOO"
    end
  end
end
