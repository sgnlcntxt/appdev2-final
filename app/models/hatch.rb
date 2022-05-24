# == Schema Information
#
# Table name: hatches
#
#  id           :integer          not null, primary key
#  end_date     :string
#  maximum_size :string
#  minimum_size :string
#  start_date   :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  bug_id       :integer
#  waterbody_id :integer
#
class Hatch < ApplicationRecord
  belongs_to :waterbody
  belongs_to :bug
end
