module ApplicationHelper
    # If a year is negative it will be diplayed as a BC year    
    def format_year(year)
        if year < 0
          "#{year.abs} BC"
        else
          year.to_s
        end
    end
end
