class Portfolio < ApplicationRecord
  has_many :technologies
  # the below line pretty much sets everything up, but we still need to do some data validation type stuff, like making sure someone actually connects a technology to a portfolio. 
  accepts_nested_attributes_for :technologies,
                                reject_if: lambda { |attrs| attrs['name'].blank? }
  include Placeholder
  validates_presence_of :title, :body, :main_image, :thumb_image

  def self.angular
    where(subtitle: "Angular")
    #this creates a custom method, or scope, where if you use the .angular on its self, meaning, the Portfolio database, then it'll use this custom parameter, thats so awesomse.
  end

  scope :rails_magic, -> { where(subtitle: "Ruby on Rails")}
  #above are the two ways to add custom scoping to your model, ou do it in the model

  after_initialize :set_defaults
  #here were saying that after initilization, but before creation, we are going to set some default values, specifically for the thumb and the main images.

  def set_defaults
    self.main_image ||= "https://placeimg.com/600/400/nature"
    self.thumb_image ||= Placeholder.image_generator(width: 150, height: 100)
  end


end
