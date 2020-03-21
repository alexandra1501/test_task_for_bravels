require 'rails_helper'
require './lib/article_detector.rb'

RSpec.describe DataSanitizer do
  let!(:resource) { create(:resource) }
  before(:each) do
    html = Nokogiri::HTML(open(resource.url))
    @sanitized_data = described_class.sanitize_data(html)
  end

  it('should have correct title of an article') do
    expect(@sanitized_data[1]).to eq('Joomla vs WordPress vs Drupal | Bluehost')
  end

  it('should have correct content of an article') do
    expect(@sanitized_data[0]).to eq(file_fixture('content.txt').read)
  end
end
