class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # these are virtual attributes, it takes a name and splits it, so we must validate the presence of a last_name

  validates_presence_of :name

  def first_name
      self.name.split.first
  end

  def last_name
    self.name.split.last
  end
end
