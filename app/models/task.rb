class Task < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3, maximum: 25 }
  belongs_to :category, foreign_key: :category_id
  belongs_to :user, foreign_key: :user_id
end
