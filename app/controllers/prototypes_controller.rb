class PrototypesController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show,]
    before_action :move_to_index, only: [:edit]
  
  def index
    @prototypes = Prototype.all
    
  end

  def new
    @prototype = Prototype.new
  end
  
  def create
    # if Prototype.create(prototype_params)
     @prototype = Prototype.new(prototype_params)

     if @prototype.save
       #Prototype.create(prototype_params)
        redirect_to root_path
        else
       render :new
       #redirect_to new_root_path
    end
  end

    def destroy
      prototype= Prototype.find(params[:id])
      prototype.destroy

      if prototype.destroy
        redirect_to root_path #(@prototype)
        else
        render :index
        end
      end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  
    
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
     prototype = Prototype.find(params[:id])
     prototype.update(prototype_params)
     
     if prototype.update(prototype_params)
      #@prototype.update
      redirect_to prototype_path(prototype.id), method: :get 
    else
      render :edit
    end
  end
  
  
  private

  def prototype_params
    params.require(:prototype).permit(:title,:catch_copy,:concept,:image).merge(user_id: current_user.id)
  end

  
  def move_to_index
    prototype= Prototype.find(params[:id])
    unless user_signed_in? && current_user.id == prototype.user.id
      redirect_to action: :index
    end
  end

  # def move_to_index

    # redirect_to action: :index unless user_signed_in?

  # end

  # def correct_user
    # @current_user = current_user.prototype.find_by(id: params[:id])
      # unless @current_user 
        # redirect_to action: :index
      # end
  # end
  
end

