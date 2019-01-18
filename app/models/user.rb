# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  email           :text
#  password_digest :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  joined_routes   :text             default([]), is an Array
#

class User < ApplicationRecord
  has_secure_password
  validates :email, :presence => true, :uniqueness => true
  has_many :routes
end
