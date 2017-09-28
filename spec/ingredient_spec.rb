require('spec_helper')

describe(Ingredient) do
  it { should have_many(:recipes) }
  it("ensures the length of title is at most 40 characters") do
    ingredient = Ingredient.new({:title => "a".*(41)})
    expect(ingredient.save()).to(eq(false))
  end
end
