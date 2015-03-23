module StorageInjector
  private
  def storage
    @storage ||= HttpEventstore::EventStoreConnection.new
  end

  def load_events(aggregate_id)
    storage.read_all_events_forward(stream_id(aggregate_id))
      .map{|e| recreate_event(e.type, e.data)}
  rescue HttpEventstore::StreamNotExist
    nil
  end

  def store_events(aggregate_id, events)
    events.each do |e|
      binding.pry
      storage.append_to_stream(stream_id(aggregate_id), e.class.name, e)
    end
  end

  def recreate_event(type, data)
      binding.pry
    type.constantize.new(data) #JSON.parse(data).with_indifferent_access)
  end

  def stream_id(aggregate_id)
    "#{aggregate_class.to_s}$#{aggregate_id}"
  end
end
