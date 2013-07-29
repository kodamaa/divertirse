# coding: utf-8

class PostsController < ApplicationController

  def category
    @categories = Category.all
    @array = []
    @array << ["カテゴリを選択して下さい"]
    @categories.each do |category|
       @array << [category.category_name, category.id]
    end
  end

  def load_users
    @users = []
    @users << ["投稿者を選択して下さい"]
    User.all.each do |user|
      @users << [user.user_name, user.id]
    end
  end
  def index
    @posts = Post.all(:order => "post_date DESC")
    @posts = Post.page(params[:page])
    @post = Post.new
    category
    load_users
    respond_to do |format|
      format.html
      format.json { render json: @posts }
    end
  end
  
  def show
    @post = Post.find(params[:id])
    @comment = @post.comments.build
  end

  def new
  	@post = Post.new

    @categories = Category.all
    @array = []
    @categories.each do |category|
       @array << [category.category_name, category.id]
    end

    @users = []
    User.all.each do |user| 
      @users << [user.user_name, user.id]
    end
  end

  def create
  	@post = Post.new(params[:post])
  	if @post.save
  		redirect_to posts_path, :notice => '作成されました'
  	else
       		load_users
		category
  		render :action => "new"
  	end
  end

  def edit
  	@post = Post.find(params[:id])
    category

    @users = []
    User.all.each do |user| 
      @users << [user.user_name, user.id]
    end
  end

  def update
  	@post = Post.find(params[:id])
  	if @post.update_attributes(params[:post])
  		redirect_to posts_path, :notice => '更新されました'
  	else
  		render :action => 'edit'
  	end
  end

  def destroy
  	@post = Post.find(params[:id])
  	@post.destroy
  	render :json => {:post => @post}
  end

  def search
    if ((params[:q] == "カテゴリを選択して下さい") && (params[:w] != "投稿者を選択して下さい"))
      @posts = Post.where('user_id like ?', params[:w]).page(params[:page]) 
    elsif ((params[:q] != "カテゴリを選択して下さい") && (params[:w] == "投稿者を選択して下さい"))
      @posts = Post.where('category_id like ?', params[:q]).page(params[:page]) 
    elsif ((params[:q] == "カテゴリを選択して下さい") && (params[:w] == "投稿者を選択して下さい"))
      @posts = Post.all(:order => "post_date DESC")
      @posts = Post.page(params[:page])
    else
      @posts = Post.where('category_id like ? and user_id like ?', params[:q], params[:w]).page(params[:page]) 
    end
    category
    load_users
    render "index"
  end

end
