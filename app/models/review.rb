# == Schema Information
#
# Table name: reviews
#
#  id            :integer          not null, primary key
#  username      :string
#  body          :string
#  rating        :integer
#  restaurant_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Review < ApplicationRecord
  validates :username, :rating, presence: true

  belongs_to :restaurant,
    class_name: :Restaurant,
    foreign_key: :restaurant_id,
    primary_key: :id
end
