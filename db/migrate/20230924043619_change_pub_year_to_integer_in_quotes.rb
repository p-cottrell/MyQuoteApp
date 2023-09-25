class ChangePubYearToIntegerInQuotes < ActiveRecord::Migration[7.0]
  def change
    # Change the column type
    change_column :quotes, :pub_year, :integer
  end
end
