class Label < ApplicationRecord
  has_many :labellings
  has_many :tasks, through: :labellings
  validates :label_name, presence: true
end
