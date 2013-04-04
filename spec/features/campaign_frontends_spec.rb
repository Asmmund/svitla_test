require 'spec_helper'
feature 'check campaign frontpage' ,  :js => true do
  before(:all) do
    @c = FactoryGirl.create(:campaign)

  end
  after(:all) do
    Campaign.delete_all
  end

  scenario 'see list of campaigns' do
    visit '/'
    page.should have_content @c.info
  end
  scenario 'check create field' do
    visit '/'
    within("#new_campaign") do
      fill_in 'start', :with => @c.start
      fill_in 'end', :with => @c.end
      fill_in 'country', :with => 'Norway'
      fill_in 'languages', :with => 'Norsk, English'
      click_button("Create")
    end
    page.should have_content 'Norsk, English'
  end
end
