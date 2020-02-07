require 'nokogiri'
require 'open-uri'

class Fetcher
  class << self
    def perform
      Resource.all.each { |r| fetch(r.url) }
    end

    def fetch(url)
      begin
        @url = url
        xml = Nokogiri::XML(open(@url + 'sitemap.xml')).css('loc').map(&:text)
      rescue OpenURI::HTTPError
        return
      else
        xml.each do |link|
          next if link.include?('404')
          response = open(link)
          html = Nokogiri::HTML(response)
          actual_link = Nokogiri::XML(open(link)).css('loc').text
          if link.include?("engineyard")
            sanitizer(link)
          elsif actual_link.blank?
            collect_links(html)
          else
            sanitizer(actual_link)
          end
        end
      end
    end

    def collect_links(html)
      a_tags = html.at('body').at('h1.post-title').css('a')
      hrefs_with_titles = a_tags.map do |a|
        @href = a.attributes['href']&.value
      end
      full_path = @url + @href.delete('/')
      redirect_page = Nokogiri::HTML(open(full_path))
      links_to_redirect = redirect_page.css('a')
      hrefs = links_to_redirect.map do |a|
        redirect_href = a.attributes['href']&.value
        sanitizer(redirect_href)
      end
    end

    def sanitizer(link)
      begin
        html = Nokogiri::HTML(open(link))
      rescue OpenURI::HTTPError
        return
      else
        if @url.include?('dropbox')
          title = html.at('header.entry-header').at('h1.entry-title').text.squish
          text_with_tags = html.at('body').at('div.entry-content').text
        elsif @url.include?('engineyard')
          title = html.at('div.post-header').at('span.hs_cos_wrapper').text.squish
          text_with_tags = html.at('div.post-body').text.squish
        else
          text_with_tags = html.at('body').at('div.post__content').text
          title = html.at('header.post__header').at('div.post__header-content').at('h1.post__title').text.squish
        end
        content = ActionController::Base.helpers.strip_tags(text_with_tags).squish
        resource = Resource.find_by(url: @url)
        Article.create(title: title, content: content, url: link, resource_id: resource.id)
      end
    end
  end
end
