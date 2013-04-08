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
  xscenario 'check create field' do
    visit '/'
    within("#new_campaign") do
      fill_in 'start', :with => '2013-04-08'
      fill_in 'end', :with => '2013-04-010'
      fill_in 'country', :with => 'Norway'
      fill_in 'languages', :with => 'Norsk, English'
      click_button("Create")
    end
    save_and_open_page
    page.should have_content 'Campaign created!'
  end
end
