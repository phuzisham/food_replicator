class CreateRecipeJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_table(:recipe_join) do |t|
      t.column(:tag_id, :integer)
      t.column(:ingredient_id, :integer)
      t.column(:recipe_id, :integer)
      t.timestamps()
    end
    remove_column(:recipes, :tag_id, :integer)
    remove_column(:recipes, :ingredient_id, :integer)
    remove_column(:recipes, :instruction_id, :integer)
  end
end
