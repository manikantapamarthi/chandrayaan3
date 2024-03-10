require './user_commands'

describe UserCommands do
  describe "#commands" do
    it "takes commands from user" do
      allow_any_instance_of(Kernel).to receive(:gets).and_return("frubl\n")
      user_commands = UserCommands.commands
      expect(user_commands).to eq(['f', 'r', 'u', 'b', 'l'])
    end
  end
end
