require 'nokogiri'
require 'open-uri'

class Fetcher
  class << self
    def perform
      @resource_url = Resource.fourth.url
      fetch(@resource_url + "robots.txt")
    end
    
  def fetch(url)
    response = open(url)
    html = Nokogiri::HTML(response)
    sitemap_url = @resource_url + "sitemap.xml"
    html.at('body').text.match?(sitemap_url)
    sitemap_response = open(sitemap_url)
    sitemap_html = Nokogiri::HTML(sitemap_response)
    sitemap_array = sitemap_html.at('body').text.scan(/.{64}|.+/).split(/ /)
    #collect_links(html)
  end

  def parse(body)
  end

  def collect_links(html)
    links = html.css('a')
    hrefs_with_titles = links.map do |a|
      href = a.attributes['href']&.value
      next unless href
      part_of_slugged_title = a.content.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '').scan(/\w+/).take(3).join('-')
      # "#{href} => #{ part_of_slugged_title} => #{a.content}"
      [href, part_of_slugged_title]
    end.compact
    hrefs_with_titles.select { |href_title| puts href_title[0].match(href_title[1]) }
  end
  # def select_links(title)
  #   title_distilled = title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  #   puts HREFS.select { |href| href.match(title_distilled) }
  # end
  # select_links(CONTENT)
end
end
