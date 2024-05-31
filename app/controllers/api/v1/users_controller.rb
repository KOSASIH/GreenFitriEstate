# Users controller for API v1

module Api
  module V1
    class UsersController < ApplicationController
      include ActionController::Serialization
      include Api::V1::Concerns::Authentication

      before_action :authenticate_user, except: [:create]
      before_action :set_user, only: [:show, :update, :destroy]

      # GET /api/v1/users
      def index
        @users = User.all
        render json: @users, include: [:properties], meta: { total_count: @users.count }
      end

      # GET /api/v1/users/:id
      def show
        render json: @user, include: [:properties]
      end

      # POST /api/v1/users
      def create
        @user = User.new(user_params)
        if @user.save
          render json: @user, status: :created, location: api_v1_user_path(@user)
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      # PATCH /api/v1/users/:id
      def update
        if @user.update(user_params)
          render json: @user
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/users/:id
      def destroy
        @user.destroy
        render json: { message: 'User deleted successfully' }, status: :ok
      end

      private

      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end

      def set_user
        @user = User.find(params[:id])
      end
    end
  end
end
