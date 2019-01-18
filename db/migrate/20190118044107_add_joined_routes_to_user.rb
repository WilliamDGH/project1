class AddJoinedRoutesToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :joined_routes, :text, :array=>true, :default=>[]
  end
end
