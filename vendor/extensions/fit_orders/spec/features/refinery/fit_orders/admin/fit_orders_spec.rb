# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "FitOrders" do
    describe "Admin" do
      describe "fit_orders", type: :feature do
        refinery_login

        describe "fit_orders list" do
          before do
            FactoryGirl.create(:fit_order, :group_number => "UniqueTitleOne")
            FactoryGirl.create(:fit_order, :group_number => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.fit_orders_admin_fit_orders_path
            expect(page).to have_content("UniqueTitleOne")
            expect(page).to have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.fit_orders_admin_fit_orders_path

            click_link "Add New Fit Order"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Group Number", :with => "This is a test of the first string field"
              expect { click_button "Save" }.to change(Refinery::FitOrders::FitOrder, :count).from(0).to(1)

              expect(page).to have_content("'This is a test of the first string field' was successfully added.")
            end
          end

          context "invalid data" do
            it "should fail" do
              expect { click_button "Save" }.not_to change(Refinery::FitOrders::FitOrder, :count)

              expect(page).to have_content("Group Number can't be blank")
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:fit_order, :group_number => "UniqueTitle") }

            it "should fail" do
              visit refinery.fit_orders_admin_fit_orders_path

              click_link "Add New Fit Order"

              fill_in "Group Number", :with => "UniqueTitle"
              expect { click_button "Save" }.not_to change(Refinery::FitOrders::FitOrder, :count)

              expect(page).to have_content("There were problems")
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:fit_order, :group_number => "A group_number") }

          it "should succeed" do
            visit refinery.fit_orders_admin_fit_orders_path

            within ".actions" do
              click_link "Edit this fit order"
            end

            fill_in "Group Number", :with => "A different group_number"
            click_button "Save"

            expect(page).to have_content("'A different group_number' was successfully updated.")
            expect(page).not_to have_content("A group_number")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:fit_order, :group_number => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.fit_orders_admin_fit_orders_path

            click_link "Remove this fit order forever"

            expect(page).to have_content("'UniqueTitleOne' was successfully removed.")
            expect(Refinery::FitOrders::FitOrder.count).to eq(0)
          end
        end

      end
    end
  end
end
