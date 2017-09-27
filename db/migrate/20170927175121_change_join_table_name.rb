class ChangeJoinTableName < ActiveRecord::Migration[5.1]
  def change
    rename_table :recipe_join, :ingredients_recipes_tags
  end
end
