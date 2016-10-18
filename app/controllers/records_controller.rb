class RecordsController < ApplicationController
  before_filter :check_secret

  def new
    @record = Record.new(record_params)
  end

  def create
    @record = Record.new(record_params)
    if @record.save
      render action: :edit
    else
      render text: "There's been an error creating this record"
    end
  end

  def update
    @record = Record.find(params[:id])
    if @record.update_attributes(record_params)
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

  def record_params
    params.require(:record).permit(:source_id, :gender, :age_range, :infection_location)
  end
end

