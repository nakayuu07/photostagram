class AddPicturesToFavoritesCount < ActiveRecord::Migration
  def change
    add_column :pictures, :favorites_count, :integer
  end
end
