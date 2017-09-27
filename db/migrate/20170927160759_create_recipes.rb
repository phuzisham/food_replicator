class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table(:recipes) do |t|
      t.column(:title, :string)
      t.column(:tag_id, :integer)
      t.column(:ingredient_id, :integer)
      t.column(:instruction_id, :integer)
      t.timestamps()
    end
    create_table(:instructions) do |t|
      t.column(:title, :string)
      t.timestamps()
    end
    create_table(:ingredients) do |t|
      t.column(:title, :string)
      t.timestamps()
    end
  end
end
