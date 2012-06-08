class UsersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource :only => [:index]
  #authorize_resource :only => [:edit, :update]
  before_filter :correct_user, :only => [:edit, :update]

  def index
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  end

  def update
  end

  private

  	def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless @user == current_user
    end

end