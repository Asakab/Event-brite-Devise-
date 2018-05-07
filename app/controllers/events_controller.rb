class EventsController < ApplicationController

  def new
  	@event = Event.new
  end


  def create
  	@event = Event.new(description: params['description'], date: params['date'], place: params['place'])
  	@event.creator_id = current_user.id
  	@event.save
  end






def show
end

def edit
end


def index
	@events = Event.all
end



end 