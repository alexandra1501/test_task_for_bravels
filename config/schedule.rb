every 1.day, at: '12am' do
  runner 'ArticleUpdateJob.perform_later'
end
