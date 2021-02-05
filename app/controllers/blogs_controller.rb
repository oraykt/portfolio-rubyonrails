class BlogsController < ApplicationController
  before_action :set_blog, only: %i[show edit update destroy toggle_status]
  layout 'blog'
  access all: [ :show, :index ],
         user: { except: [ :new, :create, :update, :edit, :destroy, :toggle_status ]},
         site_admin: :all


  # GET /blogs
  def index
    @blogs = Blog.page(params[:page]).per(5)
    @page_title = 'Oray Kurt | Blogs'
  end

  # GET /blogs/:id
  def show
    @page_title = @blog.title
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/:id/edit
  def edit; end

  # POST /blogs
  def create
    @blog = Blog.new(blog_params)
    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Your post is now live!' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /blogs/:id
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /blogs/:id
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
    end
  end

  # GET /blogs/:id/toggle_status
  def toggle_status
    if @blog.draft?
      @blog.published!
    elsif @blog.published?
      @blog.draft!
    end
    redirect_to blogs_url, notice: 'Post status has been updated.'
  end

  private

  def set_blog
    @blog = Blog.friendly.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(
      :title,
      :body
    )
  end
end
