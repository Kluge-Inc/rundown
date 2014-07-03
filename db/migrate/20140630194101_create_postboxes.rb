class CreatePostboxes < ActiveRecord::Migration
  def change
    create_table :postboxes do |t|
      t.string :email
      t.integer :periodity

      t.timestamps
    end
  end
end
