class UserCommands
  def self.commands
    puts "give your commands like fbrlbu"
    commands = gets.chomp.split('')
  end
end

commands = UserCommands.commands
