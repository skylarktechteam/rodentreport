class ReportsController < ApplicationController
  
  before_action :get_report, only: [:show, :edit, :update, :destroy]

  def index
    @reports = Report.all
  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)

    if @report.save
      redirect_to root_path, notice: "Report Saved!"
    else
      render 'new', alert: "There was an error!"
    end

  end

  def show
  end

  def edit
  end

  def update

    if @report.update(report_params)
      redirect_to root_path, notice: "Report Updated!"
    else
      render 'edit', alert: "There was an error."
    end
  end

  def destroy
    @report.destroy
    redirect_to reports_path, notice: "Report Deleted!"
  end

private 
  def report_params
    params.require(:report).permit( :animal, :number, :datetime, :building_id )
  end

  def get_report
    @report = Report.find(params[:id])
  end
end
