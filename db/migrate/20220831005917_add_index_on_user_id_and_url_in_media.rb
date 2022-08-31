class AddIndexOnUserIdAndUrlInMedia < ActiveRecord::Migration[7.0]
  def change
    add_index :media, %i[url user_id], unique: true
  end
end
