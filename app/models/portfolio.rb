class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image

  def self.angular
    where(subtitle: "Angular")
    #this creates a custom method, or scope, where if you use the .angular on its self, meaning, the Portfolio database, then it'll use this custom parameter, thats so awesomse.
  end

  scope :rails_magic, -> { where(subtitle: "Ruby on Rails")}
end
