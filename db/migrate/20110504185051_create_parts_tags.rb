class CreatePartsTags < ActiveRecord::Migration
  def self.up
    create_table :parts_tags, :id => false do |t|
      t.integer :part_id
      t.integer :tag_id
    end
  end

  def self.down
    drop_table :parts_tags
  end
end
