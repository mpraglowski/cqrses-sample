module DomainEvent
  attr_reader :event_id, :version

  def type
    self.class.to_s
  end

  def data
    self.to_hash
  end

  def self.recreate(event_id, data, version)
    new(data) do |e|
      e.event_id = event_id
      e.version = version
    end
  end
end
