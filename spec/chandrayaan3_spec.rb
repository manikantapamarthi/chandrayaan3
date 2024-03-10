require './chandrayaan3'

describe Chandrayaan3 do
  describe "#initialize" do
    it 'it initialize potision and direction' do
      position = [0,0,0]
      direction = 'N'
      chandrayaan3 = Chandrayaan3.new(position, direction)
      expect(chandrayaan3.position).to eq([0,0,0])
      expect(chandrayaan3.direction).to eq('N')
    end
  end
end
