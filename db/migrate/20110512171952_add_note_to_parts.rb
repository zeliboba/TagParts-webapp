class AddNoteToParts < ActiveRecord::Migration
  def self.up
    add_column :parts, :note, :text
  end

  def self.down
    remove_column :parts, :note
  end
end
