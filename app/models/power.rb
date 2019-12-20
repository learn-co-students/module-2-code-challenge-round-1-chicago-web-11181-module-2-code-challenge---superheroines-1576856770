class Power < ApplicationRecord
  has_many :heroines
  has_many :owners, class_name: :Heroine
end
