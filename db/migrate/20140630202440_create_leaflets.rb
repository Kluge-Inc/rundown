class CreateLeaflets < ActiveRecord::Migration
  def change
    create_table :leaflets do |t|

      t.timestamps
    end
  end
end
