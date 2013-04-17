require_relative '../cell_collection'
require_relative '../cell'
require_relative '../location'

describe CellCollection do

  let (:cell_collection) { CellCollection.new(1,1) }

  describe '#add' do
    location1 = Location.new(1,1)
    cell = Cell.new({location: location1, value: 'X'})
    it "should add a cell to the collection" do
      cell_collection.add(cell)
      cell_collection.cells.include?(cell).should == true
    end
  end

  describe '#get' do
    location = Location.new(1,1)
    cell = Cell.new({location: location, value: 'X'})
    it "should retrieve the cell's with the specified location" do
      cell_collection.add(cell)
      cell_collection.get(1,1).should == cell
    end
  end

  describe '#size' do
    location1 = Location.new(1,1)
    location2 = Location.new(0,0)
    cell1 = Cell.new({location: location1, value: 'X'})
    cell2 = Cell.new({location: location2, value: 'O'})
    it "should return the amount of items in the collection" do
      cell_collection.add(cell1)
      cell_collection.add(cell2)
      cell_collection.size.should == 2
    end
  end

  describe '#==' do
    location1 = Location.new(1,1)
    location2 = Location.new(0,0)
    cell1 = Cell.new({location: location1, value: 'X'})
    cell2 = Cell.new({location: location2, value: 'O'})
    location3 = Location.new(1,1)
    location4 = Location.new(0,0)
    cell3 = Cell.new({location: location3, value: 'X'})
    cell4 = Cell.new({location: location4, value: 'O'})
    it "should return true when compared to a collection with the same cells (same value and location)" do
      cell_collection1 = CellCollection.new(2,2)
      cell_collection1.add(cell1)
      cell_collection1.add(cell2)
      cell_collection2 = CellCollection.new(2,2)
      cell_collection2.add(cell3)
      cell_collection2.add(cell4)
      cell_collection1.should == cell_collection2
    end
  end

end
