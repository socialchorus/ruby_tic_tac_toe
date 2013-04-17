class Location
  attr_accessor :x, :y

  def initialize(x,y)
    self.x = x
    self.y = y
  end

  def ==(other_obj)
    ((self.x == other_obj.x) && (self.y == other_obj.y))
  end

  def +(other_obj)
    Location.new(self.x + other_obj.x, self.y + other_obj.y)
  end

end
