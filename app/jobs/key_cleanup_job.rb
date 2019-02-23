class KeyCleanupJob < ApplicationJob
  queue_as :default

  def perform(*args)
    @key = args.first
    if @key
      if @key.keep_alive
        # if keep_alive is less than 30 seconds ago
        # reschedule key deletion
        # else delete key
      else
        @key.delete
      end
    end
  end
end
