json.(@report,:average_temperature,:year,:month,:nth_month_lowest,:nth_month_highest,:average_temperature_for_current_month)

# json.lowest Report.highest_temperature(@report.month) do |r|
#   json.higest_temperature r.higest_temperature
# end


json.high do
  json.array! Report.high_months(@report.month) do |r|
    json.year r.year
    json.average_temperature r.average_temperature
  end
end
json.low do
  json.array! Report.low_months(@report.month) do |r|
    json.year r.year
    json.average_temperature r.average_temperature
  end
end

json.recent_low do
  json.array! @report.recent_months_lower do |r|
    json.year r.year
    json.average_temperature r.average_temperature
  end
end

json.recent_high do
  json.array! @report.recent_months_higher do |r|
    json.year r.year
    json.average_temperature r.average_temperature
  end
end
