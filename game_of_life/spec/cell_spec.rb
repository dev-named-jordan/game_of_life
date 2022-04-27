require_relative '../lib/world.rb'
require_relative '../lib/cell.rb'
require_relative '../lib/game.rb'
require 'rspec'

RSpec.describe 'Cell' do 
  context 'Cell' do
    cell = Cell.new 
    it 'Should create a new cell object' do
      expect(cell).to be_a(Cell)
    end
    it 'Respond to proper methods' do
      expect(cell).to respond_to(:alive)
      expect(cell).to respond_to(:x)
      expect(cell).to respond_to(:y)
      expect(cell).to respond_to(:alive?)
      expect(cell).to respond_to(:die!)
    end
  end
end