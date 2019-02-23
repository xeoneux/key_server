class UnblockKeyJob < ApplicationJob
  queue_as :default

  def perform(*args)
    @key = args.first
    if @key.blocked
      @key.blocked = false
      @key.save
    end
  end
end
