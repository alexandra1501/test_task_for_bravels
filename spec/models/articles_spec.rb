# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'Article validation' do
    before(:each) do
      @resource = Resource.create(url: 'https://blogs.dropbox.com/tech')
    end

    it('url has to be unique') do
      Article.create\
        url: 'https://blogs.dropbox.com/tech/2020/02/dropbox-bug-bounty-program-has-paid-out-over-1000000/',
        title: 'Dropbox bug bounty program has paid out over $1,000,000',
        content: "Over the past five years, our bug bounty
          program has become an important part of improving
          our security posture, as it is now for many large
          tech companies.",
        resource_id: @resource.id

      article = Article.new\
        url: 'https://blogs.dropbox.com/tech/2020/02/dropbox-bug-bounty-program-has-paid-out-over-1000000/',
        title: 'Test',
        content: 'Test',
        resource_id: @resource.id

      expect(article.save).to be false
    end
  end
end
