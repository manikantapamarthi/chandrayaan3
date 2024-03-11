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

    describe "#move_forward" do
      it "moves forward in the Nort direction" do
        chandrayaan3 = Chandrayaan3.new([0,0,0], 'N')
        chandrayaan3.move_forward
        expect(chandrayaan3.position).to eq([0, 1, 0])
        expect(chandrayaan3.direction).to eq('N')
      end

      it "moves forward in the East direction" do
        chandrayaan3 = Chandrayaan3.new([0,0,0], 'E')
        chandrayaan3.move_forward
        expect(chandrayaan3.position).to eq([1, 0, 0])
        expect(chandrayaan3.direction).to eq('E')
      end

      it "moves forward in the South direction" do
        chandrayaan3 = Chandrayaan3.new([0,0,0], 'S')
        chandrayaan3.move_forward
        expect(chandrayaan3.position).to eq([0, -1, 0])
        expect(chandrayaan3.direction).to eq('S')
      end

      it "moves forward in the West direction" do
        chandrayaan3 = Chandrayaan3.new([0,0,0], 'W')
        chandrayaan3.move_forward
        expect(chandrayaan3.position).to eq([-1, 0, 0])
        expect(chandrayaan3.direction).to eq('W')
      end

      it "moves forward in the UP direction" do
        chandrayaan3 = Chandrayaan3.new([0,0,0], 'U')
        chandrayaan3.move_forward
        expect(chandrayaan3.position).to eq([0, 0, 1])
        expect(chandrayaan3.direction).to eq('U')
      end

      it "moves forward in the Each direction" do
        chandrayaan3 = Chandrayaan3.new([0,0,0], 'D')
        chandrayaan3.move_forward
        expect(chandrayaan3.position).to eq([0, 0, -1])
        expect(chandrayaan3.direction).to eq('D')
      end
    end
  end
end
