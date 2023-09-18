class Category < ApplicationRecord
    has_many :quote_categories, dependant: :destroy
    has_many :quotes, through: :quote_categories
end
