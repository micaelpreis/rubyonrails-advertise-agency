class GeneralController < ApplicationController
  def index
  end

  # Import All Data To The Database
  def import_data
    file1 = Rails.root.join('app', 'assets', 'csv', 'impressions.csv')
    file2 = Rails.root.join('app', 'assets', 'csv', 'clicks.csv')
    file3 = Rails.root.join('app', 'assets', 'csv', 'conversions.csv')
    if file1.exist? && file2.exist? && file3.exist?
      Campaign.import(file1)
      Click.import(file2)
      Conversion.import(file3)
      redirect_to root_url, notice: 'Data imported!'
    else
      redirect_to root_url, alert: 'All three files need to be in the directory!'
    end
  end

  # Delete All Data From The Database
  def clean_data
    begin
      ActiveRecord::Base.transaction do
        Conversion.destroy_all
        Click.destroy_all
        Banner.destroy_all
        Campaign.destroy_all
        session.clear
        redirect_to root_url, notice: 'Data cleaned!'
      end
    rescue ActiveRecord::ActiveRecordError => e
      respond_to do |format|
        format.html { redirect_to root_path, alert: 'Could not clean data!' }
      end
    end
  end
end
