class ReportsController < ApplicationController


  def show
    @report = Report.by_location(params[:location]).by_year(Date.current.year).by_month(params[:month]).first
  end





end
