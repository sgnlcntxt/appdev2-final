# == Schema Information
#
# Table name: bugs
#
#  id          :integer          not null, primary key
#  description :string
#  name        :string
#  photo       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Bug < ApplicationRecord
  has_many  :hatches, dependent: :nullify
  has_many  :matches, dependent: :nullify
end
