class AddStatusToLeaflets < ActiveRecord::Migration
  def change
    add_column :leaflets, :status, :integer
  end
end
