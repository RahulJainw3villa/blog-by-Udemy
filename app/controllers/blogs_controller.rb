class BlogsController < ApplicationController
    before_action :set_blog, only: [:show, :edit, :update, :destroy]   
    def index
        @blogs = Blog.all
        @count = @blogs.count
     end

    def new 
        @blog = Blog.new
    end

    def show
    end

    def edit
    end
    def create
        @blog = Blog.new(blog_params)
            if @blog.save
                redirect_to blogs_path, notice: 'Blog was successfully created'
            else
                render  :new, :status, :unprocessable_entity  
            end    
    end 

    def update
        if @blog.update(blog_params)
            redirect_to blogs_path, notice: 'Blog was Updated successfully'
        else
          render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @blog.destroy
        redirect_to root_path, notice: 'Blog was Deleted successfully' 
    end

    private
        def set_blog
            @blog = Blog.find(params[:id])
        end

        def blog_params
            params.require(:blog).permit(:title, :body)
        end


end
