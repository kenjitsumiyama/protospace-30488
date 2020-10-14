class UsersController < ApplicationController
  # before_action :authenticate_user!, except: [:show]
  
  def show
    @user = User.find(params[:id])
    @prototypes = @user.prototypes
    # @prototypes = Prototype.find(params[:id])
    # @image = user.image
    # @title = user.title
    # @catch_copy = user.catch_copy
    
   #  @prototypes= user.prototypes
    # @prototypes = Prototype.find(params[:id])

    # @prototypes = prototype.user.id   
    # Prototype.find(params[:id])
    # user = User.find(params[:id])
    #  name = @user.name
    #  @prototypes = @user.prototypes
    
    #@user = current_user.name
    #@prototypes = current_user.prototypes

   # @user = User.find(params[:id])
   # @name = user.name
   #@prototypes = user.prototypes
  end
end
