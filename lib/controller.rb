require_relative 'recipe'
require_relative 'cookbook'
require_relative 'view'
require_relative 'scraper'
require 'pry-byebug'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    display_cookbook_recipies
  end

  def create
    attributes = @view.ask_for_name_and_description
    recipe = Recipe.new(attributes)
    @cookbook.add_recipe(recipe)
  end

  def destroy
    id = @view.ask_for_id_to_destroy
    @cookbook.remove_recipe(id)
  end

  def import
    # ask for the keyword
    keyword = @view.ask_for_keyword
    # search the keyword
    results = scrape(keyword)
    # display the results of search
    @view.display_recipes(results)
    # ask the user which result to import
    recipe_index = @view.ask_for_id_to_add
    # add the selected result to the cookbook
    recipe = results[recipe_index]
    @cookbook.add_recipe(recipe)
    # display the updated recipe list
    display_cookbook_recipies
  end

  private

  def display_cookbook_recipies
    recipes = @cookbook.all
    @view.display_recipes(recipes)
  end
end
