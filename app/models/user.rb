class User < ApplicationRecord
  before_save {self.email =email.downcase}
  has_many :articles
  validates :username, presence: true, 
                      uniqueness: {case_sensitive: false}, 
                      length:{minimum:3, maximum:25}
  VALID_EMAIL_REGEX = /[a-z0-9]+@[a-z]+\.[a-z]{2,3}/
  validates :email, presence: true, 
                    uniqueness: {case_sensitive: false}, 
                    length:{maximum:105},
                    format: {with: VALID_EMAIL_REGEX}
  has_secure_password
end