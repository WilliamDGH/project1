# == Schema Information
#
# Table name: bookings
#
#  id         :bigint(8)        not null, primary key
#  user_id    :bigint(8)
#  route_id   :bigint(8)
#  start_date :datetime
#  end_date   :datetime
#  price      :integer
#  total      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Booking < ApplicationRecord
  belongs_to :user, :optional => true
  belongs_to :route, :optional => true
end
