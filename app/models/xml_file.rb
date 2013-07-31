class XmlFile < ActiveRecord::Base
  attr_accessible :slug
  validates :slug, presence: true
end
