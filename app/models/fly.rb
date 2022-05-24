# == Schema Information
#
# Table name: flies
#
#  id          :integer          not null, primary key
#  description :string
#  name        :string
#  photo       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Fly < ApplicationRecord
  has_many  :matches, dependent: :destroy
end
