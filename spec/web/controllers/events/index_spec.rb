require_relative '../../../spec_helper'

describe Web::Controllers::Events::Index do
  let(:action) { Web::Controllers::Events::Index.new }
  let(:params) { Hash[] }
  let(:repository) { EventRepository.new }

  before do
    repository.clear

    @event = repository.create(title: 'TDD', description: 'Kent Beck', location: 'This location')
  end

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end

  it 'exposes all books' do
    action.call(params)
    action.exposures[:events].must_equal [@event]
  end
end
