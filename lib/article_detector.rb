require 'open-uri'
require 'nokogiri'

class ArticleDetector
  def self.get(body)
    children = body.css('> *')
    children.detect do |child|
      result_persentage = (child.text.length.to_f / body.text.length) * 100
      if result_persentage > 51
        get(child)
      else
        child
      end
    end
  end
end
