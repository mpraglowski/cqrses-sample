module PublisherInjector
  def publish(events)
    Array.wrap(events).each do |event|
      publisher.publish(event)
    end
  end

  private
  def publisher
    @publisher ||= DeadSimplePublisher.new
  end
end
