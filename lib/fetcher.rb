class Fetcher
  def self.perform(url, id)
    body_tag = UrlGetter.open_by_url(url)
    ArticleDetector.get(body_tag, url, id)
    clean_data = DataSanitizer.sanitize_data(body_tag)
    Article.create(url: url, title: clean_data[1], content: clean_data[0], resource_id: id)
  end
end
