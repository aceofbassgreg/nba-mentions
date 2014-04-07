class Article < ActiveRecord::Base
  has_many :teams, through: :mentions

  validates_uniqueness_of :url
end
