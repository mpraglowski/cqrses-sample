module StorageInjector
  private
  def storage
    @storage ||= HttpEventstore::EventStoreConnection.new
  end

  def load_events(aggregate_id)
    storage.read_all_events_forward(stream_id(aggregate_id))
      .map{|e| recreate_event(e)}
  rescue HttpEventstore::StreamNotExist
    nil
  end

  def store_events(aggregate_id, events, expected_version)
    events.each do |e|
      storage.append_to_stream(stream_id(aggregate_id), e.eventType, e.data, expected_version)
    end
  end

  def recreate_event(event)
    type.constantize.recreate(event.eventId, event.data, event.id)
  end

  def stream_id(aggregate_id)
    "#{aggregate_class.to_s}$#{aggregate_id}"
  end
end
