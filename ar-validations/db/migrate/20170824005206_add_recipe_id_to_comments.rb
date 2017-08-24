class AddRecipeIdToComments < ActiveRecord::Migration[5.1]
  def change
    change_table(:comments) do |t|
      t.integer :recipe_id, null: false
    end
  end
end
