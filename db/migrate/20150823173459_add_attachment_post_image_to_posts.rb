class AddAttachmentPostImageToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.attachment :post_image
    end
  end

  def self.down
    remove_attachment :posts, :post_image
  end
end
