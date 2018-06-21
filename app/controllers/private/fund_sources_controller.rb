module Private
  class FundSourcesController < BaseController

    def create
      new_fund_source = current_user.fund_sources.new fund_source_params

      Rails.logger.info "My fund source #{new_fund_source.to_json}"

      if new_fund_source.save
        render nothing: true
        #render json: new_fund_source, status: :ok
      else
        head :bad_request
      end
    end

    def index
      fund_sources = current_user.fund_sources
      render json: fund_sources, status: :ok
    end

    def update
      account = 
current_user.accounts.with_currency(fund_source.currency).first
      account.update default_withdraw_fund_source_id: params[:id]

      head :ok
    end

    def destroy
      render json: fund_source.destroy, status: :ok
    end

    private

    def fund_source
      current_user.fund_sources.find(params[:id])
    end

    def fund_source_params
      params.require(:fund_source).permit(:currency, :uid, :extra, :routing_number)
    end
  end
end

