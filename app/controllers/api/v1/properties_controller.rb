# Properties controller for API v1

module Api
  module V1
    class PropertiesController < ApplicationController
      include ActionController::Serialization
      include Api::V1::Concerns::Authentication

      before_action :authenticate_user, except: [:index, :show]
      before_action :set_property, only: [:show, :update, :destroy]

      # GET /api/v1/properties
      def index
        @properties = Property.all
        render json: @properties, include: [:user], meta: { total_count: @properties.count }
      end

      # GET /api/v1/properties/:id
      def show
        render json: @property, include: [:user]
      end

      # POST /api/v1/properties
      def create
        @property = Property.new(property_params)
        if @property.save
          render json: @property, status: :created, location: api_v1_property_path(@property)
        else
          render json: @property.errors, status: :unprocessable_entity
        end
      end

      # PATCH /api/v1/properties/:id
      def update
        if @property.update(property_params)
          render json: @property
        else
          render json: @property.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/properties/:id
      def destroy
        @property.destroy
        render json: { message: 'Property deleted successfully' }, status: :ok
      end

      private

      def property_params
        params.require(:property).permit(:address, :price, :description, :user_id)
      end

      def set_property
        @property = Property.find(params[:id])
      end
    end
  end
end
