class CellPresenter
  attr_accessor :data_cell, :pixel_collection, :location, :current_line, :height

  def initialize(data_cell)
    self.current_line = 0
    self.data_cell = data_cell
    self.pixel_collection = PixelCellCollection.new
    self.location = data_cell.location
    self.height = (first_row_cell? && 3) || 2
    create_pixel_collection
  end

  def next_line # to refactor later
    if (current_line == height)
      return false
    else
      line_pixels = PixelCellCollection.new
      pixel_counter = 0
      current_pixel = pixel_collection.get(pixel_counter, current_line)
      while (current_pixel)
        line_pixels.add(pixel_collection.get(pixel_counter, current_line))
        pixel_counter = pixel_counter + 1
        current_pixel = pixel_collection.get(pixel_counter, current_line)
      end
      self.current_line = current_line + 1
      line_pixels
    end
  end

  def create_pixel_collection
    pixel1 = PixelCell.new({ value: '-', location: Location.new(0,0) })
    pixel2 = PixelCell.new({ value: '-', location: Location.new(1,0) })
    pixel3 = PixelCell.new({ value: '|', location: Location.new(0,1) })
    pixel4 = PixelCell.new({ value: data_cell.value, location: Location.new(1,1) })
    pixel_collection.add(pixel1)
    pixel_collection.add(pixel2)
    pixel_collection.add(pixel3)
    pixel_collection.add(pixel4)
    add_extra_pixels_for_border
    pixel_collection
  end

  def add_extra_pixels_for_border
    if first_row_cell?
      pixel5 = PixelCell.new({ value: '-', location: Location.new(0,2) })
      pixel6 = PixelCell.new({ value: '-', location: Location.new(1,2) })
      pixel_collection.add(pixel5)
      pixel_collection.add(pixel6)
    end

    if last_column_cell?
      pixel7 = PixelCell.new({ value: '|', location: Location.new(2,0) })
      pixel8 = PixelCell.new({ value: '|', location: Location.new(2,1) })
      pixel_collection.add(pixel7)
      pixel_collection.add(pixel8)
    end

    if lower_right_cell?
      pixel9 = PixelCell.new({ value: '-', location: Location.new(2,2) })
      pixel_collection.add(pixel9)
    end
  end

  def last_column_cell?
    (data_cell.location.x == 2)
  end

  def first_row_cell?
    (data_cell.location.y == 2)
  end

  def lower_right_cell?
    (data_cell.location.x == 2) && (data_cell.location.y == 2)
  end

  def reset
    self.current_line = 0
  end

  def ==(other_obj)
    (data_cell == other_obj.data_cell) && (pixel_collection == other_obj.pixel_collection)
  end

end
