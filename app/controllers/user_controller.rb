class UserController < ApplicationController
  def new
    @user = User.new
    @res = {}

    respond_to do |format|
      format.html #new.html.erb
      format.xml{ render :xml => @user}
    end
  end

  def create
    if params[:user][:user_password] == params[:res][:again_password]
      @tmp_user = User.new
      @tmp_user.user_id = @tmp_user.id
      @tmp_user.user_name = params[:user][:user_name]
      @tmp_user.user_password = Digest::SHA1.hexdigest(params[:user][:user_password])
      if @tmp_user.save
        @info = "アカウントを作成しました"
        @comments= Comment.all
        render :action => "../home/index.html"
      else
        @info = "アカウントの作成に失敗しました"
        render :action => "new"
      end
    else
      @info = "rパスワードが違います"
      render :action => "new"
    end
  end
end
