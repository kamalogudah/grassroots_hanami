require 'features_helper'

describe 'Add an event' do
  after do
    EventRepository.new.clear
  end

  it 'can create a new event' do
    visit '/events/new'

    within 'form#event-form' do
      fill_in 'Title', with: 'New Event'
      fill_in 'Description', with: 'Some description'
      fill_in 'Location', with: 'Some Location'

      click_button 'Create'
    end

    current_path.must_equal('/events')
    assert page.has_content?('New Event')
  end
end
