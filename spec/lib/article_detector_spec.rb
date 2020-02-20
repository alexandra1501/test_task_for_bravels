require 'rails_helper'
require './lib/article_detector'

RSpec.describe ArticleDetector do
  let!(:resource) { create(:resource) }

  it('creates article from given html') do
    expect do
      link = 'https://www.bluehost.com/blog/wordpress/joomla-vs-wordpress-vs-drupal-13427/'
      html = Nokogiri::HTML(open(link))
      described_class.sanitize_data(html.css('body'), link, resource.id)
    end.to change { Article.count }.by(1)
  end
end
