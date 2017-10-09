require_relative 'recipe'
require 'open-uri'
require 'nokogiri'

def scrape(keyword)
  # Input will be a search keyword
  results = []

  url = "https://www.epicurious.com/search/#{keyword}?content=recipe"

  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)

  html_doc.search('.summary').each do |element|
    name = element.search('h4').text
    desc = element.search('.dek').text
    rating = element.search('.recipes-ratings-summary').attribute('data-reviews-rating').value
    p rating
    results << Recipe.new({ name: name, description: desc, rating: rating })
  end

  results

  # Output will be the search results
  # An array of Recipe objects
end

# p scrape('cheese')
