class Goal < ApplicationRecord
  has_rich_text :description
  has_one_attached :wallpaper
end
