# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "PackageOrders" do
    describe "Admin" do
      describe "package_orders", type: :feature do
        refinery_login

        describe "package_orders list" do
          before do
            FactoryGirl.create(:package_order, :number => "UniqueTitleOne")
            FactoryGirl.create(:package_order, :number => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.package_orders_admin_package_orders_path
            expect(page).to have_content("UniqueTitleOne")
            expect(page).to have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.package_orders_admin_package_orders_path

            click_link "Add New Package Order"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Number", :with => "This is a test of the first string field"
              expect { click_button "Save" }.to change(Refinery::PackageOrders::PackageOrder, :count).from(0).to(1)

              expect(page).to have_content("'This is a test of the first string field' was successfully added.")
            end
          end

          context "invalid data" do
            it "should fail" do
              expect { click_button "Save" }.not_to change(Refinery::PackageOrders::PackageOrder, :count)

              expect(page).to have_content("Number can't be blank")
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:package_order, :number => "UniqueTitle") }

            it "should fail" do
              visit refinery.package_orders_admin_package_orders_path

              click_link "Add New Package Order"

              fill_in "Number", :with => "UniqueTitle"
              expect { click_button "Save" }.not_to change(Refinery::PackageOrders::PackageOrder, :count)

              expect(page).to have_content("There were problems")
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:package_order, :number => "A number") }

          it "should succeed" do
            visit refinery.package_orders_admin_package_orders_path

            within ".actions" do
              click_link "Edit this package order"
            end

            fill_in "Number", :with => "A different number"
            click_button "Save"

            expect(page).to have_content("'A different number' was successfully updated.")
            expect(page).not_to have_content("A number")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:package_order, :number => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.package_orders_admin_package_orders_path

            click_link "Remove this package order forever"

            expect(page).to have_content("'UniqueTitleOne' was successfully removed.")
            expect(Refinery::PackageOrders::PackageOrder.count).to eq(0)
          end
        end

      end
    end
  end
end
