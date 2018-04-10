class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.column :first_name, :string
      t.column :last_name, :string
      t.timestamps null: false
    end
  end
end
