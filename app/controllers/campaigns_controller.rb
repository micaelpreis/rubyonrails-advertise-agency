class CampaignsController < ApplicationController
  before_action :set_campaign, only: [:show, :get_banners]

  def index
    @campaigns = Campaign.all.order(id: :asc)
  end

  def show
    id = @campaign.id

    # Get banners if there is nothing in session
    if session[id] == nil
      session[id] = get_banners.map(&:id)
    end

    # Get banner to show
    @banner = session[id].pop

    if session[id].empty?
      session[id] = nil
    end
  end

  private

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
      x = @banners_with_conversions.uniq.size

      if x >= 10
        @banners = @banners_with_conversions.top_banners.limit(10)
      elsif x >= 5 && x <= 9
        @banners = @banners_with_conversions.top_banners.limit(x)
      elsif x >= 1 && x <= 4
        @banners = banners_with_conversions_and_clicks(@banners_with_conversions.uniq, @banners_with_clicks, x)
      else
        @banners = banners_with_clicks_and_random(@banners_with_clicks.uniq, @campaign_banners)
      end
      @banners.shuffle
    end

    def banners_with_conversions_and_clicks(conversions, clicks, x)
      @banners_with_only_clicks = clicks.where.not(id: conversions.map(&:id))

      @banners = conversions + @banners_with_only_clicks.most_clicks.limit(5-x)
      @banners = Banner.where(id: @banners.map(&:id))
      @banners
    end

    def banners_with_clicks_and_random(clicks, campaign_banners)
      y = clicks.size
      if y < 5
        @banners_without_clicks = campaign_banners.where.not(id: clicks.map(&:id)).uniq.shuffle
        @banners = clicks + @banners_without_clicks[0, 5-y]
        @banners = Banner.where(id: @banners.map(&:id))
      else
        @banners = clicks.limit(5)
      end
      @banners
    end
end
