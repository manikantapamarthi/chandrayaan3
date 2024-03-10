class UserCommands

  def self.commands
    puts "give your commands like fbrlbu"
    commands = gets.chomp.split('')
  end

  def self.exicute_commands(commands, chandrayaan3)
    commands.each do |command|
      case command
          when 'f' then chandrayaan3.move_forward
          when 'b' then chandrayaan3.move_backword
          when 'r' then chandrayaan3.move_right
          when 'l' then chandrayaan3.move_left
          when 'u' then chandrayaan3.move_up
          when 'd' then chandrayaan3.move_down
      end
    end
  end

end


# UserCommands.exicute_commands
