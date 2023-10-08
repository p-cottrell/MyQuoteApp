class HomeController < ApplicationController
  def index

    # Quote of the day logic
    daily_seed = Date.current.yday % Quote.count
    @quote_of_the_day = Quote.where(is_public: true).offset(daily_seed).first

    # Recently added quote logic
    @recent_quotes = Quote.includes(:philosopher).where(is_public: true).order(created_at: :desc).limit(5)
  end

  def uquotes
    @quotes = Quote.includes(:philosopher).where(user_id: session[:user_id])
    end
end
