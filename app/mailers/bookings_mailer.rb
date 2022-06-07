require "rqrcode"
class BookingsMailer < ApplicationMailer
  def booking_confirmation(booking)
    @booking = booking
    @customer = booking.customer
    @workshop = booking.workshop
    qrcode = RQRCode::QRCode.new("http://github.com/")

    # NOTE: showing with default options specified explicitly
    @svg = qrcode.as_svg(
    color: "000",
    shape_rendering: "crispEdges",
    module_size: 11,
    standalone: true,
    use_path: true
    )
    mail to: @customer.email, subject: "Booking confirmation"
  end
end
