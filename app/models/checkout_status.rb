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
  has_many :users, :dependent => :destroy
  has_many :videos, :dependent => :destroy
  validates_presence_of :user_id, :video_id
end
