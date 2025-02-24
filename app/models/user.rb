class User < ApplicationRecord
  has_secure_password

  has_many :user_accounts, dependent: :destroy
end
