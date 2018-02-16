class EventsController < ApplicationController
  def index
    @events = Event.page(params[:page]).per(3)
    
    @events = Event.get_by_title(params[:title]).page(params[:page]).per(3)  if params[:title].present?
  end
end
