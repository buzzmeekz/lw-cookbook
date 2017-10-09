class View
  def display_recipes(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index} - #{recipe.name} - #{recipe.rating} - #{recipe.description.slice(0, 30)}"
    end
  end

  def ask_for_name_and_description
    attributes = {}
    puts "What's the recipe name?"
    print "> "
    attributes[:name] = gets.chomp
    puts "Please describe your recipe"
    print "> "
    attributes[:description] = gets.chomp
    return attributes
  end

  def ask_for_id_to_destroy
    ask_for_id("What's the recipe index you want to remove?")
  end

  def ask_for_id_to_add
    ask_for_id("What's the recipe index you would like to add?")
  end

  def ask_for_id(message)
    puts message
    index = gets.chomp.to_i
    return index
  end

  def ask_for_keyword
    puts "Please enter a search term"
    gets.chomp
  end
end