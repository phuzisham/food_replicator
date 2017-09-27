class Recipe < ActiveRecord::Base
  has_many :entries
  has_many :ingredients, through: :entries
end
