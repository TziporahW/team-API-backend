class Student < ApplicationRecord
  has_secure_password

  has_many :experiences
  has_many :educations
  has_many :skills
  has_many :capstones
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
end
