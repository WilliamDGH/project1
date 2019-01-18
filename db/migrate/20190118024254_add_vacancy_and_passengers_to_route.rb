class AddVacancyAndPassengersToRoute < ActiveRecord::Migration[5.2]
  def change
    add_column :routes, :vacancy, :integer, :default=>:capacity
    add_column :routes, :passengers, :text, :array=>true, :default=>[]
  end
end
