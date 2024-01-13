class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: %i[show edit update destroy]

  # GET /events or /events.json
  def index
    @events = Event.all
    @user_email = current_user.email if user_signed_in?
  end

  # GET /events/1 or /events/1.json
  def show; end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit; end

  # POST /events or /events.json
  def create
    @event = Event.new(event_params)
    @event.event_type = params[:event][:event_type] == '1' ? 'Public' : 'Private'

    respond_to do |format|
      if @event.save
        # Display user email in the notice message
        format.html do
          redirect_to event_url(@event),
                      notice: "Event #{@event.name} was recently created
                      by #{current_user.email} at #{Time.now.strftime('%B %e, %Y %H:%M:%S')}"
        end
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
def update
  respond_to do |format|
    if @event.update(event_params)
      @event.event_type = params[:event][:event_type] == '1' ? 'Public' : 'Private'
      @event.save

      format.html do
        redirect_to event_url(@event),
                    notice: "Event #{@event.name} was recently updated
                    by #{current_user.email} at #{Time.now.strftime('%B %e, %Y %H:%M:%S')}"
      end
      format.json { render :show, status: :ok, location: @event }
    else
      format.html { render :edit, status: :unprocessable_entity }
      format.json { render json: @event.errors, status: :unprocessable_entity }
    end
  end
end


  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy!

    respond_to do |format|
      format.html do
        redirect_to events_url,
                    notice: "Event  #{@event.name} was recently deleted by #{current_user.email}
        at #{Time.now.strftime('%B %e, %Y %H:%M:%S')}"
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:name, :title, :description, :reservation, :event_type, :price,
                                  :capacity,:date, :location, :start_time, :end_time, :avatar,
                                  :banner, :category_id, :tickets)
  end
end
