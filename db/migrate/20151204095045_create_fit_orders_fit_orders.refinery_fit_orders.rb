# This migration comes from refinery_fit_orders (originally 1)
class CreateFitOrdersFitOrders < ActiveRecord::Migration

  def up
    create_table :refinery_fit_orders do |t|
      t.integer :order_id
      t.string :group_number
      t.datetime :out_date
      t.datetime :return_date
      t.string :book_id
      t.string :book_name
      t.string :person_list
      t.text :come_info
      t.text :go_info
      t.integer :price1
      t.integer :price2
      t.integer :price3
      t.integer :price4
      t.text :customer
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-fit_orders"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/fit_orders/fit_orders"})
    end

    drop_table :refinery_fit_orders

  end

end
