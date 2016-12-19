class Post < ActiveRecord::Base
  # Remember to create a migration!
  validates :title, presence: true
  validates :location, presence: true
  validates :body, presence: true

  belongs_to :user
end
