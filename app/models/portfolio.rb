class Portfolio < ApplicationRecord
  has_many :technologies
  # the below line pretty much sets everything up, but we still need to do some data validation type stuff, like making sure someone actually connects a technology to a portfolio.
  accepts_nested_attributes_for :technologies,
                                allow_destroy: true,
                                reject_if: lambda { |attrs| attrs['name'].blank? }

  validates_presence_of :title, :body, :git_link, :live_link

  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader

  def self.angular
    where(subtitle: "Angular")
    #this creates a custom method, or scope, where if you use the .angular on its self, meaning, the Portfolio database, then it'll use this custom parameter, thats so awesomse.
  end

  scope :rails_magic, -> { where(subtitle: "Ruby on Rails")}
  #above are the two ways to add custom scoping to your model, ou do it in the model


  def self.by_position
    order("position ASC")
  end


end
