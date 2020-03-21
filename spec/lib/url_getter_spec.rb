require 'rails_helper'
require './lib/url_getter.rb'

RSpec.describe UrlGetter do
  let!(:resource) { create(:resource) }

  it('returns body tag') do
    body = described_class.open_by_url(resource.url)
    expect(body.to_s).to start_with('<body')
  end
end
