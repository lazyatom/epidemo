class RecordsController < ApplicationController
  before_filter :check_secret

  def new
    @record = Record.new(record_attributes)
  end

  def create
    @record = Record.new(record_attributes)
    if @record.save
      redirect_to edit_record_path(@record, secret: Rails.application.secrets.http_password)
    else
      render text: "There's been an error creating this record"
    end
  end

  def edit
    @record = Record.find(params[:id])
  end

  def update
    @record = Record.find(params[:id])
    if @record.update_attributes(record_attributes)
      flash.now[:notice] = "Record updated"
    else
      flash.now[:alert] = "There was a problem updating this record"
    end
    render action: :edit
  end

  private

  def check_secret
    raise "NO" unless params[:secret] == Rails.application.secrets.http_password
  end

  def record_attributes
    if params[:record]
      params.require(:record).permit(:source_id, :gender, :age_range, :infection_location, :scanned_by)
    elsif params[:scanned_by]
      params.permit(:source_id, :scanned_by)
    else
      raise "Malformed params: #{params}"
    end
  end
end

