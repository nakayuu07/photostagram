class PicturesController < ApplicationController

  before_action :set_pictures, only:[:edit,:update,:destroy]

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(pictures_params)
    if @picture.save
     redirect_to pictures_path,notice:"写真を作成しました"
    else
     render 'new'
    end
  end

  def edit
  end

  def update
    if @picture.update(pictures_params)
      redirect_to pictures_path, notice: "写真を更新しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @picture.destroy
    redirect_to pictures_path,notice:"写真を削除しました"
  end

  private
   def pictures_params
     params.require(:picture).permit(:title,:content)
   end

   def set_pictures
     @picture = Picture.find(params[:id])
   end
end
