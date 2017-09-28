require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
require('pry')

get('/') do
  @recipes = Recipe.all()
  @ingredients = Ingredient.all()
  @tags = Tag.all()
  erb(:index)
end

get('/add_recipe') do
  @recipes = Recipe.all()
  erb(:add_recipe)
end

get('/add_ingredient') do
  @ingredients = Ingredient.all()
  erb(:add_ingredient)
end

get('/add_tag') do
  @tags = Tag.all()
  erb(:add_tag)
end

get("/recipe/:id") do
  @recipe = Recipe.find(params["id"])
  erb(:recipe)
end

post('/create_recipe') do
  title = params['title']
  instructions = params['instructions']
  @recipe = Recipe.new({:title => title, :instructions => instructions})
  if @recipe.save()
    redirect('/add_recipe')
  else
    erb(:recipe_error)
  end
end

post('/create_ingredient') do
  title = params['title']
  @ingredient = Ingredient.new({:title => title})
  if @ingredient.save()
    redirect('/add_ingredient')
  else
    erb(:ingredient_error)
  end
end

post('/create_tag') do
  title = params['title']
  @tag = Tag.new({:title => title})
  if @tag.save()
    redirect('/add_tag')
  else
    erb(:tag_error)
  end
end

post("/recipe/:id") do
  @recipe = Recipe.find(params["id"])
  title = params['ingredients']
  new_ingredient = Ingredient.create({:title => title})
  @recipe.ingredients.push(new_ingredient)
  erb(:recipe)
end

post("/search_recipe") do
  search_query = params['search'].capitalize
  @recipe = Recipe.where(:title => search_query).first
  if @recipe
    id = @recipe.id
    redirect("/recipe/#{id}")
  else
    erb(:search_fail)
  end
end

patch('/recipe_title/:id') do
  @recipe = Recipe.find(params["id"])
  title = params['title']
  @recipe.update({:title => title})
  erb(:recipe)
end

patch('/recipe_instructions/:id') do
  @recipe = Recipe.find(params["id"])
  instructions = params['instructions']
  @recipe.update({:instructions => instructions})
  erb(:recipe)
end

delete("/recipe/:id") do
  @recipe = Recipe.find(params["id"])
  @recipe.delete
  redirect "/"
end

delete("/delete_ingredient") do
  ingredient_ids = params.fetch('ingredient_ids')
  ingredient_ids.each do |i|
    Ingredient.find(i).delete()
  end
  redirect('/add_ingredient')
end

delete("/delete_tag") do
  tag_ids = params.fetch('tag_ids')
  tag_ids.each do |i|
    Tag.find(i).delete()
  end
  redirect('/add_tag')
end

delete("/delete_recipe") do
  recipe_ids = params.fetch('recipe_ids')
  recipe_ids.each do |i|
    Recipe.find(i).delete()
  end
  redirect('/add_recipe')
end
