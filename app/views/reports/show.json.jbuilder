json.(@report,:average_temperature,:year,:month,:nth_month_lowest,:nth_month_highest,:average_temperature_for_current_month)



json.high do
  json.array! Report.by_location(@report.location).high_months(@report.month) do |r|
    json.year r.year
    json.location r.location
    json.average_temperature r.average_temperature
  end
end

json.low do
  json.array! Report.by_location(@report.location).low_months(@report.month) do |r|
    json.year r.year
    json.location r.location
    json.average_temperature r.average_temperature
  end
end

# json.recent_low do
#   json.array! @report.recent_months_lower do |r|
#     json.year r.year
#     json.location r.location
#     json.average_temperature r.average_temperature
#   end
# end

# json.recent_high do
#   json.array! @report.recent_months_higher do |r|
#     json.year r.year
#     json.location r.location
#     json.average_temperature r.average_temperature
#   end
# end
