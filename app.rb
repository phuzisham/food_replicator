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

post('/create_recipe') do
  title = params['title']
  instructions = params['instructions']
  @recipe = Recipe.create({:title => title, :instructions => instructions})
  redirect('/add_recipe')
end

get("/recipe/:id") do
  @recipe = Recipe.find(params["id"])
  erb(:recipe)
end

post("/recipe/:id") do
  @recipe = Recipe.find(params["id"])
  title = params['ingredients']
  new_ingredient = Ingredient.create({:title => title})
  @recipe.ingredients.push(new_ingredient)
  erb(:recipe)
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
