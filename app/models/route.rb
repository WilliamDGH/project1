# == Schema Information
#
# Table name: routes
#
#  id         :bigint(8)        not null, primary key
#  start      :text
#  end        :text
#  capacity   :integer
#  full       :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  vacancy    :integer
#  passengers :text             default([]), is an Array
#

class Route < ApplicationRecord
  belongs_to :user, :optional => true
  has_many :bookings
  multisearchable :against => [:start, :end]

end
