class Resource < ApplicationRecord
  has_many :articles
  
  validates :url, uniqueness: true
end
