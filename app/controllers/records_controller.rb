class RecordsController < ApplicationController
  before_filter :check_secret

  def create
    @record = Record.new(record_params)
    unless @record.save
      render text: "Woah"
    end
  end

  def update
    @record = Record.find(params[:id])
    if @record.update_attributes(record_params)
      flash.now[:notice] = "Record updated"
    else
      flash.now[:alert] = "There was a problem updating this record"
    end
    render action: :create
  end

  private

  def check_secret
    raise "NO" unless params[:secret] == Rails.application.secrets.http_password
  end

  def record_params
    params.require(:record).permit(:source_id, :gender, :age_range, :infection_location)
  end
end

