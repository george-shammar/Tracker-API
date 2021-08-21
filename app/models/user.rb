class User < ApplicationRecord
  has_secure_password

  has_many :tracks, foreign_key: :patient

  validates_presence_of :name, :email, :password_digest
end
