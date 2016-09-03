class CampaignsController < ApplicationController
  def index
    @campaigns = Campaign.all.order(id: :asc)
  end

  def show
    @campaign = Campaign.find(params[:id])
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def campaign_params
      params.fetch(:campaign, {})
    end
end
