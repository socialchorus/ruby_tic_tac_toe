class Cell
  attr_accessor :value, :location

  def initialize(args)
    self.value = args.fetch(:value,nil)
    self.location = args.fetch(:location,nil)
    post_initialize
  end

  def post_initialize

  end

  def empty?
    !value
  end

  def ==(other_obj)
    ((location == other_obj.location) && (value == other_obj.value))
  end
end
