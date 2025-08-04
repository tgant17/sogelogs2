class LogsController < ApplicationController
  def index
    @logs = Log.all
  end

  def show
    @log = Log.find(params[:id])
  end

  def new 
    @log = Log.new
  end 

  def create
    @log = Log.new(log_params)
    if @log.save
      redirect_to @log
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def log_params
      params.expect(log: [ :text ])
    end
end
