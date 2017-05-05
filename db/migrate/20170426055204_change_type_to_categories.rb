class ChangeTypeToCategories < ActiveRecord::Migration
  def change
    rename_column :categories, :type, :category_type
    add_column :categories, :user_id, :integer, index: true
  end
end
