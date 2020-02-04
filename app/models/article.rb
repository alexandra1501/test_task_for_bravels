class Article < ApplicationRecord
  belongs_to :resource
  validates :url, uniqueness: true
end
