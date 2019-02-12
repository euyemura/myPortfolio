class Blog < ApplicationRecord
  enum status: { draft: 0, published: 1}
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :body, :topic_id

  belongs_to :topic

  has_many :comments, dependent: :destroy


  def self.published_blogs current_user, params
    if current_user.roles[0] == :site_admin
      page(params[:page]).per(5).order(created_at: :desc)
    else
      page(params[:page]).per(5).where("status = '1'").order(created_at: :desc)
    end
  end
end
