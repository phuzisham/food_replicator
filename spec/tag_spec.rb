require('spec_helper')

describe(Tag) do
  it { should have_many(:recipes) }
  it("ensures the length of title is at most 40 characters") do
    recipe = Tag.new({:title => "a".*(41)})
    expect(recipe.save()).to(eq(false))
  end
end
