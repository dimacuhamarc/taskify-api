class AddReferencesToModels < ActiveRecord::Migration[7.1]
  def change
    add_reference :categories, :user, null: false, foreign_key: true
    add_reference :tasks, :category, null: false, foreign_key: true
    add_reference :tasks, :user, null: false, foreign_key: true
  end
end
