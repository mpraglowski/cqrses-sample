module CommandHandlers
  def execute(command)
    command.validate!
    handler = "Domain::CommandHandlers::#{command.class.name.demodulize}"
    handler.constantize.new.call(command)
  end
end
