class CreateDrinksUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :drinks_users do |t|

      t.timestamps
    end
  end
end
