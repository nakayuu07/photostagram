class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :picture, counter_cache: :favorites_count
end
