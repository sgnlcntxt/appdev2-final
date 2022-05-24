# == Schema Information
#
# Table name: matches
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  bug_id     :integer
#  fly_id     :integer
#
class Match < ApplicationRecord
  belongs_to :fly
  belongs_to :bug
end
