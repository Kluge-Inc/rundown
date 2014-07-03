class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.belongs_to :postbox, index: true
      t.belongs_to :feed, index: true

      t.timestamps
    end
  end
end
