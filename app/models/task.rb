class Task < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :content, length: {in: 1..140}
  scope :closest, -> {reorder("deadline DESC")}
  scope :search_by_title, -> (title){
    where("title like ?", "%#{title}%")
  }
  scope :search_by_priority, -> (priority){
    where(priority: priority)
  }
  enum importance: { 高: 0, 中: 1, 低: 2 }
end
