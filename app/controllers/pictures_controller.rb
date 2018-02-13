class PicturesController < ApplicationController
  before_action :authenticate_user!

  before_action :set_pictures, only:[:edit,:update,:destroy ,:show]

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = current_user.pictures.build(pictures_params)
    if @picture.save
     redirect_to pictures_path,notice:"写真を投稿しました"
     NoticeMailer.sendmail_picture(@picture).deliver
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

  def show
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end

  private
   def pictures_params
     params.require(:picture).permit(:title,:content,:avatar)
   end

   def set_pictures
     @picture = Picture.find(params[:id])
   end
end
