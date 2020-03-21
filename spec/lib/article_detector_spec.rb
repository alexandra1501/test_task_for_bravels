require 'rails_helper'
require './lib/article_detector.rb'

RSpec.describe ArticleDetector do
  let!(:resource) { create(:resource) }

  it('should return tag') do
    html = Nokogiri::HTML(open(resource.url))
    expect(described_class.get(html).to_s).to start_with('<html')
  end
end
