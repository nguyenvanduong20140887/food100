class User < ApplicationRecord

  before_save {email.downcase!}

  validates :name, presence: true, length: {maximum: Settings.max_size_name}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: Settings.max_size_email},
    format: {with: VALID_EMAIL_REGEX}
  validates :password, length: {minimum: Settings.min_size_password}, allow_blank: true

  has_secure_password
end
