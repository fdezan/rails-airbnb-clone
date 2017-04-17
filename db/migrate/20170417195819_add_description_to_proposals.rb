class AddDescriptionToProposals < ActiveRecord::Migration[5.0]
  def change
    add_column :proposals, :description, :text
  end
end
