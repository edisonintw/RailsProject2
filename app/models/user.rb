class User < ActiveRecord::Base
  validates :username, presence: true
  validates :age, presence: true
  validates :account, presence: true
  validates :password, presence: true
end
