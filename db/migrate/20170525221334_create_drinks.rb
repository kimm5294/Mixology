class CreateDrinks < ActiveRecord::Migration[5.1]
  def change
    create_table :drinks do |t|
      t.string :name, null: false
      t.string :api_id, null: false

      t.timestamps(null: false)
    end
  end
end
