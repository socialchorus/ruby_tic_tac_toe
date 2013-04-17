class PixelCellCollection < CellCollection

  def post_initialize
    0.upto(rows - 1) do |x|
      0.upto(columns - 1) do |y|
        cells << PixelCell.new({ location: Location.new(x,y) } )
      end
    end
  end

end
