# This migration comes from refinery_line_lists (originally 1)
class CreateLineListsLineLists < ActiveRecord::Migration

  def up
    create_table :refinery_line_lists do |t|
      t.integer :line_id
      t.string :group_number
      t.integer :last_day
      t.string :line_name
      t.string :line_info
      t.text :travel_content
      t.integer :picture_id
      t.integer :document_id
      t.string :price
      t.string :record_person
      t.string :sales_ornot
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-line_lists"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/line_lists/line_lists"})
    end

    drop_table :refinery_line_lists

  end

end
