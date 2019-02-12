class Topic < ApplicationRecord
  validates_presence_of :title
  has_many :blogs

  def self.has_blogs
    includes(:blogs).where.not(blogs: { id: nil, status: 0} )
  end
end
