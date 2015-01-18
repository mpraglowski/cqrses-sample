class DeadSimplePublisher
  def publish(event)
    HANDLERS.each do |handler|
      method = method_name(event)
      handler.send(method, event) if handler.respond_to?(method)
    end
  end

  private
  def method_name(event)
    "#{event.class.name.demodulize.tableize.singularize}"
  end

  HANDLERS = [
    ReadModels::Order.new,
    ReadModels::OrderLine.new,
  ]
end
