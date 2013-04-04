require 'spec_helper'
feature 'check campaign frontpage' , js: true do
  before(:all) do
    @c = FactoryGirl.create(:campaign)
  end
  after(:all) do
    Campaign.delete_all
  end

  scenario 'see list of campaigns' do
    visit '/'
    # page.should have_content 'Published'
  end
end
