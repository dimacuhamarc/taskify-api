class Category < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3, maximum: 25 }
end
