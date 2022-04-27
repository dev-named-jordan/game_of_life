require_relative '../lib/world.rb'
require_relative '../lib/cell.rb'
require_relative '../lib/game.rb'
# require_relative '../lib/rule.rb'
require 'rspec'

RSpec.describe 'Rules' do
  context 'Rule 1: Any live cell with fewer than 2 live neighbors dies, as if casued by under-population' do
    # rule = Rule.new

    # it 'Should_create_a_new_rules_object' do
    #   expect(rule).to be_a(Rule)
    # end

    it 'Should kill a cell with 0 live neighbors' do
      world_1 = World.new
      game_1 = Game.new(world_1, [[1,1]])
      expect(world_1.cell_board[1][1]).to be_alive
      game_1.tick!
      expect(world_1.cell_board[1][1]).to be_dead
    end

    it 'Should kill a cell with 1 live neighbor' do
      world_1 = World.new
      game_1 = Game.new(world_1, [[1,0],[2,0]])
      expect(world_1.cell_board[1][0]).to be_alive
      expect(world_1.cell_board[2][0]).to be_alive
      game_1.tick!
      expect(world_1.cell_board[1][0]).to be_dead
      expect(world_1.cell_board[2][0]).to be_dead
    end
  end

  context 'Rule 2: Any live cell with two or three live neighbors lives on to the next generation.' do 

    it 'Should let cell live until next generation - If already alive, and having 2, or 3 live neighbors' do
      world_2 = World.new
      game_2 = Game.new(world_2, [[0,0],[1,0],[0,1]])

      expect(world_2.cell_board[0][0]).to be_alive
      expect(world_2.cell_board[1][0]).to be_alive
      expect(world_2.cell_board[0][1]).to be_alive
      expect(world_2.cell_board[1][1]).to be_dead
      game_2.tick!
      expect(world_2.cell_board[0][0]).to be_alive
      expect(world_2.cell_board[1][0]).to be_alive
      expect(world_2.cell_board[0][1]).to be_alive
      expect(world_2.cell_board[1][1]).to be_alive
    end

    it 'Should let cell live until next generation part 2' do
      cell_box = []

      world_3 = World.new
      game_3 = Game.new(world_3, [[0,0],[1,0],[2,0]])

      expect(world_3.cell_board[0][0]).to be_alive
      expect(world_3.cell_board[1][0]).to be_alive
      expect(world_3.cell_board[2][0]).to be_alive

      world_3.live_neighbors_around_cell(world_3.cell_board[1][0]).each do |cell|
        cell_box << cell
      end

      expect(cell_box.count).to eq(2)
      # require "pry"; binding.pry
      game_3.tick!
      # require "pry"; binding.pry
      expect(world_3.cell_board[0][0]).to be_dead
      expect(world_3.cell_board[1][0]).to be_alive
      expect(world_3.cell_board[2][0]).to be_dead
      game_3.tick!
      expect(world_3.cell_board[0][0]).to be_dead
      expect(world_3.cell_board[1][0]).to be_dead
      expect(world_3.cell_board[2][0]).to be_dead
    end
  end
  context 'Rule 3: Any live cell with more than three live neighbors dies, as if by overpopulation.' do 

    it 'Should kill cell if it is alive, and has more than 3 neighbors' do

      world_4 = World.new
      game_4 = Game.new(world_4, [[0,0],[1,0],[2,0],[0,1],[1,1]])

      expect(world_4.cell_board[0][0]).to be_alive
      expect(world_4.cell_board[1][0]).to be_alive
      expect(world_4.cell_board[2][0]).to be_alive
      expect(world_4.cell_board[0][1]).to be_alive
      expect(world_4.cell_board[1][1]).to be_alive

      cell_box_1 = []
      cell_box_2 = []
      cell_box_3 = []
      cell_box_4 = []
      cell_box_5 = []

      world_4.live_neighbors_around_cell(world_4.cell_board[0][0]).each do |cell|
        cell_box_1 << cell
      end

      world_4.live_neighbors_around_cell(world_4.cell_board[1][0]).each do |cell|
        cell_box_2 << cell
      end
      
      world_4.live_neighbors_around_cell(world_4.cell_board[2][0]).each do |cell|
        cell_box_3 << cell
      end
      
      world_4.live_neighbors_around_cell(world_4.cell_board[0][1]).each do |cell|
        cell_box_4 << cell
      end
      
      world_4.live_neighbors_around_cell(world_4.cell_board[1][1]).each do |cell|
        cell_box_5 << cell
      end
      
      expect(cell_box_1.count).to eq(3)
      expect(cell_box_2.count).to eq(4)
      expect(cell_box_3.count).to eq(2)
      expect(cell_box_4.count).to eq(3)
      expect(cell_box_5.count).to eq(4)

      game_4.tick!

      expect(world_4.cell_board[0][0]).to be_alive
      expect(world_4.cell_board[1][0]).to be_dead
      expect(world_4.cell_board[2][0]).to be_alive
      expect(world_4.cell_board[0][1]).to be_alive
      expect(world_4.cell_board[1][1]).to be_dead
    end
  end
  context 'Rule 4: Any dead cell with exactly three live neighbors becomes a live cell, as if by reproduction.' do 

    it 'Should make cell live, if cell is dead and has eaxctly 3 neighbors' do
      world_5 = World.new
      game_5 = Game.new(world_5, [[1,0],[0,1],[1,1]])

      expect(world_5.cell_board[0][0]).to be_dead
      expect(world_5.cell_board[1][0]).to be_alive
      expect(world_5.cell_board[0][1]).to be_alive
      expect(world_5.cell_board[1][1]).to be_alive
      game_5.tick!
      expect(world_5.cell_board[0][0]).to be_alive
      expect(world_5.cell_board[1][0]).to be_alive
      expect(world_5.cell_board[0][1]).to be_alive
      expect(world_5.cell_board[1][1]).to be_alive
    end
  end
end