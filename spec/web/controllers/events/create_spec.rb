require_relative '../../../spec_helper'

describe Web::Controllers::Events::Create do
  let(:action) { Web::Controllers::Events::Create.new }
  let(:repository) { EventRepository.new }

  before do
    repository.clear
  end

  describe 'with valid params' do
    let(:params) { Hash[event: { title: 'Ruby Talk', description: 'Paul gives a talk', location: 'Kisumu' }] }

    it 'creates a event' do
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

  describe 'with invalid params' do
    let(:params) { Hash[event: {}] }

    it 'returns HTTP client error' do
      response = action.call(params)
      response[0].must_equal 422
    end

    it 'dumps errors in params' do
      action.call(params)
      errors = action.params.errors

      errors.dig(:event, :title).must_equal  ['is missing']
      errors.dig(:event, :author).must_equal ['is missing']
    end
  end
end
