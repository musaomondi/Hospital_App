class UserType < ActiveRecord::Base
  # attr_accessor :user_type_name
  has_many :users 
end
