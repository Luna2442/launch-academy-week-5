class InsertColumnServingsToRecipes < ActiveRecord::Migration[5.1]
  def change
    change_table(:recipes) do |t|
      t.integer :servings
    end
  end
end
