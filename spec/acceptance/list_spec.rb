require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Locations list of my frieds", %q{
  As a traveler
  I want to see a list of locations where my friends are
  For I choose a close path to visit them
}do

  scenario "see the list" do
    visit locations_path
    first_location = Location.first
    
    within '.table' do
      page.should have_content "#{first_location.latitude}"
      page.should have_content "#{first_location.longitude}"
    end
  end
  
  scenario "reload page every 1 second and change my location do visited" do
    visit locations_path
    sleep(1)
    within ".table" do
      page.should have_content('Here')
    end
  end
end