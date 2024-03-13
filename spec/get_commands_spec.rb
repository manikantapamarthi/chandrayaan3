require_relative '../get_commands'

describe 'get_commands' do
  it 'checks the final position of the chandrayaan' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("frubl\n")

    $stdout = StringIO.new

    load 'get_commands.rb'
    output = $stdout.string
    expect(output).to include("final direction N")
    expect(output).to include("chandrayaan current position is [0, 1, -1]")
  end
end
