class ChangeJoinTableNamePartTwoTheRevenge < ActiveRecord::Migration[5.1]
  def change
    rename_table :ingredients_recipes_tags, :entries
  end
end
