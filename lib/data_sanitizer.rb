require 'open-uri'
require 'nokogiri'

class DataSanitizer
  def self.sanitize_data(html)
    html.xpath('//script')&.remove
    html.xpath('//style')&.remove
    object = []
    object << html.xpath('//text()').map(&:text).join(' ').squish
    object << html.xpath('//title').text.squish!
    object
  end
end
