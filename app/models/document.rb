class Document < ActiveRecord::Base
  before_validation :generate_unique_slug, on: :create
  attr_accessible :slug, :description
  validates :slug, presence: true, uniqueness: true
  has_many :nodes

  private

  def generate_unique_slug
    begin
      self.slug = SecureRandom.hex
    end while Document.exists?(slug: self.slug)
  end
end
