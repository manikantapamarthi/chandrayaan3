require_relative "./user_commands"

class Chandrayaan3
  attr_accessor :position, :direction

  def initialize(position, direction)
    @position = position
    @direction = direction

    @prev_direction = direction
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
    @direction = case [@prev_direction, @direction]
      when ['N','U'],['N', 'N'] then 'E'
      when ['E','U'], ['E','E'] then 'S'
      when ['S','U'], ['S', 'S'] then 'W'
      when ['W','U'], ['W', 'W'] then 'N'
      else
        @direction
      end
  end

  def move_left
    @direction = case [@prev_direction, @direction]
    when ['N','U'],['N', 'N'], ['N', 'D'] then 'W'
    when ['W','U'], ['W', 'W'], ['W', 'D'] then 'S'
    when ['S','U'], ['S', 'S'], ['S', 'D'] then 'E'
    when ['E','U'], ['E','E'], ['E','D'] then 'N'
    else
      @direction
    end
    @prev_direction = @direction
  end

  def move_up
    @prev_direction = @direction if @direction != 'U' || @direction != 'D'
    @direction = 'U'
  end

  def move_down
    @direction = 'D'
  end
end

chandrayaan3 = Chandrayaan3.new([0,0,0], 'N')
chandrayaan3.get_commands

p "chandrayaan current direction is #{chandrayaan3.direction}"
p "chandrayaan current position is #{chandrayaan3.position}"
