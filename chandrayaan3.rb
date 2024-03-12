require_relative "./user_commands"

class Chandrayaan3
  attr_accessor :position, :direction

  def initialize(position, direction)
    @position = position
    @direction = direction
  end


  def get_commands
    commands = UserCommands.commands
    UserCommands.exicute_commands(commands, self)
  end

  def move_forward
    case @direction
    when 'E' then @position[0] += 1
    when 'W' then @position[0] -= 1
    when 'N' then @position[1] += 1
    when 'S' then @position[1] -= 1
    when 'U' then @position[2] += 1
    when "D" then @position[2] -= 1
    end
  end

  def move_backward
    case @direction
    when 'E' then @position[0] -= 1
    when 'W' then @position[0] += 1
    when 'N' then @position[1] -= 1
    when 'S' then @position[1] += 1
    when 'U' then @position[2] -= 1
    when "D" then @position[2] += 1
    end
  end

  def move_right
  end

  def move_left
  end

  def move_up
  end

  def move_down
  end
end

chandrayaan3 = Chandrayaan3.new([0,0,0], 'N')
chandrayaan3.get_commands
