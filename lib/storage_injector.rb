module StorageInjector
  private
  def storage
    @storage ||= HttpEventstore::Connection.new
  end

  def load_events(aggregate_id)
    storage.read_all_events_forward(stream_id(aggregate_id))
      .map{|e| recreate_event(e)}
  rescue HttpEventstore::StreamNotFound
    nil
  end

  def store_events(aggregate_id, events, expected_version)
    events.each do |e|
      storage.append_to_stream(stream_id(aggregate_id), e.type, e.data, expected_version)
    end
  end

  def recreate_event(event)
    event.type.constantize.recreate(event.event_id, event.data, event.id)
  end

  def stream_id(aggregate_id)
    "#{aggregate_class.to_s}$#{aggregate_id}"
  end
end
