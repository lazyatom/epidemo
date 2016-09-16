class QrCodesController < ApplicationController
  def show
    @qr = RQRCode::QRCode.new(params[:source_id])
  end
end
