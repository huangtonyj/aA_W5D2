class PostsController < ApplicationController

  def new
    @post = Post.new
    @subs = Sub.all
    render :new
  end

  def create
    @subs = Sub.all
    # @post = Post.new(post_params)
    @post = current_user.posts.new(post_params)
    @post.author_id = current_user.id

    # sub_ids = params[:post][:sub_ids][1..-1]
    # # sub_ids = post_params[:sub_ids][1..-1]
    # sub_ids.map! {|id| id.to_i}

    if @post.save
      # unless sub_ids.empty?
        # sub_ids.each do |sub_id|
        #   SpInterface.new(sub_id: sub_id, post_id: @post.id)
        # end
      # end

      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def edit
    @subs = Sub.all
    @post = Post.find(params[:id])
    render :edit
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def upvote
    @post = Post.find(params[:id])
    @post.vote_tally += 1
    @post.save
    redirect_to post_url(@post)
  end

  def downvote
    @post = Post.find(params[:id])
    @post.vote_tally -= 1
    @post.save
    redirect_to post_url(@post)
  end


  private
  def post_params
    params.require(:post).permit(:title, :content, :url, :sub_ids => [])
  end

end
