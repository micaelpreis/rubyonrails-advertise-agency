class CampaignsController < ApplicationController
    before_action :set_campaign, only: [:show, :get_banners]

  def index
    @campaigns = Campaign.all.order(id: :asc)
  end

  def show
    id = @campaign.id

    # Get banners if there is nothing in session
    if session[id] == nil
      session[id] = get_banners.shuffle.map(&:id)
    end

    # Get banner to show
    @banner = session[id].pop

    if session[id].empty?
      session[id] = nil
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def campaign_params
      params.fetch(:campaign, {})
    end

    def set_campaign
      @campaign = Campaign.find(params[:id])
    end

    def get_banners
      @campaign_banners = @campaign.banners
      @banners_with_clicks = @campaign_banners.with_clicks
      @banners_with_conversions = @banners_with_clicks.with_conversions

      # Get number of banners with clicks the campaign has (x)
      x = @banners_with_conversions.size

      if x >= 10
        @banners_selected = @banners_with_conversions.top_banners
      elsif 5 <= x <= 9
        @banners_selected = @banners_with_conversions
      elsif 1 <= x <= 4
        @banners_selected = @banners_with_conversions + banners_with_clicks
        @banners_selected.uniq.limit(5)
      else
        if @banners_with_clicks.size < 5
          @banners_selected = @banners_with_clicks + @campaign_banners
          @banners_selected.uniq.limit(5)
        else
          @banners_selected = @banners_with_clicks.limit(5)
        end
      end
      @banners_selected
    end
end
