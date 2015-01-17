module CommandHandlers
  def execute(command)
    handler = "Domain::CommandHandlers::#{command.class.name.demodulize}"
    handler.constantize.new.call(command)
  end
end
