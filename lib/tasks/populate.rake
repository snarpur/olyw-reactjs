 # encoding: utf-8
namespace :db do
  #########################################################################################################################
  #
  #                                                   TASKS
  #
  #########################################################################################################################

  desc "populate with csv data"
  task :populate_reports do 

  Rake::Task[:environment].invoke
    require "#{Rails.root}/lib/utils/populate_reports.rb"
    csv = ["ak","rek"]
    
    csv.each do |i|
      populator = PopulateReports.new(i)
      populator.populate_db()
    end
  
  end

end