require 'rails_helper'
require './lib/article_detector'

RSpec.describe ArticleDetector do
  let!(:resource) { create(:resource) }

  it('creates article from given html') do
    expect do
      described_class.open_by_url(resource.url, resource.id)
    end.to change { Article.count }.by(1)
  end
end
