class ArticlesUpdateJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Resource.all.each { |r| Fetcher.perform(r.url, r.id) }
  end
end
