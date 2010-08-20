# == Schema Information
# Schema version: 20100816195102
#
# Table name: checkout_statuses
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  video_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class CheckoutStatus < ActiveRecord::Base
  attr_accessible :video_id

  belongs_to :user
  belongs_to :video
 
  validates_presence_of :user_id, :video_id
end
