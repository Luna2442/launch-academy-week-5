class Recipe < ActiveRecord::Base
  validates :name, uniqueness: true, null: false,
  format: {
    with: /(brussels sprouts|Brussels Sprouts)/
  }

  validates :servings, numericality: { greater_than: 0 }
end
