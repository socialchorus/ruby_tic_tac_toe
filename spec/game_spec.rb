require_relative '../game'

describe Game do
  let(:game) { Game.new }
  subject { game }

  it { should respond_to(:board) }
  it { should respond_to(:board_printer) }

  describe '#play' do
    let (:game) { Game.new }
  end
end
