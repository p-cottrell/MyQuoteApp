class HomeController < ApplicationController
  def index

    # Quote of the day logic
    daily_seed = Date.current.yday % Quote.count
    @quote_of_the_day = Quote.offset(daily_seed).first

    # Recently added quote logic
    @quotes = Quote.includes(:philosopher).take(5)
  end
end
