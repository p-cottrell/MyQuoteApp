class SearchController < ApplicationController
  def index
    philosopher_query = params[:philosopher_query]
    if philosopher_query.present?
      @philosopher_match = Philosopher.includes(:quotes).where("fname LIKE ? OR lname LIKE ?", "%#{philosopher_query}%", "%#{philosopher_query}%")
    end
  end
end


