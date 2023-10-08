# This controller handles the search functionality within the application
class SearchController < ApplicationController
  
  def index
    # Fetch all available categories
    @all_categories = Category.all

    # Grab the category query parameter from the URL
    category_query = params[:category_query]
    
    if category_query.present?
      # If category query parameter is present find the corresponding category from the database
      category = Category.find(category_query)
      
      # Retrieve all the quotes associated with the selected category
      @category_match = category.quotes.includes(:philosopher).where(is_public: true)
    end
  end
end

