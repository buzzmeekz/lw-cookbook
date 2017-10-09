class Recipe
  attr_reader :name, :description, :rating

  def initialize(attributes = {})
    @name = attributes[:name]
    @description = attributes[:description]
    @rating = attributes[:rating]
  end
end
