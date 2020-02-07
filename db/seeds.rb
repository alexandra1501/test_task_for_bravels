urls = ["https://githubengineering.com/", "https://blogs.dropbox.com/tech/", "https://blog.engineyard.com/"]
urls.each { |url| Resource.create(url: url) }