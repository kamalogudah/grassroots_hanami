require_relative '../../../spec_helper'

describe Web::Controllers::Events::Create do
  let(:action) { Web::Controllers::Events::Create.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end


require_relative '../../../spec_helper'

describe Web::Controllers::Events::Create do
  let(:action) { Web::Controllers::Events::Create.new }
  let(:params) { Hash[event: { title: 'Ruby Talk', description: 'Paul gives a talk', location: 'Kisumu' }] }
  let(:repository) { EventRepository.new }

  before do
    repository.clear
  end

  it 'creates a new event' do
    action.call(params)
    event = repository.last

    event.id.wont_be_nil
    event.title.must_equal params.dig(:event, :title)
  end

  it 'redirects the user to the events listing' do
    response = action.call(params)

    response[0].must_equal 302
    response[1]['Location'].must_equal '/events'
  end
end
