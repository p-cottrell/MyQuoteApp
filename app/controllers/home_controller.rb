class HomeController < ApplicationController
  def index
    # Quote of the day logic
    # Quote is determined using a daily seed (day as integer / amount of quotes)
    # This ensures a different quote is chosen daily but remains the same for all users throghout that day
    daily_seed = Date.current.yday % Quote.count
    @quote_of_the_day = Quote.where(is_public: true).offset(daily_seed).first

    # Recently added quote logic
    # Fetch the last 5 recently added public quotes.
    @recent_quotes = Quote.includes(:philosopher).where(is_public: true).order(created_at: :desc).limit(5)
  end

  # uquotes handles the user-specific quotes page
  def uquotes
    @quotes = Quote.includes(:philosopher).where(user_id: session[:user_id])
    end
end
