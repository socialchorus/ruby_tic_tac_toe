class BoardPrinter
  attr_accessor :pixel_collection, :presenters, :data_collection, :printer_head, :width, :height

  def initialize
    self.pixel_collection = PixelCellCollection.new(8,8)
    self.data_collection = DataCellCollection.new(3,3)
    self.presenters = []
    self.printer_head = Location.new(0,0)
    self.height = 3
    self.width = 3

    create_initial_presenters(data_collection)
  end

  def print_board(input_data_collection=data_collection)
    self.data_collection = input_data_collection
    datacells_to_presenters
    reset_presenters
    presenters_to_pixel_collection
    print_pixel_collection
  end

  # private methods

  def datacells_to_presenters
    data_collection.cells.each do |data_cell|
      presenters[3*data_cell.location.y + data_cell.location.x] = CellPresenter.new(data_cell)
    end
  end

  def reset_presenters
    0.upto(presenters.length - 1) do |i|
      presenters[i].reset
    end
  end

  def presenters_to_pixel_collection
    reset_head
    0.upto(height - 1) do |i|
      presenter_row_to_pixels(presenters[i * width, width])
    end
  end

  def print_pixel_collection # to change
    0.upto(6) do |y|
      0.upto(6) do |x|
        STDOUT.print pixel_collection.get(x,y).value
      end
      puts
    end
  end

  def create_initial_presenters(data_collection)
    data_collection.cells.each do |data_cell|
      presenters << CellPresenter.new(data_cell)
    end
  end

  def presenter_row_to_pixels(presenter_row)
    (presenter_row[0].height).times do
      0.upto(presenter_row.length - 1) do |i|
        add_presenter_line(presenter_row[i])
      end
      carriage_return
    end
  end

  def add_presenter_line(presenter_to_process)
    pixel_line = presenter_to_process.next_line
    if (pixel_line)
      0.upto(pixel_line.size - 1) do |i|
        pixel_value = pixel_line.cells[i].value
        pixel_location = Location.new(printer_head.x, printer_head.y)
        pixel_collection.add(PixelCell.new({ value: pixel_value, location: pixel_location }))
        printer_head.x += 1
      end
    end
  end

  def carriage_return
    printer_head.x = 0
    printer_head.y += 1
  end

  def reset_head
    printer_head.x = 0
    printer_head.y = 0
  end
end
