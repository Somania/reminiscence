class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :user_name, uniqueness: true, length: { minimum: 4, max: 16}

  has_many :posts, dependent: :destroy
end
