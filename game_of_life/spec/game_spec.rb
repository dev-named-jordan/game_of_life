require_relative '../lib/world.rb'
require_relative '../lib/cell.rb'
require_relative '../lib/game.rb'
require 'rspec'

RSpec.describe 'Game' do
  context 'Game' do
    # world = World.new
    game = Game.new
    world = World.new
    
    it 'should_create_a_new_game_object' do
      expect(game).to be_a(Game)
    end
    it 'should respond to proper methods' do 
      expect(game).to respond_to(:world)
      # expect(game).to respond_to(:seeds)
    end 
    it 'Should initialize properly' do
      expect(game.world).to be_a(World)
      expect(game.seeds).to be_an(Array)

      # expect(cell.alive).to be(false)
      # expect(cell.x) == 0
      # expect(cell.y) == 0
    end
    it 'Should plant seeds properly' do
      game = Game.new(world, [[1,2],[0,2]])
      expect(world.cell_board[1][2]).to be_alive 
      expect(world.cell_board[0][2]).to be_alive
    end
  end
end