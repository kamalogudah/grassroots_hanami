require_relative '../../../spec_helper'

describe Web::Views::Events::New do
  let(:params)    { OpenStruct.new(valid?: false, error_messages: ['Title must be filled', 'Description must be filled', 'Location must be filled']) }
  let(:exposures) { Hash[params: params] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/events/new.html.erb') }
  let(:view)      { Web::Views::Events::New.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'displays list of errors when params contains errors' do
    rendered.must_include('There was a problem with your submission')
    rendered.must_include('Title must be filled')
    rendered.must_include('Description must be filled')
    rendered.must_include('Location must be filled')
  end
end
