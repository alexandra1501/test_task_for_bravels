class Resource < ApplicationRecord
  has_many :articles
  has_many :comments
  
  validates :url, uniqueness: true
end
