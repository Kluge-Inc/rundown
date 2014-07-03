class AddPostboxToLeaflet < ActiveRecord::Migration
  def change
    add_reference :leaflets, :postbox, index: true
  end
end
