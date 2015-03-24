module DomainEvent
  attr_reader :eventId, :version

  def eventType
    self.class.to_s
  end

  def data
    self.to_hash
  end

  def self.recreate(eventId, data, version)
    new(data) do |e|
      e.eventId = eventId
      e.version = version
    end
  end
end
