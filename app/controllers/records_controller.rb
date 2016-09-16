class RecordsController < ApplicationController
  before_filter :check_secret

  def create
    @record = Record.new(record_params)
    unless @record.save
      render text: "Woah"
    end
  end

  private

  def check_secret
    raise "NO" unless params[:secret] == 'secret'
  end

  def record_params
    params.require(:record).permit(:source_id)
  end
end

