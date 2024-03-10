require './chandrayaan3'
require "./user_commands"

describe Chandrayaan3 do
  describe "#initialize" do
    it 'it initialize potision and direction' do
      position = [0,0,0]
      direction = 'N'
      chandrayaan3 = Chandrayaan3.new(position, direction)
      expect(chandrayaan3.position).to eq([0,0,0])
      expect(chandrayaan3.direction).to eq('N')
    end

    describe "#get_commands" do
      it 'takes the commands from user' do
        chandrayaan3 = Chandrayaan3.new([0, 0, 0], 'N')

        allow(UserCommands).to receive(:commands).and_return(['f', 'b', 'l'])
        allow(UserCommands).to receive(:exicute_commands).with(['f', 'b', 'l'], chandrayaan3)

        chandrayaan3.get_commands
      end
    end

  end
end
