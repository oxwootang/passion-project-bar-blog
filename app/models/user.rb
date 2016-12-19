class User < ActiveRecord::Base
  # Remember to create a migration!
  include BCrypt

  has_many :posts

  validates :email, uniqueness: true
  validates :email, presence: true
  validates :password_hash, presence: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def create
    @user = User.new(params[:user])
    @user.password = params[:password]
    @user.save!
  end
end
