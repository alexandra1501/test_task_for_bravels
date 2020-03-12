require 'open-uri'
require 'nokogiri'

class UrlGetter
  def self.open_by_url(url)
    html = Nokogiri::HTML(open(url))
  rescue OpenURI::HTTPError
    return
  else
    html.css('body')
  end
end
