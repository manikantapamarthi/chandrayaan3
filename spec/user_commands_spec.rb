require './user_commands'
require './chandrayaan3'

describe UserCommands do
  describe "#commands" do
    it "takes commands from user" do
      allow_any_instance_of(Kernel).to receive(:gets).and_return("frubl\n")
      user_commands = UserCommands.commands
      expect(user_commands).to eq(['f', 'r', 'u', 'b', 'l'])
    end
  end

  describe "#exicute_commands" do
    it "calls the space caft direction method" do
      chandrayaan3 = Chandrayaan3.new([0,0,0], 'N')
      commands = ['f', 'b', 'l', 'r', 'u', 'd' ]
      expect(chandrayaan3).to receive(:move_forward)
      expect(chandrayaan3).to receive(:move_backward)
      expect(chandrayaan3).to receive(:move_right)
      expect(chandrayaan3).to receive(:move_left)
      expect(chandrayaan3).to receive(:move_up)
      expect(chandrayaan3).to receive(:move_down)

      UserCommands.exicute_commands(commands, chandrayaan3)

    end
  end
end
