class AddContentImageIdToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :content_image_id, :string
  end
end
