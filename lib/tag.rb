class Tag < ActiveRecord::Base
  has_many :entries
  has_many :recipes, through: :entries
end
