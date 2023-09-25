class Category < ApplicationRecord
    has_many :quotes, dependent: :destroy
    has_many :quotes, through: :quote_categories
end
