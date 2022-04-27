class Game
  attr_accessor :world, :seeds
#seeds was breaking at one point, but works now?
  def initialize(world=World.new, seeds=[])
    @world = world
    @seeds = seeds

    seeds.each do |seed|
      world.cell_board[seed[0]][seed[1]].alive = true
    end
  end 

  # def color_change
    # @alive_color = @random_color
    # @alive_color = @random_color_new
  # end

  def tick!
    next_round_live_cells = []
    next_round_dead_cells = []

    @world.cells.each do |cell|
    # require "pry"; binding.pry
      neighbor_count = self.world.live_neighbors_around_cell(cell).count
      # Rule 1
      if cell.alive? && neighbor_count < 2
        next_round_dead_cells << cell
      end
      # Rule 2
      if cell.alive? && ([2, 3].include? neighbor_count)
        next_round_live_cells << cell
      end
      # Rule 3
      if cell.alive? && neighbor_count > 3
        next_round_dead_cells << cell
      end
      # Rule 4
      if cell.dead? && neighbor_count == 3
        next_round_live_cells << cell
      end
    end

    next_round_live_cells.each do |cell|
      cell.live!
    end
    next_round_dead_cells.each do |cell|
      cell.die!
    end
  end 
end