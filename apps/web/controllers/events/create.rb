module Web::Controllers::Events
  class Create
    include Web::Action

    expose :event

    params do
      required(:event).schema do
        required(:title).filled(:str?)
        required(:description).filled(:str?)
        required(:location).filled(:str?)
      end
    end

    def call(params)
      if params.valid?
        @event = EventRepository.new.create(params[:event])

        redirect_to routes.events_path
      else
        self.status = 422
      end
    end
  end
end
