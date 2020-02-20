# frozen_string_literal: true

urls = [
  'https://blogs.dropbox.com/tech/2020/02/dropbox-bug-bounty-program-has-paid-out-over-1000000/',
  'https://blog.engineyard.com/rubyconf-round-up',
  'https://product.hubspot.com/blog/deep-contextual-multi-armed-bandits-deep-learning-for-smarter-a/b-testing-on-autopilot',
  'https://medium.engineering/code-reviews-at-medium-bed2c0dce13a',
  'https://netpeak.net/ru/blog/sistemnyye-uluchsheniya-netpeak-demo-uslug-ppc-chat-lyubiteley-bloga-i-servis-poiska-oshibok-reklamnykh-kampaniy-v-cluster/',
  'https://texterra.ru/blog/glubinnyy-narod-kto-on-massovyy-rossiyskiy-potrebitel-i-chego-khochet.html',
  'https://www.blog.google/products/g-suite/gmail-tips-that-help-you-save-time-and-get-more-done/'
]
urls.each { |url| Resource.create(url: url) }
