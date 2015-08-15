require 'spec_helper'
require_relative '../lib/life'

describe Life do
  let(:seed) { [[0, 0], [1, 1], [0, 1]] }
  let(:life) { described_class.new(seed) }
  let(:seed_evolution1) { [[0, 1]] }

  it 'has a state' do
    expect(life.state).to eq(seed)
  end

  it 'changes state on tick' do
    life.tick
    expect(life.state).to eq seed_evolution1
  end
end
