class ArticlesUpdateJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Fetcher.perform
  end
end
