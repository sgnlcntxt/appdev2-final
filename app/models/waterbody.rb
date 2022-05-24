# == Schema Information
#
# Table name: waterbodies
#
#  id         :integer          not null, primary key
#  name       :string
#  photo      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Waterbody < ApplicationRecord
  has_many  :hatches, dependent: :destroy
end
