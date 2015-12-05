# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "LineLists" do
    describe "Admin" do
      describe "line_lists", type: :feature do
        refinery_login

        describe "line_lists list" do
          before do
            FactoryGirl.create(:line_list, :group_number => "UniqueTitleOne")
            FactoryGirl.create(:line_list, :group_number => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.line_lists_admin_line_lists_path
            expect(page).to have_content("UniqueTitleOne")
            expect(page).to have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.line_lists_admin_line_lists_path

            click_link "Add New Line List"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Group Number", :with => "This is a test of the first string field"
              expect { click_button "Save" }.to change(Refinery::LineLists::LineList, :count).from(0).to(1)

              expect(page).to have_content("'This is a test of the first string field' was successfully added.")
            end
          end

          context "invalid data" do
            it "should fail" do
              expect { click_button "Save" }.not_to change(Refinery::LineLists::LineList, :count)

              expect(page).to have_content("Group Number can't be blank")
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:line_list, :group_number => "UniqueTitle") }

            it "should fail" do
              visit refinery.line_lists_admin_line_lists_path

              click_link "Add New Line List"

              fill_in "Group Number", :with => "UniqueTitle"
              expect { click_button "Save" }.not_to change(Refinery::LineLists::LineList, :count)

              expect(page).to have_content("There were problems")
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:line_list, :group_number => "A group_number") }

          it "should succeed" do
            visit refinery.line_lists_admin_line_lists_path

            within ".actions" do
              click_link "Edit this line list"
            end

            fill_in "Group Number", :with => "A different group_number"
            click_button "Save"

            expect(page).to have_content("'A different group_number' was successfully updated.")
            expect(page).not_to have_content("A group_number")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:line_list, :group_number => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.line_lists_admin_line_lists_path

            click_link "Remove this line list forever"

            expect(page).to have_content("'UniqueTitleOne' was successfully removed.")
            expect(Refinery::LineLists::LineList.count).to eq(0)
          end
        end

      end
    end
  end
end
