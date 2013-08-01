class Node < ActiveRecord::Base
  attr_accessible :name, :value
  validates :name, presence: true
  validates :value, presence: true
  belongs_to :document
end
