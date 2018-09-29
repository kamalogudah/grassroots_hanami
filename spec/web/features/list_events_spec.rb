require 'features_helper'

describe 'List events' do
  it 'displays each event on the page' do
    visit '/events'

    within '#events' do
      assert page.has_css?('.event', count: 2), 'Expected to find 2 events'
    end
  end
end