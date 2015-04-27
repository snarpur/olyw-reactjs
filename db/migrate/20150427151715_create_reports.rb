class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.integer :location, index: true 
      t.integer :year, index: true
      t.integer :month, index: true
      t.decimal :average_temperature, precision: 5, scale: 1
      t.decimal :average_high_temperature, precision: 5, scale: 1
      t.decimal :highest_temperature, precision: 5, scale: 1
      t.integer :date_of_highest_temperature
      t.decimal :average_low_temperature, precision: 5, scale: 1
      t.decimal :lowest_temperature, precision: 5, scale: 1
      t.integer :date_of_lowest_temperature
      t.decimal :average_humidity, precision: 5, scale: 1
      t.decimal :total_percipitation, precision: 5, scale: 1
      t.decimal :highest_percipitation, precision: 5, scale: 1
      t.integer :date_of_highest_percipitation
      t.decimal :average_pressure, precision: 5, scale: 1
      t.decimal :average_cloud, precision: 5, scale: 1
      t.decimal :hours_of_sunshine, precision: 5, scale: 1
      t.decimal :average_wind, precision: 5, scale: 1

      t.timestamps
    end
  end
end

