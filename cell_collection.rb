class CellCollection
  attr_accessor :cells, :rows, :columns

  def initialize(rows=0, columns=0)
    self.cells = []
    self.rows = rows
    self.columns = columns
    post_initialize
  end

  def post_initialize
  end

  def add(cell)
    retrieved_cell = get(cell.location.x, cell.location.y)
    if !retrieved_cell
      cells << cell
    else
      retrieved_cell.value = cell.value
    end
  end

  def get(x,y)
    0.upto(cells.length - 1) do |i|
      if ((cells[i].location.x == x) && (cells[i].location.y == y))
        return cells[i]
      end
    end
    return false
  end

  def size
    cells.length
  end

  def ==(other_obj)
    if (other_obj.size == size)
      0.upto(size - 1) do |i|
        current_cell = cells[i]
        return false if (current_cell != other_obj.get(current_cell.location.x,current_cell.location.y))
      end
      return true
    end
    return false
  end

end
