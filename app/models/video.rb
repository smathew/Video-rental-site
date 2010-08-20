# == Schema Information
# Schema version: 20100812160521
#
# Table name: videos
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  category_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Video < ActiveRecord::Base
  belongs_to :category 
  has_many :users 
  has_many :checkout_statuses, :dependent => :destroy

  validates_presence_of :title, :message => "needs to be entered"
  validates_length_of :title, :maximum => 200
end
