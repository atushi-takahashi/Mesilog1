class Post < ApplicationRecord
  
  belongs_to :user
  
  attachment :content_image
  
end