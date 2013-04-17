class Game
  attr_accessor :board, :board_printer

  def initialize
    self.board = DataCellCollection.new
    self.board_printer = BoardPrinter.new
  end

  def play
    print_board
  end

  def print_board # ask about naming convention for private methods.  should we use an underscore?
    board_printer.print_board(board)
  end
end
