require_relative '../../../spec_helper'

describe Web::Views::Events::Index do
  let(:exposures) { Hash[events: []] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/events/index.html.erb') }
  let(:view)      { Web::Views::Events::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #events' do
    view.events.must_equal exposures.fetch(:events)
  end

  describe 'when there are no events' do
    it 'shows a placeholder message' do
      rendered.must_include('<p class="placeholder">There are no events yet.</p>')
    end
  end

  describe 'when there are events' do
    let(:event1)     { Event.new(title: 'Refactoring', description: 'Martin Fowler', location: 'Location1') }
    let(:event2)     { Event.new(title: 'Domain Driven Design', description: 'Eric Evans', location: 'Location2') }
    let(:exposures) { Hash[events: [event1, event2]] }

    it 'lists them all' do
      rendered.scan(/class="event"/).count.must_equal 2
      rendered.must_include('Refactoring')
      rendered.must_include('Domain Driven Design')
    end

    it 'hides the placeholder message' do
      rendered.wont_include('<p class="placeholder">There are no events yet.</p>')
    end
  end
end
