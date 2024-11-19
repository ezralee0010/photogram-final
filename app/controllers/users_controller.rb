class UsersController < ApplicationController
  def index
    matching_users = User.all
    @list_of_users = matching_users.order({ :username => :asc })
    render({ :template => "users/index" })
  end

  def show
    @the_username = params.fetch("username")

    @user = User.find_by(username: params[:username])

    @list_of_photos = Photo.where(owner_id: @user).order(updated_at: :desc)

    render({ :template => "users/show" })
  end
end
