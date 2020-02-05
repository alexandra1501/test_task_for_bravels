# frozen_string_literal: true

require 'rails_helper'

describe ArticlesController, type: :request do
  it('should show all articles') do
    get '/articles'
    expect(response.status).to eq 200
  end
end