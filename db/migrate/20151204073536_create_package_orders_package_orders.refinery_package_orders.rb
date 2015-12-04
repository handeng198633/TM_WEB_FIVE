# This migration comes from refinery_package_orders (originally 1)
class CreatePackageOrdersPackageOrders < ActiveRecord::Migration

  def up
    create_table :refinery_package_orders do |t|
      t.integer :order_id
      t.string :number
      t.datetime :out_date
      t.datetime :return_date
      t.string :people
      t.integer :travel_content_id
      t.integer :price1
      t.integer :price2
      t.integer :price3
      t.integer :price4
      t.text :out_traffic
      t.text :return_traffic
      t.string :cost
      t.text :package_ornot
      t.string :sales_name
      t.datetime :sales_time
      t.string :operation
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-package_orders"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/package_orders/package_orders"})
    end

    drop_table :refinery_package_orders

  end

end
