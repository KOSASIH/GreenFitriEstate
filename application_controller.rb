# Application controller for API v1

module Api
  module V1
    class ApplicationController < ActionController::API
      include ActionController::Serialization
      include Api::V1::Concerns::Authentication
      include Api::V1::Concerns::Authorization
      include Api::V1::Concerns::ErrorHandling
      include Api::V1::Concerns::Pagination
      include Api::V1::Concerns::RateLimiting
      include Api::V1::Concerns::Caching

      before_action :authenticate_user, except: [:health_check]
      before_action :set_locale
      before_action :set_timezone
      before_action :set_request_id

      # Health check endpoint
      def health_check
        render json: { status: 'ok' }, status: :ok
      end

      private

      def authenticate_user
        authenticate_or_request_with_http_token do |token, options|
          User.find_by_token(token)
        end
      end

      def set_locale
        I18n.locale = params[:locale] || I18n.default_locale
      end

      def set_timezone
        Time.zone = params[:timezone] || Time.zone_default
      end

      def set_request_id
        RequestStore.store[:request_id] = SecureRandom.uuid
      end

      def render_error(error, status)
        render json: { error: error.message }, status: status
      end

      def paginate(collection)
        paginate_json(collection, per_page: 20)
      end

      def rate_limit_exceeded?
        Rails.cache.exist?("rate_limit:#{request.ip}:#{request.path}")
      end

      def cache_response
        Rails.cache.fetch("response:#{request.path}", expires_in: 1.hour) do
          yield
        end
      end
    end
  end
end
