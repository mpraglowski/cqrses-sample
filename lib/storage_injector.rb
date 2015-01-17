module StorageInjector
  def storage
    @storage ||= EventStore.new
  end
end
