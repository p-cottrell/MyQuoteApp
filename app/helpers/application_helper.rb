module ApplicationHelper
    # If a year is negative it will be diplayed as a BC year
    # If the year is nil it will display "unknown"    
    def format_year(year)
      return "Unknown" if year.nil?
  
      if year < 0
          "#{year.abs} BC"
      else
          year.to_s
      end
  end
end
