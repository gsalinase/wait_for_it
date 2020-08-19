class User < ApplicationRecord
  has_many :tickets
end
class User < ApplicationRecord
  has_many :tickets
  has_many :user_companies
end
