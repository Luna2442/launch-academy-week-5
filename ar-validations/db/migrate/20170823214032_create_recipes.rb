class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :name, null: false
    end
    
    add_index :recipes, :name, unique: true
  end

end
