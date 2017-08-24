class Comment < ActiveRecord::Base
  validates :text, length: { maximum: 140 }
  validates :recipe_id, null: false

  belongs_to :recipe
end
