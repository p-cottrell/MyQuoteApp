class SearchController < ApplicationController
  def index

    @all_categories = Category.all

    category_query = params[:category_query]
    if category_query.present?
      # Fetch the category first
      category = Category.find(category_query)
      
      # Now, fetch the quotes associated with that category
      @category_match = category.quotes.includes(:philosopher).where(is_public: true)
    end
  end
end
