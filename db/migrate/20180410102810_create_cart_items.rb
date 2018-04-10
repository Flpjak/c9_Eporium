class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
    t.column :book_id, :integer
      t.column :cart_id, :integer
      t.column :price, :float
      t.column :amount, :integer
      t.column :created_at, :datetime
      t.timestamps null: false
    end
  end
end
