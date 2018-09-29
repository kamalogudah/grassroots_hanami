module Web::Controllers::Events
  class Create
    include Web::Action

    def call(params)
      EventRepository.new.create(params[:event])
      
      redirect_to '/events'
    end
  end
end
