class EventsController < ApplicationController

  def new
  	@event = Event.new
  end


  def create
  	@event = Event.new(description: params['description'], date: params['date'], place: params['place'], price: params['price'])
  	@event.creator_id = current_user.id
  	@event.save
  end






def show

end

def edit
 @event = Event.find(params[:id])
 redirect_to edit_event_path

end

def destroy
 @event = Event.find(params[:id])
 @event.destroy
 redirect_to event_path
end 

def index
	@events = Event.all
end



end 