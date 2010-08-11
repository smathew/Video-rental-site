# == Schema Information
# Schema version: 20100811154936
#
# Table name: videos
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  category   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Video < ActiveRecord::Base
  attr_accessible :title
  belongs_to :categories
end
