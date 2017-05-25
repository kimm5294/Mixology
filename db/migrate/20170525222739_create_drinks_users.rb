class CreateDrinksUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :drinks_users do |t|
      t.references :user, null: false
      t.references :drink, null: false

      t.timestamps(null: false)
    end
  end
end
