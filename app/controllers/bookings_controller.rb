class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking).all
  end

  def show
    @book = Book.find(params[:book_id])
    @booking = Booking.find(params[:id])
    @booking.book = @book
    authorize @booking
  end

  def new
    @book = Book.find(params[:book_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @book = Book.find(params[:book_id].to_i)
    @booking.book = @book
    @booking.user = current_user
    if @booking.save!
      redirect_to book_path(@book)
    else
      render :new
    end
    authorize @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:user, :book, :start_date, :end_date)
  end
end
