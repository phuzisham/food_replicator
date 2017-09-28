require('spec_helper')

describe(Recipe) do
  it { should have_many(:ingredients) }
  it { should have_many(:tags) }
  it("ensures the length of title is at most 40 characters") do
    recipe = Recipe.new({:title => "a".*(41)})
    expect(recipe.save()).to(eq(false))
  end
end
