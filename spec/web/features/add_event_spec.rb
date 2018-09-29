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

  it 'displays list of errors when params contains errors' do
    visit '/events/new'

    within 'form#event-form' do
      click_button 'Create'
    end

    current_path.must_equal('/events')

    assert page.has_content?('There was a problem with your submission')
    assert page.has_content?('Title must be filled')
    assert page.has_content?('Description must be filled')
    assert page.has_content?('Location must be filled')
  end
end
