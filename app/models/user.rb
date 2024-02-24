class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  has_many :categories
  has_many :tasks
  has_many :uncategorized_tasks, class_name: 'Task', foreign_key: :category_id, dependent: :destroy
end
