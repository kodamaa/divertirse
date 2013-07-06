# coding: utf-8

class PostsController < ApplicationController

  def index
    @posts = Post.all(:order => "created_at DESC")
    @posts = Post.page(params[:page])
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
  		render :action => "new"
  	end
  end

  def edit
  	@post = Post.find(params[:id])
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

end
