class ReportsController < ApplicationController


  def show
    @report = Report.find_by_month_and_year(params[:month], Date.current.year)
  end





end
