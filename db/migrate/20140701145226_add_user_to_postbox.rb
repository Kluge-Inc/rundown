class AddUserToPostbox < ActiveRecord::Migration
  def change
    add_reference :postboxes, :user, index: true
  end
end
