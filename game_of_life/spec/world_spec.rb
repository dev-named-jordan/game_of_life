require_relative '../lib/world.rb'
require_relative '../lib/cell.rb'
require_relative '../lib/game.rb'
require 'rspec'

RSpec.describe 'World' do 
  context 'World' do
    world = World.new
    # rule = Rule.new
    game = Game.new
    cell = Cell.new(1,1)
      
    it 'should create a new world object' do
      expect(world).to be_a(World)
    end
    it 'Should repsond to proper methods' do
      expect(world).to respond_to(:rows)
      expect(world).to respond_to(:cols)
      expect(world).to respond_to(:cell_board)
      expect(world).to respond_to(:live_neighbors_around_cell)
      expect(world).to respond_to(:cells)
      expect(world).to respond_to(:randomly_populate)
      expect(world).to respond_to(:live_cells)
    end
    it 'Should create a proper cell grid upon initialization' do
      expect(world.cell_board).to be_an(Array)
      world.cell_board.each do |row|
        expect(row).to be_an(Array)
        row.each do |col|
          expect(col).to be_a(Cell)
        end
      end
    end 
    it 'Should detect a live neighbor to the North' do
      expect(world.cols) == 3
      expect(world.rows) == 3
      # require "pry"; binding.pry
      expect(world.cell_board[1][0].dead?).to be true
      expect(world.cell_board[1][0].alive?).to be false
      world.cell_board[1][0].alive = true
      expect(world.cell_board[1][0].dead?).to be false
      expect(world.cell_board[1][0].alive?).to be true
      expect(world.live_neighbors_around_cell(world.cell_board[1][0])) == 1
      expect(world.cell_board[cell.x][cell.y - 1].alive?).to be true
    end 
    it 'Should detect a neighbor NorthEast' do
      world.cell_board[2][0].alive = true
      expect(world.cell_board[2][0].alive?).to be true
      expect(world.cell_board[cell.x + 1][cell.y - 1].alive?).to be true
      expect(world.live_neighbors_around_cell(world.cell_board[1][1])) == 1
    end 
    it 'Should detect a neighbor East' do
      world.cell_board[2][1].alive = true
      expect(world.cell_board[2][1].alive?).to be true
      expect(world.cell_board[cell.x + 1][cell.y].alive?).to be true
      expect(world.live_neighbors_around_cell(world.cell_board[1][1])) == 1
    end 
    it 'Should detect a neighbor SouthEast' do
      world.cell_board[2][2].alive = true
      expect(world.cell_board[2][2].alive?).to be true
      expect(world.cell_board[cell.x + 1][cell.y + 1].alive?).to be true
      expect(world.live_neighbors_around_cell(world.cell_board[1][1])) == 1
    end 
    it 'Should detect a neighbor South' do
      world.cell_board[1][2].alive = true
      expect(world.cell_board[1][2].alive?).to be true
      # require "pry"; binding.pry
      expect(world.cell_board[cell.x][cell.y + 1].alive?).to be true
      expect(world.live_neighbors_around_cell(world.cell_board[1][1])) == 1
    end 
    it 'Should detect a neighbor SouthWest' do
      world.cell_board[0][2].alive = true
      expect(world.cell_board[0][2].alive?).to be true
      # require "pry"; binding.pry
      expect(world.cell_board[cell.x - 1][cell.y + 1].alive?).to be true
      expect(world.live_neighbors_around_cell(world.cell_board[1][1])) == 1
    end 
    it 'Should detect a neighbor West' do
      world.cell_board[0][1].alive = true
      expect(world.cell_board[0][1].alive?).to be true
      # require "pry"; binding.pry
      expect(world.cell_board[cell.x - 1][cell.y].alive?).to be true
      expect(world.live_neighbors_around_cell(world.cell_board[1][1])) == 1
    end 
    it 'Should detect a neighbor NorthWest' do
      world.cell_board[0][0].alive = true
      expect(world.cell_board[0][0].alive?).to be true
      # require "pry"; binding.pry
      expect(world.cell_board[cell.x - 1][cell.y - 1].alive?).to be true
      expect(world.live_neighbors_around_cell(world.cell_board[1][1])) == 1
    end 
    it 'Should detect fully surrounded' do
      cell_box = []

      world.cell_board[0][0].alive = true
      world.cell_board[0][1].alive = true
      world.cell_board[0][2].alive = true
      world.cell_board[1][0].alive = true

      world.cell_board[1][2].alive = true
      world.cell_board[2][0].alive = true
      world.cell_board[2][1].alive = true
      world.cell_board[2][2].alive = true

      expect(world.live_neighbors_around_cell(world.cell_board[1][1])).to be_an(Array)
     
      world.live_neighbors_around_cell(world.cell_board[1][1]).each do |cell|
        cell_box << cell
      end
     
      expect(cell_box.count).to eq(8)
    end 
    it 'Should add all cells to cells array' do
      world.cells.count == 9
    end
    it 'Should randomly populate the world' do
      world.cell_board[0][0].alive = false
      world.cell_board[0][1].alive = false
      world.cell_board[0][2].alive = false
      world.cell_board[1][0].alive = false
      world.cell_board[1][1].alive = false
      world.cell_board[1][2].alive = false
      world.cell_board[2][0].alive = false
      world.cell_board[2][1].alive = false
      world.cell_board[2][2].alive = false

      expect(world.live_cells.count).to eq(0)
      world.randomly_populate
      expect(world.live_cells.count).to_not eq(0)
    end 
  end
end
