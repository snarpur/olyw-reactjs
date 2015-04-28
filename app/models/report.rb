class Report < ActiveRecord::Base
  

  attr_reader :nth_month_lowest, :nth_month_highest,:average_temperature_for_current_month

  LOCATIONS = {
    :reykjavik => 1,
    :akureyri => 422
  }
  
  def self.by_location(loacation_id)
    where("location = ?",loacation_id)
  end

  
  def self.highest_temperature_for_month
    
  end
  
  def self.by_month(month)
    where("month = ?", month)
  end

  def self.by_year(year)
    where("year = ?", year)
  end
  
  def self.average_temperature_for_month(month)
    by_month(month).average("average_temperature")
  end
  
  def self.highest_temperature(month)
    by_month(month).select(:year,:highest_temperature).maximum("highest_temperature")
  end

  def self.lowest_temperature(month)
    by_month(month).minimum(:lowest_temperature).select(:year,:lowest_temperature)
  end

  def self.higher_average_months(month,temperature)
    by_month(month).where("average_temperature > ?", temperature)
  end
  
  def self.lower_average_months(month,temperature)
    by_month(month).where("average_temperature < ?", temperature)
  end

 def self.high_months(month)
    by_month(month).order("average_temperature DESC").limit(10).select(:year,:location,:average_temperature)
  end

  def self.low_months(month)
    by_month(month).order("average_temperature ASC").limit(10).select(:year,:location,:average_temperature)
  end

  def average_temperature_for_current_month
    Report.average_temperature_for_month(month)
  end

  def nth_month_highest
    Report.by_location(location).higher_average_months(month,average_temperature).count
  end

  def nth_month_lowest
    Report.by_location(location).lower_average_months(month,average_temperature).count
  end  

  def recent_months_higher
    Report.by_location(location).higher_average_months(month,average_temperature).order("year DESC").limit(10).select(:year,:location,:average_temperature)
  end
  
  def recent_months_lower
    Report.by_location(location).lower_average_months(month,average_temperature).order("year DESC").limit(10).select(:year,:location,:average_temperature)
  end

  


end
