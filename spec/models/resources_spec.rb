# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Resource, type: :model do
  describe 'Resource validation' do
    it('url has to be unique') do
      Resource.create\
        url: 'https://blogs.dropbox.com/tech'

      resource = Resource.new\
        url: 'https://blogs.dropbox.com/tech'

      expect(resource.save).to be false
    end
  end
end
