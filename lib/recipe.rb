class Recipe < ActiveRecord::Base
  has_many :entries
  has_many :ingredients, through: :entries
  has_many :tags, through: :entries
end
