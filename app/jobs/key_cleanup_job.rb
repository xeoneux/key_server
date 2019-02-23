class KeyCleanupJob < ApplicationJob
  queue_as :default

  def perform(*args)
    @key = args.first
    @key.delete if @key
  end
end
