require_relative '../../spec_helper'

describe Event do
  it 'can be initialized with attributes' do
    event = Event.new(title: 'Gor Mahia vs Afc Leopards', description: 'Good game', location: 'Kasarani', start_time: Time.now, end_time: Time.now)
    event.description.must_equal 'Gor Mahia vs Afc Leopards'
  end
end
