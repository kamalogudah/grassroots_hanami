module Web::Controllers::Events
  class Index
    include Web::Action

    expose :events

    def call(params)
      @events = EventRepository.new.all
    end
  end
end
