require_relative '../location'

describe Location do
 
  let(:location) { Location.new(1,1) }

  subject {location}

  it {should respond_to(:x) }

  it {should respond_to(:y) }

  describe "#==" do
    it "should return true when two locations are equal" do
      location1 = Location.new(1,1)
      location2 = Location.new(1,1)
      location1.should == location2
    end
  end

  describe "#+" do
    it "should add two location objects and return a location object" do
      location1 = Location.new(1,1)
      location2 = Location.new(0,2)
      location3 = Location.new(1,3)
      (location1 + location2).should == location3
    end
  end

end
