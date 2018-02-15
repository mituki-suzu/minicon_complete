class EventsController < ApplicationController
  def index
    @events = Event.page(params[:page]).per(3)

  end
end
