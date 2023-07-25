class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: {maximum: 255},
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
  has_secure_password
  validates :password, length: { minimum: 6 }, on: :new
  has_many :tasks, dependent: :destroy

  before_destroy :admin_user_null
  before_update :admin_user_null

  private

  def admin_user_null
    @user = User.all
    @user1 = User.find(id)
    throw(:abort) if @user.where(admin: true).count == 1 && @user1.admin == true
  end
end
