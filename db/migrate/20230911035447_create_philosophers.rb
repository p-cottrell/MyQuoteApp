class CreatePhilosophers < ActiveRecord::Migration[7.0]
  def change
    create_table :philosophers do |t|
      t.string :fname, null: false
      t.string :lname
      t.integer :birth_year, null: false
      t.integer :death_year
      t.text :biography

      t.timestamps
    end
  end
end
