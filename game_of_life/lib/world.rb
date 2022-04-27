class World
  attr_accessor :rows, :cols, :cell_board, :cells
  
  def initialize(rows = 3, cols = 3)
    @rows = rows
    @cols = cols  
    @cells = []

    @cell_board = Array.new(rows) do |row|
      Array.new(cols) do |col|
        Cell.new(col, row)
      end
    end

    cell_board.each do |row|
      row.each do |element|
        if element.is_a?(Cell)
          cells << element
        end
      end
    end

  end

  def live_neighbors_around_cell(cell)
    live_neighbors = []
    # it detects neighbors to the North 
    if cell.y > 0
      candidate = self.cell_board[cell.y - 1][cell.x]
      live_neighbors << candidate if candidate.alive?
    end 
    # it detects neighbors to the NorthEast
    if cell.y > 0 && cell.x < (cols - 1)
      candidate = self.cell_board[cell.y - 1][cell.x + 1]
      live_neighbors << candidate if candidate.alive?
    end 
    # it detects neighbors to the East 
    if cell.x < (cols - 1)
      candidate = self.cell_board[cell.y][cell.x + 1]
      live_neighbors << candidate if candidate.alive?
    end 
    # it detects neighbors to the SouthEast 
    if cell.y < (rows - 1) && cell.x < (cols - 1)
      candidate = self.cell_board[cell.y + 1][cell.x + 1]
      live_neighbors << candidate if candidate.alive?
    end 
    # it detects neighbors to the South
    if cell.y < (rows - 1)
      candidate = self.cell_board[cell.y + 1][cell.x]
      live_neighbors << candidate if candidate.alive?
    end 
    # it detects neighbors to the SouthWest
    if cell.y < (rows - 1) && cell.x > 0
      candidate = self.cell_board[cell.y + 1][cell.x - 1]
      live_neighbors << candidate if candidate.alive?
    end 
    # it detects neighbors to the West
    if cell.x > 0
      candidate = self.cell_board[cell.y][cell.x - 1]
      live_neighbors << candidate if candidate.alive?
    end 
    # it detects neighbors to the NorthWest
    if cell.y > 0 && cell.x > 0      
      candidate = self.cell_board[cell.y - 1][cell.x - 1]
      live_neighbors << candidate if candidate.alive?
    end 
    live_neighbors
  end

  def live_cells
    cells.select do |cell| 
      cell.alive
    end
  end

  def dead_cells
    cells.select do |cell| 
      cell.alive == false
    end
  end

  def randomly_populate
    cells.each do |cell|
      cell.alive = [true, false].sample
    end  
  end
end