class CreateBooksAndAuthorsBooks < ActiveRecord::Migration
  def self.up
    create_table :books do |table|
      table.column :title, :string, :limit => 255, :null => false
      table.column :publisher_id, :integer, :null => false
      table.column :published_at, :datetime
      table.column :isbn, :string, :limit => 13, :unique => true
      table.column :blurb, :text
      table.column :page_count, :integer
      table.column :price, :float
      table.column :created_at, :timestamp
      table.column :updated_at, :timestamp
    end
    create_table :authors_books, :id => false do |table|
      table.column :author_id, :integer, :null => false
      table.column :book_id, :integer, :null => false
    end
    say_with_time 'Adding foreign keys' do
      execute 'CREATE TRIGGER fk_bk_authors BEFORE DELETE ON authors ' +
        'FOR EACH ROW ' +
        'BEGIN ' +
        'DELETE FROM authors_books WHERE author_id = OLD.id; ' +
        'END'
      execute 'CREATE TRIGGER fk_bk_books BEFORE DELETE ON books ' +
        'FOR EACH ROW ' +
        'BEGIN ' +
        'DELETE FROM authors_books WHERE book_id = OLD.id; ' +
        'END'
      execute 'CREATE TRIGGER fk_books_publishers BEFORE DELETE ON publishers ' +
        'FOR EACH ROW ' +
        'BEGIN ' +
        'DELETE FROM books WHERE publisher_id = OLD.id; ' +
        'END'
    end
  end
  def self.down
    drop_table :authors_books
    drop_table :books
  end
end
