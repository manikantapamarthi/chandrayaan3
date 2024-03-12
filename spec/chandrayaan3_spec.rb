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
    describe "#move_backward" do
      it 'moves backward in North direction' do
        chandrayaan3 = Chandrayaan3.new([0,0,0], 'N')
        chandrayaan3.move_backward
        expect(chandrayaan3.position).to eq([0, -1, 0])
        expect(chandrayaan3.direction).to eq('N')
      end
      it 'moves backward in South direction' do
        chandrayaan3 = Chandrayaan3.new([0,0,0], 'S')
        chandrayaan3.move_backward
        expect(chandrayaan3.position).to eq([0, 1, 0])
        expect(chandrayaan3.direction).to eq('S')
      end
      it 'moves backward in East direction' do
        chandrayaan3 = Chandrayaan3.new([0,0,0], 'E')
        chandrayaan3.move_backward
        expect(chandrayaan3.position).to eq([-1, 0, 0])
        expect(chandrayaan3.direction).to eq('E')
      end
      it 'moves backward in West direction' do
        chandrayaan3 = Chandrayaan3.new([0,0,0], 'W')
        chandrayaan3.move_backward
        expect(chandrayaan3.position).to eq([1, 0, 0])
        expect(chandrayaan3.direction).to eq('W')
      end
      it 'moves backward in UP direction' do
        chandrayaan3 = Chandrayaan3.new([0,0,0], 'U')
        chandrayaan3.move_backward
        expect(chandrayaan3.position).to eq([0, 0, -1])
        expect(chandrayaan3.direction).to eq('U')
      end
      it 'moves backward in Down direction' do
        chandrayaan3 = Chandrayaan3.new([0,0,0], 'D')
        chandrayaan3.move_backward
        expect(chandrayaan3.position).to eq([0, 0, 1])
        expect(chandrayaan3.direction).to eq('D')
      end
    end

    describe "#move_right" do
      it 'moves right from the north directions' do
        chandrayaan3 = Chandrayaan3.new([0, 0, 0], 'N')
        chandrayaan3.move_right
        expect(chandrayaan3.direction).to eq('E')
      end

      it 'moves right from the E directions' do
        chandrayaan3 = Chandrayaan3.new([0, 0, 0], 'E')
        chandrayaan3.move_right
        expect(chandrayaan3.direction).to eq('S')
      end

      it 'moves right from the S directions' do
        chandrayaan3 = Chandrayaan3.new([0, 0, 0], 'S')
        chandrayaan3.move_right
        expect(chandrayaan3.direction).to eq('W')
      end

      it 'moves right from the W directions' do
        chandrayaan3 = Chandrayaan3.new([0, 0, 0], 'W')
        chandrayaan3.move_right
        expect(chandrayaan3.direction).to eq('N')
      end

      it "moves up form the N direction then turns right" do
        chandrayaan3 = Chandrayaan3.new([0,0,0], 'N')
        chandrayaan3.move_up
        chandrayaan3.move_right
        expect(chandrayaan3).to eq('E')
      end

      it "moves up form the E direction then turns right" do
        chandrayaan3 = Chandrayaan3.new([0,0,0], 'E')
        chandrayaan3.move_up
        chandrayaan3.move_right
        expect(chandrayaan3).to eq('S')
      end

      it "moves up form the S direction then turns right" do
        chandrayaan3 = Chandrayaan3.new([0,0,0], 'S')
        chandrayaan3.move_up
        chandrayaan3.move_right
        expect(chandrayaan3).to eq('W')
      end

      it "moves up form the N direction then turns right" do
        chandrayaan3 = Chandrayaan3.new([0,0,0], 'w')
        chandrayaan3.move_up
        chandrayaan3.move_right
        expect(chandrayaan3).to eq('N')
      end
    end

    describe "#move_left" do
      it "moves left from the N direction" do
        chandrayaan3 = Chandrayaan3.new([0,0,0], 'N')
        chandrayaan3.move_left
        expect(chandrayaan3.direction).to eq('W')
      end

      it "moves left from the W direction" do
        chandrayaan3 = Chandrayaan3.new([0,0,0], 'W')
        chandrayaan3.move_left
        expect(chandrayaan3.direction).to eq('S')
      end

      it "moves left from the S direction" do
        chandrayaan3 = Chandrayaan3.new([0,0,0], 'S')
        chandrayaan3.move_left
        expect(chandrayaan3.direction).to eq('E')
      end

      it "moves left from the E direction" do
        chandrayaan3 = Chandrayaan3.new([0,0,0], 'E')
        chandrayaan3.move_left
        expect(chandrayaan3.direction).to eq('N')
      end

      it "moves up form the N direction then turn left" do
        chandrayaan3 = Chandrayaan3.new([0,0,0], 'N')
        chandrayaan3.move_up
        chandrayaan3.move_left
        expect(chandrayaan3.direction).to eq('W')
      end

      it "moves up from the W direction then turn left" do
        chandrayaan3 = Chandrayaan3.new([0,0,0], 'W')
        chandrayaan3.move_up
        chandrayaan3.move_left
        expect(chandrayaan3.direction).to eq('S')
      end

      it "moves up from the S direction then turn left" do
        chandrayaan3 = Chandrayaan3.new([0,0,0], 'S')
        chandrayaan3.move_up
        chandrayaan3.move_left
        expect(chandrayaan3.direction).to eq('E')
      end

      it "moves up from the E direction then turn left" do
        chandrayaan3 = Chandrayaan3.new([0,0,0], 'E')
        chandrayaan3.move_up
        chandrayaan3.move_left
        expect(chandrayaan3.direction).to eq('N')
      end
    end

    describe "#move_up" do
      it "moves up direction" do
        chandrayaan3 = Chandrayaan3.new([0,0,0], "U")
        chandrayaan3.move_up
        expect(chandrayaan3.move_up).to eq('U')
      end
    end

    describe "#move_down" do
      it "moves down direction" do
        chandrayaan3 = Chandrayaan3.new([0,0,0], 'D')
        chandrayaan3.move_down
        expect(chandrayaan3.move_down).to eq('D')
      end
    end
  end
end
