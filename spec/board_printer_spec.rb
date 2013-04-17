require_relative '../board_printer'
require_relative '../cell'
require_relative '../cell_presenter'
require_relative '../cell_collection'
require_relative '../pixel_cell_collection'
require_relative '../data_cell'
require_relative '../pixel_cell'
require_relative '../location'

describe BoardPrinter do
  let(:board_printer) { BoardPrinter.new }
  subject { board_printer }

  it { should respond_to(:pixel_collection) }
  it { should respond_to(:presenters) }

  describe "#create_empty_presenters" do
    it "should create empty data cells" do
      counter = 0
      0.upto(15) do |i|
        if (board_printer.presenters[i].data_cell.value == ' ')
          counter = counter + 1
        end
      end
      counter.should == 16
    end
  end

  describe "#add_data_cell_as_presenter" do
    let(:data_cell1) { DataCell.new( { value: 'X', location: Location.new(0,0) } ) }
    it "should create a cell_presenter for the provided data_cell" do
      board_printer.add_data_cell_as_presenter(data_cell1)
      board_printer.presenters[0].should == CellPresenter.new(data_cell1)
    end
  end

  describe "#add_pixel" do 
    let(:pixel) { PixelCell.new( { value: '-', location: Location.new(0,1) } ) }
    it "should add a pixel to pixel_collection" do
      board_printer.add_pixel(pixel)
      board_printer.pixel_collection.get(0,1).should == pixel
    end
  end

  describe "#calculate_base_location" do
    let(:data_location) { Location.new(1,2) }
    let(:right_pixel_location) { Location.new(2,4) }
    it "should take the location of a data cell and return its location on the pixel board" do
      board_printer.calculate_base_location(data_location).should == right_pixel_location
    end
  end

  describe "#add_presenter_as_pixels" do
    let(:data_cell) { DataCell.new({ value: 'X', location: Location.new(1,1) } ) }
    let(:presenter) { CellPresenter.new(data_cell) }
    let(:base_location) { Location.new(2,2) }

    it "should take a pixel collection and location to return a location in the board's pixel collection" do
      board_printer.add_presenter_as_pixels(presenter,base_location)
      board_printer.pixel_collection.get(2,2).value.should == '|'
    end
  end

  describe "#compile_presenters" do
    it "should call add_presenter_as_pixels 16 times" do
      board_printer.stub(:calculate_base_location)
      board_printer.stub(:add_presenter_as_pixels)
      board_printer.should_receive(:add_presenter_as_pixels).exactly(16).times
      board_printer.compile_presenters
    end

    it "should call calculate_base_location 16 times" do
      board_printer.stub(:calculate_base_location)
      board_printer.stub(:add_presenter_as_pixels)
      board_printer.should_receive(:calculate_base_location).exactly(16).times
      board_printer.compile_presenters
    end
  end

  describe "#print_pixels" do
    let(:d1) { DataCell.new({ value: 'X', location: Location.new(0,0) }) }
    let(:d2) { DataCell.new({ value: 'X', location: Location.new(1,1) }) }
    let(:d3) { DataCell.new({ value: 'X', location: Location.new(2,2) }) }

    it "should print to STDOUT 64 times" do
      STDOUT.should_receive(:print).exactly(64).times
      board_printer.print_board
    end
  end
end
