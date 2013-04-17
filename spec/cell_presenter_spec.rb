require_relative '../cell_presenter'
require_relative '../location'
require_relative '../cell'
require_relative '../data_cell'
require_relative '../pixel_cell'
require_relative '../cell_collection'
require_relative '../pixel_cell_collection'

describe CellPresenter do
  let(:data_cell1) { DataCell.new( { value: 'X', location: Location.new(0,0) } ) }
  let(:cell_presenter) { CellPresenter.new(data_cell1) }
  subject { cell_presenter }

  it { should respond_to(:data_cell) }
  it { should respond_to(:pixel_collection) }
  it { should respond_to(:location) }

  describe '#create_pixel_collection' do
    it "should convert a normal data cell to an appropriate set of pixel cells based on its location" do
      cell_presenter.data_cell = DataCell.new( { value: 'X', location: Location.new(0,1) } )
      pixel1 = PixelCell.new({ value: '-', location: Location.new(0,0) })
      pixel2 = PixelCell.new({ value: '-', location: Location.new(1,0) })
      pixel3 = PixelCell.new({ value: '|', location: Location.new(0,1) })
      pixel4 = PixelCell.new({ value: 'X', location: Location.new(1,1) })
      pixel_collection = PixelCellCollection.new
      pixel_collection.add(pixel1)
      pixel_collection.add(pixel2)
      pixel_collection.add(pixel3)
      pixel_collection.add(pixel4)
      cell_presenter.create_pixel_collection.should == pixel_collection
    end

    it "should convert a first-row data cell to appropriate pixels" do
      cell_presenter.data_cell = DataCell.new( { value: 'X', location: Location.new(0,2) } )
      pixel1 = PixelCell.new({ value: '-', location: Location.new(0,0) })
      pixel2 = PixelCell.new({ value: '-', location: Location.new(1,0) })
      pixel3 = PixelCell.new({ value: '|', location: Location.new(0,1) })
      pixel4 = PixelCell.new({ value: 'X', location: Location.new(1,1) })
      pixel5 = PixelCell.new({ value: '-', location: Location.new(0,2) })
      pixel6 = PixelCell.new({ value: '-', location: Location.new(1,2) })
      pixel_collection = PixelCellCollection.new
      pixel_collection.add(pixel1)
      pixel_collection.add(pixel2)
      pixel_collection.add(pixel3)
      pixel_collection.add(pixel4)
      pixel_collection.add(pixel5)
      pixel_collection.add(pixel6)
      cell_presenter.create_pixel_collection.should == pixel_collection
    end

    it "should convert a last-column data cell to the appropriate pixels" do
      cell_presenter.data_cell = DataCell.new( { value: 'X', location: Location.new(2,1) } )
      pixel1 = PixelCell.new({ value: '-', location: Location.new(0,0) })
      pixel2 = PixelCell.new({ value: '-', location: Location.new(1,0) })
      pixel3 = PixelCell.new({ value: '|', location: Location.new(0,1) })
      pixel4 = PixelCell.new({ value: 'X', location: Location.new(1,1) })
      pixel5 = PixelCell.new({ value: '|', location: Location.new(2,0) })
      pixel6 = PixelCell.new({ value: '|', location: Location.new(2,1) })
      pixel_collection = PixelCellCollection.new
      pixel_collection.add(pixel1)
      pixel_collection.add(pixel2)
      pixel_collection.add(pixel3)
      pixel_collection.add(pixel4)
      pixel_collection.add(pixel5)
      pixel_collection.add(pixel6)
      cell_presenter.create_pixel_collection.should == pixel_collection
    end

    it "should convert a lower-right data cell to the appropriate pixels" do
      cell_presenter.data_cell = DataCell.new( { value: 'X', location: Location.new(2,2) } )
      pixel1 = PixelCell.new({ value: '-', location: Location.new(0,0) })
      pixel2 = PixelCell.new({ value: '-', location: Location.new(1,0) })
      pixel3 = PixelCell.new({ value: '|', location: Location.new(0,1) })
      pixel4 = PixelCell.new({ value: 'X', location: Location.new(1,1) })
      pixel5 = PixelCell.new({ value: '|', location: Location.new(2,0) })
      pixel6 = PixelCell.new({ value: '|', location: Location.new(2,1) })
      pixel7 = PixelCell.new({ value: '-', location: Location.new(0,2) })
      pixel8 = PixelCell.new({ value: '-', location: Location.new(1,2) })
      pixel9 = PixelCell.new({ value: '-', location: Location.new(2,2) })
      pixel_collection = PixelCellCollection.new
      pixel_collection.add(pixel1)
      pixel_collection.add(pixel2)
      pixel_collection.add(pixel3)
      pixel_collection.add(pixel4)
      pixel_collection.add(pixel5)
      pixel_collection.add(pixel6)
      pixel_collection.add(pixel7)
      pixel_collection.add(pixel8)
      pixel_collection.add(pixel9)
      cell_presenter.create_pixel_collection.should == pixel_collection
    end

  end

  describe '#==' do
    data_cell1 = DataCell.new({ value: 'X', location: Location.new(0,0) })
    data_cell2 = DataCell.new({ value: 'X', location: Location.new(0,0) })
    cell_presenter1 = CellPresenter.new(data_cell1)
    cell_presenter2 = CellPresenter.new(data_cell2)
    it "should return true if the other object is another CellPresenter an == data_cell and an == pixel_collection" do
      cell_presenter1.should == cell_presenter2
    end
  end

end
