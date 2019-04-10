class SubsController < ApplicationController

  before_action :require_log_in

  def new
    @sub = Sub.new
  end

  def edit
    @sub = Sub.find(params[:id])
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.user_id = current_user.id
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash[:error] = @sub.errors.full_messages
      render :new
    end
  end

  def index
    @subs = Sub.where(user_id: current_user.id)
  end

  def show
    @sub = Sub.find(params[:id])
    @post = Post.new
  end

  def update
    @sub = Sub.find(params[:id])
    if @sub.update_attributes(sub_params)
      redirect_to sub_url(@sub)
    else
      flash[:errors] = ["Your sub hasn't been found"]
      render :edit
    end
  end

  def destroy
    @sub = Sub.find(params[:id])
    @sub.destroy
    redirect_to subs_url
  end

  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end
