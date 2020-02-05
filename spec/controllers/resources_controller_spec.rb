# frozen_string_literal: true

require 'rails_helper'

describe ResourcesController, type: :request do
  it('shows all resources') do
    get '/resources'
    expect(response.status).to eq 200
  end

  it('creates an instance of resource') do
    get '/resources/new'
    resource = Resource.new(url: "https://google.com")
    expect(resource).to be_a_new(Resource)
  end

  it('creates a new resource') do
    post '/resources', params: { resource: { url: "https://google.com" }}
    expect(Resource.count).to eq 1
  end

  it('shows a new resource') do
    resource = Resource.create(url: "https://google.com")
    get "/resources/#{resource.id}"
    expect(response.status).to eq 200
  end
end
