class HomeController < ApplicationController
  def index
    @posts = Post.all
    @users = User.all
  end

  def comment_write
    comment = Comment.new
    comment.content = params[:comment]
    comment.post_id = params[:post_id]
    comment.save

    redirect_to '/home/index'
  end

  def write
    post = Post.new
    post.title = params[:title]
    post.content = params[:content]

    if post.save
      redirect_to '/home/index'
    else
      render :text => post.errors.messages
    end

  end

  def upload
    u = User.new
    file = params[:pic]
    u.shooter = file

    uploader = ShooterUploader.new
    uploader.store!(file)

    u.save

    flash[:notice] = "파일 이름 : \"#{ u.shooter.url }\" 으로 저장되었습니다."

    redirect_to "/home/index"
  end

end
