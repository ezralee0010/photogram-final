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

  def liked_photos
    @the_username2 = params.fetch("username")

    @user2 = User.find_by(username: params[:username])

    @list_of_photos_2 = Like.where(fan_id: @user2)

    render({ :template => "users/liked_photos" })
  end

  def feed
    @the_username3 = params.fetch("username")

    @user3 = User.find_by(username: params[:username])

    @list_of_photos3 = Like.where(fan_id: @user3)

    render({ :template => "users/feed" })

    #use params hash and then fetch. 
  end
end
