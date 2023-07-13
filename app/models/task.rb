class Task < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :content, length: {in: 1..140}
  scope :closest, -> {order(deadline: :asc)}
  scope :search_by_title, -> (title){
    where("title like ?", "%#{title}%")
  }
end
