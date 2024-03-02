class UsersController < ApplicationController
  include Devise::Controllers::Helpers
  before_action :authenticate_user!
  before_action :set_users, only: [:index]

  respond_to :json

  # GET /users
  def index
    if @users.empty?
      render json: { message: 'No Users found.' }
    else
      # Selecting only required attributes
      user_attributes = @users.map { |user| user.attributes.slice('email', 'created_at', 'name') }
      render json: user_attributes
    end
  end

  private 

  def set_users
    @users = User.all
  end
end
