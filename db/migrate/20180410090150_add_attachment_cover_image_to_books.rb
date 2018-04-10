class AddAttachmentCoverImageToBooks < ActiveRecord::Migration
  def self.up
    change_table :books do |t|
      t.attachment :cover_image
    end
  end

  def self.down
    remove_attachment :books, :cover_image
  end
end
