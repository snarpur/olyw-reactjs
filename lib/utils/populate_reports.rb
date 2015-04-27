require 'csv'
require 'json'

class PopulateReports
 
  def initialize(filename)
    @current_file = "#{Rails.root}/db/seed-reports/#{filename}.csv"
  end
  
  def fields
    @fields ||= codes.keys
  end
  
  def original_fields
    @original_fields ||= codes.values
  end
  
  def field(order)
    fields[order]
  end

  def original_field(order)
    original_fields[order] 
  end
  
  def csv_data
    @csv_data ||= read_csv_file("#{@current_file}")
  end

  def csv_hash
    @csv_hash ||= csv_to_hash
  end
  
  def csv_header
    @csv_header ||= csv_data.shift()[0].split(' ')
  end

  def csv_header_is_ok
    puts "is it ok #{csv_header == original_fields}"
    csv_header == original_fields
  end

  def replace_na_with_nil(entries)
    entries.map do |i|
      if i == "NA"
        nil
      else
        i
      end
    end
  end
 
  def csv_to_hash
    if csv_header_is_ok
      
      csv_data.map do |i|
        values = i[0].split(' ')
        values = replace_na_with_nil(values)
        entry = Hash[fields.zip(values)]
      end
    
    end
  end

  def read_csv_file(file = "data/ak_test.csv")
    CSV.read(file)
  end

  def extract_header!(csv)
    header = csv.shift
  end

  def populate_db
    csv_hash.each do |i|
      Report.create(i)
    end
  end
  
  def write_data_to_file(csv_hash)
    open("#{@current_file}.js", 'w') do |f|
      f.puts csv_hash.to_json
    end
  end

  def codes
    @codes ||= {
      location:                               "stöð",
      year:                                   "ár",
      month:                                  "mán",
      average_temperature:                    "t",
      average_high_temperature:               "tx",
      highest_temperature:                     "txx",
      date_of_highest_temperature:            "txxD1",
      average_low_temperature:                "tn",
      lowest_temperature:                     "tnn",
      date_of_lowest_temperature:             "tnnD1",
      average_humidity:                       "rh",
      total_percipitation:                    "r",
      highest_percipitation:                  "rx",
      date_of_highest_percipitation:          "rxD1",
      average_pressure:                       "p",
      average_cloud:                          "n",
      hours_of_sunshine:                      "sun",
      average_wind:                           "f"
    }
  end
end
