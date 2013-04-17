class PixelCell < Cell
  def post_initialize
    self.value = value || ' '
  end
end
