class Ingredient < ActiveRecord::Base
  has_many :entries
  has_many :recipes, through: :entries
end
