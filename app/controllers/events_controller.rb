class EventsController < ApplicationController
  def index
    @events = Event.page(params[:page]).per(3)
    
    @events = Event.get_by_id(params[:id]).page(params[:page]).per(3) if params[:id].present?
    
    @categories = EventCategory.all
    
    # @events = Event.get_by_id(params[:koikatu]).page(params[:page]).per(3) if params[:koikatu].present?
    
    # @events = Event.get_by_id(params[:gourmet]).page(params[:page]).per(3) if params[:gourmet].present?
    
    @events = Event.get_by_title(params[:title]).page(params[:page]).per(3) if params[:title].present?
  end
end
