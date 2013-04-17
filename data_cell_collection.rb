class DataCellCollection < CellCollection

  def post_initialize
    0.upto(rows - 1) do |y|
      0.upto(columns - 1) do |x|
        cells << DataCell.new({ location: Location.new(x,y) } )
      end
    end
  end

end
