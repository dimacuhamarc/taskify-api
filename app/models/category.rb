class Category < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3, maximum: 25 }
  belongs_to :user, foreign_key: :user_id
  has_many :tasks, dependent: :destroy
end
