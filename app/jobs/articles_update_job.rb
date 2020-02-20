class ArticlesUpdateJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Resource.all.each { |r| ArticleDetector.open_by_url(r.url, r.id) }
  end
end
