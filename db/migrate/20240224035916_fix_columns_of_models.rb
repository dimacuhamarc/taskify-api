class FixColumnsOfModels < ActiveRecord::Migration[7.1]
  def change
    remove_column :categories, :user_id
    remove_column :tasks, :user_id
    remove_column :tasks, :category_id
  end
end
