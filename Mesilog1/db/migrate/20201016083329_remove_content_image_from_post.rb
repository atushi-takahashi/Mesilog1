class RemoveContentImageFromPost < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :content_image, :string
  end
end
