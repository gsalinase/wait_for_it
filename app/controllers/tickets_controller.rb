class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket, only: [:show, :update, :destroy]

  def index
    if params[:user_id]
      @tickets = Ticket.by_user(params[:user_id])
    else
      @tickets = Ticket.all
    end

    render json: {
      tickets: @tickets,
      companies: @tickets.map{ |ticket| ticket.company }
    }
  end

  # GET /ticket/1
  def show
    render json: {
      ticket: @ticket,
      company: @ticket.company
    }
  end

  # POST /ticket
  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      render json: @ticket, status: :created, location: @ticket
    else
      render json: @ticket.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ticket/1
  def update
    if @ticket.update(ticket_params)
      render json: @ticket
    else
      render json: @ticket.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ticket/1
  def destroy
    @ticket.destroy
  end

  def total_ticket
    if current_user
      @tickets = Ticket.by_user(current_user.id).group_by_day_of_week(:updated_at, format: "%a").count
      render json: @tickets
    end
  end

  def last_tickets
    if current_user
      @tickets = Ticket.by_last_tickets(current_user.id)
      render json: {
        tickets: @tickets,
        companies: @tickets.map{ |ticket| ticket.company }
      }
    end
  end

  def last_tickets
    if current_user
      @tickets = Ticket.by_last_tickets(current_user.id)
      render json: {
        tickets: @tickets,
        companies: @tickets.map{ |ticket| ticket.company }
      }
    end
  end

  def call_ticket
    if current_user
      @ticket = Ticket.last
      @ticket.update_attributes(state: 1)
      UserMailer.with(user: @ticket.user_id).is_time.deliver_now
      render json: @ticket
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ticket_params
      params.require(:ticket).permit(:company_id, :user_id, :ticket_number, :priority, :state)
    end
end
