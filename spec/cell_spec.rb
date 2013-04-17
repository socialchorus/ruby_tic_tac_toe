require_relative '../location'
require_relative '../cell'

describe Cell do

  let(:cell) { Cell.new({}) }
  subject { cell }
  it {should respond_to(:value)}
  it {should respond_to(:location)}
  it {should respond_to(:empty?)}

  describe '#empty' do
    it "should return true when the cell is empty" do
      cell.empty?.should == true
    end

    it "should return false when the cell is not empty" do
      cell.value = 'X'
      cell.empty?.should == false
    end
  end

  describe "#==" do
    let(:location1) { Location.new(1,1) }
    let(:location2) { Location.new(1,1) }
    let(:cell1) { Cell.new({value: 'X', location: location1}) }
    let(:cell2) { Cell.new({value: 'X', location: location2}) }
    it "should return true when two cells have the same value and location" do
      cell1.should == cell2 
    end
  end

end
