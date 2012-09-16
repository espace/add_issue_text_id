class AddTextIdToIssues < ActiveRecord::Migration
  def self.up
    add_column :issues, :text_id, :string
  end

  def self.down
    remove_column :issues, :text_id
  end
end
