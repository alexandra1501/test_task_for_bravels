require 'open-uri'
require 'nokogiri'

class ArticleDetector
  def self.open_by_url(url, id)
    html = Nokogiri::HTML(open(url))
  rescue OpenURI::HTTPError
    return
  else
    body = html.css('body')
    get(body, url, id)
  end

  def self.get(body, url, id)
    children = body.css('> *')
    children.detect do |child|
      result_persentage = (child.text.length.to_f / body.text.length) * 100
      if result_persentage > 51
        get(child, url, id)
      else
        sanitize_data(body, url, id)
      end
    end
  end

  def self.sanitize_data(html, url, id)
    html.xpath('//script')&.remove
    html.xpath('//style')&.remove
    body_content = html.xpath('//text()').map(&:text).join(' ').squish
    title = html.xpath('//title').text.squish!
    Article.create(url: url, title: title, content: body_content, resource_id: id)
  end
end
