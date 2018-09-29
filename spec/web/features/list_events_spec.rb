require 'features_helper'

describe 'List events' do
 let(:repository) { EventRepository.new }
  before do
    repository.clear

    repository.create(title: 'Gor Mahia vs Afc Leopards', description: 'Good game', location: 'Kasarani', start_time: Time.now, end_time: Time.now)
    repository.create(title: 'Gor Mahia vs Sofapaka', description: 'Good game enough', location: 'Nyayo', start_time: Time.now, end_time: Time.now)
  end

  it 'displays each book on the page' do
    visit '/events'

    within '#books' do
      assert page.has_css?('.event', count: 2), 'Expected to find 2 events'
    end
  end
end
